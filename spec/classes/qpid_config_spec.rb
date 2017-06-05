require 'spec_helper'

describe 'qpid::config' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'without parameters' do
        let :pre_condition do
          'class {"qpid": }'
        end

        it 'should create configuration file' do
          verify_exact_contents(catalogue, '/etc/qpid/qpidd.conf', [
            'log-enable=error+',
            'log-to-syslog=yes',
            'auth=no'
          ])
        end
      end

      context 'with interface' do
        let :pre_condition do
          'class {"qpid":
            interface => "lo",
          }'
        end

        it 'should create configuration file' do
          verify_exact_contents(catalogue, '/etc/qpid/qpidd.conf', [
            'log-enable=error+',
            'log-to-syslog=yes',
            'auth=no',
            'interface=lo'
          ])
        end
      end

      context 'with ssl options' do
        let :pre_condition do
          'class {"qpid":
            ssl                     => true,
            ssl_port                => 5671,
            ssl_cert_db             => "/etc/pki/katello/nssdb",
            ssl_cert_password_file  => "/etc/pki/katello/nssdb/nss_db_password-file",
            ssl_cert_name           => "broker",
            ssl_require_client_auth => true
          }'
        end

        it 'should create configuration file' do
          verify_exact_contents(catalogue, '/etc/qpid/qpidd.conf', [
            'log-enable=error+',
            'log-to-syslog=yes',
            'auth=no',
            'require-encryption=yes',
            'ssl-require-client-authentication=yes',
            'ssl-port=5671',
            'ssl-cert-db=/etc/pki/katello/nssdb',
            'ssl-cert-password-file=/etc/pki/katello/nssdb/nss_db_password-file',
            'ssl-cert-name=broker'
          ])
        end
      end
  
      context 'with session-max-unacked' do
        let :pre_condition do
          'class {"qpid":
            session_unacked => 10,
          }'
        end

        it 'should create configuration file' do
          verify_exact_contents(catalogue, '/etc/qpid/qpidd.conf', [
            'log-enable=error+',
            'log-to-syslog=yes',
            'auth=no',
            'session-max-unacked=10'
          ])
        end
      end

      context 'with wcache_page_size' do
        let :pre_condition do
          'class {"qpid":
            wcache_page_size => 4,
          }'
        end

        it 'should create configuration file' do
          verify_exact_contents(catalogue, '/etc/qpid/qpidd.conf', [
            'log-enable=error+',
            'log-to-syslog=yes',
            'auth=no',
            'wcache-page-size=4'
          ])
        end
      end

      context 'with max-connections' do
        let :pre_condition do
          'class {"qpid":
              max_connections => 2000,
            }'
        end

        it 'should create configuration file' do
          verify_exact_contents(catalogue, '/etc/qpid/qpidd.conf', [
            'log-enable=error+',
            'log-to-syslog=yes',
            'auth=no',
            'max-connections=2000'
          ])
        end
      end
    end
  end
end
