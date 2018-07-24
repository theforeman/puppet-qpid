require 'spec_helper'

describe 'qpid' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts.merge!(:systemd => true)
      end

      context 'without parameters' do
        it { is_expected.to contain_class('qpid::install') }
        it { is_expected.to contain_class('qpid::config') }
        it { is_expected.to contain_class('qpid::service') }

        it 'should install message store by default' do
          is_expected.to contain_package('qpid-cpp-server-linearstore')
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
