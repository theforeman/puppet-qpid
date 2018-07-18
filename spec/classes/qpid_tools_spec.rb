require 'spec_helper'

describe 'qpid::tools' do
  on_supported_os.each do |os, facts|
    context 'on redhat' do
      let :facts do
        facts.merge!(:systemd => true)
      end

      it { is_expected.to contain_package('qpid-tools').with_ensure('installed') }
    end
  end
end
