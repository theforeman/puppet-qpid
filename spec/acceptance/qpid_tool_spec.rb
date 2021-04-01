require 'spec_helper_acceptance'

describe 'qpid::tools' do
  context 'without parameters' do
    let(:pp) do
      <<-PUPPET
      include qpid::tools
      PUPPET
    end

    it_behaves_like 'a idempotent resource'

    describe package('qpid-tools') do
      it { is_expected.to be_installed }
    end
  end

  context 'installing qpid' do
    let(:pp) do
      <<-PUPPET
      class { 'qpid::tools': } ->
      class { 'qpid': }
      PUPPET
    end

    it_behaves_like 'a idempotent resource'

    describe package('qpid-tools') do
      it { is_expected.to be_installed }
    end

    describe service('qpidd') do
      it { is_expected.to be_running }
      it { is_expected.to be_enabled }
    end

    describe port('5672') do
      it { is_expected.to be_listening }
    end
  end
end
