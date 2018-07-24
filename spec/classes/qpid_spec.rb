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
    end
  end
end
