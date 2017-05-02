require 'spec_helper'

describe 'qpid::router::ssl_profile' do
  let :title do
    'example'
  end

  context 'with minimal parameters' do
    let :params do
      {
        'ca' => '/ca.pem',
        'cert' => '/cert.pem',
        'key' => '/key.pem',
        'config_file' => '/etc/qpid-dispatch/qdrouterd.conf',
      }
    end

    it { is_expected.to compile.with_all_deps }
    it do
      verify_concat_fragment_exact_contents(catalogue, 'qdrouter+ssl_example.conf', [
        'ssl-profile {',
        '    name: example',
        '    cert-db: /ca.pem',
        '    cert-file: /cert.pem',
        '    key-file: /key.pem',
        '}',
      ])
    end
  end

  context 'with password' do
    let :params do
      {
        'ca' => '/ca.pem',
        'cert' => '/cert.pem',
        'key' => '/key.pem',
        'config_file' => '/etc/qpid-dispatch/qdrouterd.conf',
        'password' => 'secret',
      }
    end

    it { is_expected.to compile.with_all_deps }
    it do
      verify_concat_fragment_exact_contents(catalogue, 'qdrouter+ssl_example.conf', [
        'ssl-profile {',
        '    name: example',
        '    cert-db: /ca.pem',
        '    cert-file: /cert.pem',
        '    key-file: /key.pem',
        '    password: secret',
        '}',
      ])
    end
  end
end
