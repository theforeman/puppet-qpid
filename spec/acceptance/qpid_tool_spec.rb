require 'spec_helper_acceptance'

describe 'qpid::tools' do
  context 'without parameters' do
    it_behaves_like 'an idempotent resource' do
      let(:manifest) do
        <<-PUPPET
        include qpid::tools
        PUPPET
      end
    end

    describe package('qpid-tools') do
      it { is_expected.to be_installed }
    end
  end

  context 'removing qpid-tools' do
    it_behaves_like 'an idempotent resource' do
      let(:manifest) do
        <<-PUPPET
        class { 'qpid::tools':
          ensure => 'absent',
        }
        PUPPET
      end
    end

    describe package('qpid-tools') do
      it { is_expected.not_to be_installed }
    end
  end
end
