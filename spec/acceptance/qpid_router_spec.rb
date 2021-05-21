require 'spec_helper_acceptance'

describe 'qpid::router' do
  context 'with default parameters' do
    it_behaves_like 'an idempotent resource' do
      let(:manifest) do
        <<-PUPPET
        include qpid::router
        PUPPET
      end
    end

    describe service('qdrouterd') do
      it { is_expected.to be_running }
      it { is_expected.to be_enabled }
    end

    describe package('qpid-dispatch-router') do
      it { is_expected.to be_installed }
    end
  end

  context 'with ensure absent' do
    it_behaves_like 'an idempotent resource' do
      let(:manifest) do
        <<-PUPPET
        class { 'qpid::router':
          ensure => 'absent',
        }
        PUPPET
      end
    end

    describe service('qdrouterd') do
      it { is_expected.not_to be_running }
      it { is_expected.not_to be_enabled }
    end

    describe package('qpid-dispatch-router') do
      it { is_expected.not_to be_installed }
    end
  end
end
