require 'spec_helper'

describe 'qpid::config::bind' do
  let :title do
    '*.*'
  end

  context 'without ssl_cert' do
    let :params do
      {
        'exchange' => 'event',
        'queue' => 'myqueue',
      }
    end

    on_supported_os.each do |os, os_facts|
      context "on #{os}" do
        let(:facts) { os_facts }
        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_qpid__config_cmd('bind queue to exchange and filter messages that deal with *.*')
            .with_command('bind event myqueue *.*')
            .with_unless('exchanges event -r | grep *.*')
            .with_hostname('localhost')
            .with_port(nil)
            .with_ssl_cert(nil)
            .with_ssl_key(nil)
        end
      end

      context 'with ssl_cert' do
        let :params do
          {
            'exchange' => 'event',
            'queue'    => 'myqueue',
            'hostname' => 'myhost.example.com',
            'port'     => 5671,
            'ssl_cert' => '/path/to/cert.pem',
            'ssl_key'  => '/path/to/key.pem',
          }
        end

        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_qpid__config_cmd('bind queue to exchange and filter messages that deal with *.*')
            .with_command('bind event myqueue *.*')
            .with_unless('exchanges event -r | grep *.*')
            .with_hostname('myhost.example.com')
            .with_port(5671)
            .with_ssl_cert('/path/to/cert.pem')
            .with_ssl_key('/path/to/key.pem')
        end
      end

      context 'with chaining' do
        let :params do
          {
            'exchange' => 'event',
            'queue' => 'myqueue',
          }
        end

        let :pre_condition do
          <<-EOS
      qpid::config::exchange { 'event': }
      qpid::config::queue { 'myqueue': }
          EOS
        end

        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_qpid__config_cmd('bind queue to exchange and filter messages that deal with *.*')
            .that_requires(['Qpid::Config::Exchange[event]', 'Qpid::Config::Queue[myqueue]'])
        end
      end
    end
  end
end
