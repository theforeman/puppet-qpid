require 'spec_helper'

describe 'qpid::router::log' do
  let :title do
    'example'
  end

  context 'minimal' do
    let :params do
      {
        'config_file' => '/etc/qpid-dispatch/qdrouterd.conf',
      }
    end

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

  context 'with dependencies' do
    let :facts do
      on_supported_os['redhat-7-x86_64']
    end

    let :pre_condition do
      'include qpid::router'
    end

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

    it { is_expected.to contain_concat_fragment('qdrouter+log_example.conf') }

    it do
      is_expected.to contain_concat('/etc/qpid-dispatch/qdrouterd.conf')
        .that_notifies('Service[qdrouterd]')
        .that_subscribes_to('Concat_fragment[qdrouter+log_example.conf]')
    end
  end
end
