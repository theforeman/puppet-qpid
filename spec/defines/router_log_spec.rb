require 'spec_helper'

describe 'qpid::router::log' do
  let :title do
    'example'
  end

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
