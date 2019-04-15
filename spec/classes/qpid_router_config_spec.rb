require 'spec_helper'

describe 'qpid::router::config' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts.merge(:processorcount => 2)
      end

      context 'without parameters' do
        let :pre_condition do
          'include qpid::router'
        end

        it { is_expected.to compile.with_all_deps }

        it 'should have header fragment' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+header.conf', [
            'router {',
            '    id: foo.example.com',
            '    mode: interior',
            '    worker-threads: 2',
            '}'
          ])
        end

        it 'should have footer fragment' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+footer.conf', [
            'address {',
            '    prefix: closest',
            '    distribution: closest',
            '}',
            'address {',
            '    prefix: multicast',
            '    distribution: multicast',
            '}',
            'address {',
            '    prefix: unicast',
            '    distribution: closest',
            '}',
            'address {',
            '    prefix: exclusive',
            '    distribution: closest',
            '}',
            'address {',
            '    prefix: broadcast',
            '    distribution: multicast',
            '}'
          ])
        end

        it 'should configure qdrouter.conf' do
          is_expected.to contain_concat('/etc/qpid-dispatch/qdrouterd.conf')
            .with_owner('root')
            .with_group('root')
            .with_mode('0644')
        end

        it 'should configure systemd' do
          is_expected.to contain_systemd__service_limits('qdrouterd.service')
            .with_ensure('absent')
            .that_notifies('Service[qdrouterd]')
        end
      end

      context 'with ssl profile' do
        let :pre_condition do
          'class {"qpid::router":}

           qpid::router::ssl_profile { "router-ssl":
             ca        => "/some/where/ca.pem",
             cert      => "/some/where/cert.pem",
             key       => "/some/where/key.pem",
             ciphers   => "ALL:!aNULL:!MD5:!DSS",
             protocols => ["TLSv1.1", "TLSv1.2"],
           }
          '
        end

        it 'should have ssl fragment' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+ssl_router-ssl.conf', [
            'ssl-profile {',
            '    name: router-ssl',
            '    cert-db: /some/where/ca.pem',
            '    cert-file: /some/where/cert.pem',
            '    key-file: /some/where/key.pem',
            '    ciphers: ALL:!aNULL:!MD5:!DSS',
            '    protocols: TLSv1.1 TLSv1.2',
            '}'
          ])
        end
      end

      context 'with listener' do
        let :pre_condition do
          'class {"qpid::router":}

           qpid::router::listener { "hub":
             role        => "inter-router",
             ssl_profile => "router-ssl",
             idle_timeout => 0,
           }
          '
        end

        it 'should have listener fragment' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+listener_hub.conf', [
            'listener {',
            '    port: 5672',
            '    sasl-mechanisms: ANONYMOUS',
            '    role: inter-router',
            '    ssl-profile: router-ssl',
            '    idle-timeout-seconds: 0',
            '}'
          ])
        end
      end

      context 'with connector' do
        let :pre_condition do
          'class {"qpid::router":}

           qpid::router::connector { "broker":
             host          => "127.0.0.1",
             port          => 5672,
             role          => "inter-router",
             sasl_username => "qpid_user",
             sasl_password => "qpid_password",
             ssl_profile   => "router-ssl",
             idle_timeout  => 0,
           }
          '
        end

        it 'should have connector fragment' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+connector_broker.conf', [
            'connector {',
            '    name: broker',
            '    host: 127.0.0.1',
            '    port: 5672',
            '    sasl-mechanisms: ANONYMOUS',
            '    sasl-username: qpid_user',
            '    sasl-password: qpid_password',
            '    role: inter-router',
            '    ssl-profile: router-ssl',
            '    idle-timeout-seconds: 0',
            '}'
          ])
        end
      end

      context 'with asymmetric link route' do
        let :pre_condition do
          'class {"qpid::router":}

           qpid::router::connector { "broker":
             host        => "127.0.0.1",
             port        => 5672,
             role        => "inter-router",
             ssl_profile => "router-ssl",
           }

           qpid::router::link_route { "broker-link":
             connection => "broker",
             direction  => "in",
             prefix     => "unicorn.",
           }'
        end

        it 'should have link_route fragment' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+link_route_broker-link.conf', [
            'linkRoute {',
            '    prefix: unicorn.',
            '    dir: in',
            '    connection: broker',
            '}'
          ])
        end
      end

      context 'with logging to file' do
        let :pre_condition do
          'class {"qpid::router":}

           qpid::router::log { "logging":
             module      => "DEFAULT",
             level       => "debug+",
             timestamp   => false,
             output      => "/var/log/qpid.log",
           }
          '
        end

        it 'should have log fragment' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+log_logging.conf', [
            'log {',
            '    module: DEFAULT',
            '    enable: debug+',
            '    timestamp: false',
            '    output: /var/log/qpid.log',
            '}'
          ])
        end
      end

      context 'with logging to syslog' do
        let :pre_condition do
          'class {"qpid::router":}

           qpid::router::log { "logging":
             module      => "DEFAULT",
             level       => "debug+",
             timestamp   => false,
             output      => "syslog",
           }
          '
        end

        it 'should have log fragment' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+log_logging.conf', [
            'log {',
            '    module: DEFAULT',
            '    enable: debug+',
            '    timestamp: false',
            '    output: syslog',
            '}'
          ])
        end
      end

      context 'with hello tuning params set' do
        let :pre_condition do
          'class {"qpid::router":
             hello_interval => 10,
             hello_max_age  => 30,
          }
          '
        end

        it 'should change header.conf' do
          verify_concat_fragment_exact_contents(catalogue, 'qdrouter+header.conf', [
            'router {',
            '    id: foo.example.com',
            '    mode: interior',
            '    worker-threads: 2',
            '    helloInterval: 10',
            '    helloMaxAge: 30',
            '}'
          ])
        end
      end

      context 'with open files limit' do
        let :pre_condition do
          'class {"qpid::router":
             open_file_limit => 10000,
          }
          '
        end

        it 'should configure systemd' do
          is_expected.to contain_systemd__service_limits('qdrouterd.service')
            .with_ensure('present')
            .with_limits({'LimitNOFILE' => 10000})
        end
      end
    end
  end
end
