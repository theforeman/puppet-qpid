require 'spec_helper_acceptance'

describe 'qpid::router' do
  context 'with default parameters' do
    let(:pp) do
      <<-PUPPET
      include qpid::router
      PUPPET
    end

    it_behaves_like 'a idempotent resource'

    describe service('qdrouterd') do
      it { is_expected.to be_running }
      it { is_expected.to be_enabled }
    end

    describe package('qpid-dispatch-router') do
      it { is_expected.to be_installed }
    end
  end

  context 'with ensure absent' do
    let(:pp) do
      <<-PUPPET
      class { 'qpid::router':
        ensure => 'absent',
      }
      PUPPET
    end

    it_behaves_like 'a idempotent resource'

    describe service('qdrouterd') do
      it { is_expected.not_to be_running }
      it { is_expected.not_to be_enabled }
    end

    describe package('qpid-dispatch-router') do
      it { is_expected.not_to be_installed }
    end
  end
end
