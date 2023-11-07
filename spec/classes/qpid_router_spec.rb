require 'spec_helper'

describe 'qpid::router' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { override_facts(os_facts, processors: {'count' => 2}) }

      context 'without parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('qpid::router::install') }

        it { is_expected.to contain_class('qpid::router::config').that_requires('Class[qpid::router::install]') }

        it 'should have header fragment' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+header.conf', [
            'router {',
            '    id: foo.example.com',
            '    mode: interior',
            '    worker-threads: 2',
            '}'
          ])
        end

        it 'should have footer fragment' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+footer.conf', [
            'address {',
            '    prefix: closest',
            '    distribution: closest',
            '}',
            'address {',
            '    prefix: multicast',
            '    distribution: multicast',
            '}',
            'address {',
            '    prefix: unicast',
            '    distribution: closest',
            '}',
            'address {',
            '    prefix: exclusive',
            '    distribution: closest',
            '}',
            'address {',
            '    prefix: broadcast',
            '    distribution: multicast',
            '}'
          ])
        end

        it 'should configure qdrouter.conf' do
          is_expected.to contain_concat('/etc/qpid-dispatch/qdrouterd.conf')
            .with_owner('root')
            .with_group('root')
            .with_mode('0644')
            .that_requires('Package[qpid-dispatch-router]')
            .that_notifies('Service[qdrouterd]')
        end

        it { is_expected.to contain_class('qpid::router::service').that_subscribes_to('Class[qpid::router::config]') }
        it 'should configure systemd' do
          is_expected.to contain_systemd__service_limits('qdrouterd.service')
            .with_ensure('absent')
            .that_notifies('Service[qdrouterd]')
        end
      end

      context 'with ensure absent' do
        let(:params) do
          {
            ensure: 'absent'
          }
        end

        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_class('qpid::router::install') }
        it { is_expected.to contain_package('qpid-dispatch-router').with_ensure('purged') }

        it { is_expected.to contain_class('qpid::router::config') }
        it { is_expected.to contain_concat('/etc/qpid-dispatch/qdrouterd.conf').with_ensure('absent') }

        it { is_expected.to contain_class('qpid::router::service') }
        it { is_expected.to contain_systemd__service_limits('qdrouterd.service').with_ensure('absent') }
        it 'should disable qdrouterd' do
          is_expected.to contain_service('qdrouterd')
            .with_ensure('false')
            .with_enable('false')
        end
      end

      context 'with services stopped' do
        let(:params) do
          {
            service_ensure: false
          }
        end

        it { is_expected.to compile.with_all_deps }

        it 'should disable qdrouterd' do
          is_expected.to contain_service('qdrouterd')
            .with_ensure('false')
            .with_enable('false')
        end
      end

      context 'with hello tuning params set' do
        let :params do
          {
            hello_interval: 10,
            hello_max_age: 30,
          }
        end

        it 'should change header.conf' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+header.conf', [
            'router {',
            '    id: foo.example.com',
            '    mode: interior',
            '    worker-threads: 2',
            '    helloInterval: 10',
            '    helloMaxAge: 30',
            '}'
          ])
        end
      end

      context 'with open files limit' do
        let :params do
          {
            open_file_limit: 10000,
          }
        end

        it 'should configure systemd' do
          is_expected.to contain_systemd__service_limits('qdrouterd.service')
            .with_ensure('present')
            .with_limits({'LimitNOFILE' => 10000})
        end
      end

      context 'should allow setting router mode' do
        let :params do
          {
            mode: 'standalone',
          }
        end

        it 'should have header fragment' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+header.conf', [
            'router {',
            '    id: foo.example.com',
            '    mode: standalone',
            '    worker-threads: 2',
            '}'
          ])
        end
      end
    end
  end
end
