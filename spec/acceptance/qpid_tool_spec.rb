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
end
