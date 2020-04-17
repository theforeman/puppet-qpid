require 'spec_helper'

describe 'qpid::router::log' do
  let(:title) { 'example' }

  context 'without dependencies' do
    let :params do
      {
        config_file: '/etc/qpid-dispatch/qdrouterd.conf',
      }
    end

    context 'minimal' do
      it { is_expected.to compile.with_all_deps }
      it do
        verify_concat_fragment_exact_contents(catalogue, 'qdrouter+log_example.conf', [
          'log {',
          '    module: DEFAULT',
          '    enable: info+',
          '    timestamp: true',
          '    output: /var/log/qdrouterd.log',
          '}',
        ])
      end
    end

    context 'with logging to file' do
      let :params do
        super().merge(
          module: "DEFAULT",
          level: "debug+",
          timestamp: false,
          output: "/var/log/qpid.log",
        )
      end

      it 'should have log fragment' do
        verify_concat_fragment_exact_contents(catalogue, 'qdrouter+log_example.conf', [
          'log {',
          '    module: DEFAULT',
          '    enable: debug+',
          '    timestamp: false',
          '    output: /var/log/qpid.log',
          '}'
        ])
      end
    end

    context 'with logging to syslog' do
      let :params do
        super().merge(
          module: "DEFAULT",
          level: "debug+",
          timestamp: false,
          output: "syslog",
        )
      end

      it 'should have log fragment' do
        verify_concat_fragment_exact_contents(catalogue, 'qdrouter+log_example.conf', [
          'log {',
          '    module: DEFAULT',
          '    enable: debug+',
          '    timestamp: false',
          '    output: syslog',
          '}'
        ])
      end
    end
  end

  context 'with dependencies' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:pre_condition) { 'include qpid::router' }

        it { is_expected.to compile.with_all_deps }

        it do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+log_example.conf', [
            'log {',
            '    module: DEFAULT',
            '    enable: info+',
            '    timestamp: true',
            '    output: /var/log/qdrouterd.log',
            '}',
          ])
        end

        it do
          is_expected.to contain_concat('/etc/qpid-dispatch/qdrouterd.conf')
            .that_notifies('Service[qdrouterd]')
            .that_subscribes_to('Concat_fragment[qdrouter+log_example.conf]')
        end

        it do
          is_expected.to contain_concat_fragment('qdrouter+log_example.conf')
            .that_notifies('Concat[/etc/qpid-dispatch/qdrouterd.conf]')
        end
      end
    end
  end
end
