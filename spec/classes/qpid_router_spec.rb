require 'spec_helper'
require 'deep_merge'

describe 'qpid::router' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        {processors: {'count' => 2}}.deep_merge(facts)
      end

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
    end
  end
end
