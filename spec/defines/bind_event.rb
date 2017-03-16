require 'spec_helper'

describe 'qpid::bind_event' do
  let :title do
    '*.*'
  end

  context 'without ssl_cert' do
    let :params do
      {
        'queue' => 'myqueue',
      }
    end

    it do
      is_expected.to contain_exec('bind queue to exchange and filter messages that deal with *.*')
        .with_command('qpid-config  -b amqp://localhost:5671 bind event myqueue *.*')
        .with_onlyif('qpid-config  -b amqp://localhost:5671 exchanges event -r | grep *.*')
    end
  end

  context 'with ssl_cert' do
    let :params do
      {
        'queue'    => 'myqueue',
        'ssl_cert' => '/path/to/cert.pem',
      }
    end

    it do
      is_expected.to contain_exec('bind queue to exchange and filter messages that deal with *.*')
        .with_command('qpid-config --ssl-certificate /path/to/cert.pem -b ampqs://localhost:5671 bind event myqueue *.*')
        .with_onlyif('qpid-config --ssl-certificate /path/to/cert.pem -b ampqs://localhost:5671 exchanges event -r | grep *.*')
    end
  end
end
