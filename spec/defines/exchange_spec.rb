require 'spec_helper'

describe 'qpid::config::exchange' do
  let :title do
    'event'
  end

  context 'without ssl_cert' do
    let :params do
      {
        'exchange' => 'event',
      }
    end

    it do
      is_expected.to contain_exec('qpid-config ensure exchange event')
        .with_command('qpid-config -b amqp://localhost:5672 add exchange topic event --durable')
        .with_unless('qpid-config -b amqp://localhost:5672 exchanges event')
    end
  end

  context 'with ssl_cert' do
    let :params do
      {
        'exchange' => 'event',
        'ssl_cert' => '/path/to/cert.pem',
      }
    end

    it do
      is_expected.to contain_exec('qpid-config ensure exchange event')
        .with_command('qpid-config --ssl-certificate /path/to/cert.pem -b amqps://localhost:5671 add exchange topic event --durable')
        .with_unless('qpid-config --ssl-certificate /path/to/cert.pem -b amqps://localhost:5671 exchanges event')
    end
  end
end
