require 'spec_helper'

describe 'qpid' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'without parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('qpid::install') }
        it { is_expected.to contain_class('qpid::config') }
        it { is_expected.to contain_class('qpid::service') }

        it 'should install message store by default' do
          is_expected.to contain_package('qpid-cpp-server-linearstore')
        end

        it 'should configure systemd' do
          is_expected.to contain_systemd__service_limits('qpidd.service')
            .with_ensure('absent')
            .that_notifies('Service[qpidd]')
          is_expected.to contain_systemd__dropin_file('wait-for-port.conf')
            .with_ensure('absent')
            .that_notifies('Service[qpidd]')
        end
      end

      context 'with service limits' do
        let :params do
          {
            :open_file_limit => 100,
          }
        end

        it { is_expected.to compile.with_all_deps }

        it 'should configure systemd' do
          is_expected.to contain_systemd__service_limits('qpidd.service')
            .with_ensure('present')
            .with_limits('LimitNOFILE' => 100)
            .that_notifies('Service[qpidd]')
        end
      end

      context 'message store disabled' do
        let :params do
          {
            :server_store => false,
          }
        end

        it { is_expected.not_to contain_package('qpid-cpp-server-linearstore') }
      end

      context 'with ssl options' do
        let :params do
          {
            ssl: true,
            ssl_port: 5671,
            ssl_cert_db: "/etc/pki/katello/nssdb",
            ssl_cert_password_file: "/etc/pki/katello/nssdb/nss_db_password-file",
            ssl_cert_name: "broker",
            ssl_require_client_auth: true
          }
        end

        it 'should configure systemd to wait for the ssl port to be open' do
          is_expected.to contain_systemd__dropin_file('wait-for-port.conf')
            .with_ensure('present')
            .that_notifies('Service[qpidd]')
            .that_requires('Package[nc]')
          is_expected.to contain_package('nc')
            .with_ensure('present')
          verify_exact_contents(catalogue, '/etc/systemd/system/qpidd.service.d/wait-for-port.conf', [
            "[Service]",
            "ExecStartPost=/bin/bash -c 'while ! nc -z 127.0.0.1 5671; do sleep 1; done'"
          ])
        end
      end
    end
  end
end
