require 'spec_helper_acceptance'

describe 'qpid' do
  context 'with default parameters' do
    let(:pp) do
      <<-PUPPET
      include qpid
      PUPPET
    end

    it_behaves_like 'a idempotent resource'

    describe service('qpidd') do
      it { is_expected.to be_running }
      it { is_expected.to be_enabled }
    end

    describe port('5672') do
      it { is_expected.to be_listening }
    end
  end
end
