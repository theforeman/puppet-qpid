require 'spec_helper_acceptance'

describe 'qpid', :order => :defined do
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

    describe package('qpid-tools') do
      it { is_expected.to be_installed }
    end

    describe file('/var/lib/qpidd') do
      it { is_expected.to be_directory }
    end
  end

  context 'with ensure absent' do
    let(:pp) do
      <<-PUPPET
      class { 'qpid':
        ensure => 'absent',
      }
      PUPPET
    end

    it_behaves_like 'a idempotent resource'

    describe service('qpidd') do
      it { is_expected.not_to be_running }
      it { is_expected.not_to be_enabled }
    end

    describe port('5672') do
      it { is_expected.not_to be_listening }
    end

    describe package('qpid-tools') do
      it { is_expected.not_to be_installed }
    end

    describe file('/var/lib/qpidd') do
      it { is_expected.not_to exist }
    end
  end
end
