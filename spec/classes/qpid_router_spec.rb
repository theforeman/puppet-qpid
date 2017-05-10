require 'spec_helper'

describe 'qpid::router' do
  on_os_under_test.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('qpid::router::install') }
      it { is_expected.to contain_class('qpid::router::config').that_requires('Class[qpid::router::install]') }
      it { is_expected.to contain_class('qpid::router::service').that_subscribes_to('Class[qpid::router::config]') }
      it { is_expected.to contain_concat('/etc/qpid-dispatch/qdrouterd.conf').that_requires('Package[qpid-dispatch-router]').that_notifies('Service[qdrouterd]') }
    end
  end
end
