{application, tsung,
      [{description,  "tsung, a load testing tool for TCP/UDP servers"},
       {vsn,          "1.6.0"},
       {modules,      [
                       tsung,
                       ts_launcher,
                       ts_session_cache,
                       ts_client,
                       ts_client_rcv,
                       ts_client_sup,
                       ts_sup,
                       ts_stats,
                       ts_utils,
                       ts_profile
                      ]},
       {registered,   [
                       ts_launcher,
                       ts_session_cache
                      ]},
       {env,        [
                     {debug_level, 2},
                     {snd_size, 32768},      % send buffer size
                     {rcv_size, 32768},      % receive buffer size
                     {idle_timeout, 600000},  % 10min timeout
                     {global_ack_timeout, infinity}, % global ack timeout
                     {connect_timeout, 30000},
                     {max_warm_delay, 15000},
                     {dump, full},           % full or light
                     {parse_type, noparse},
                     {persistent, true},  % persistent connection: true or false
                     {mes_type, dynamic}, % dynamic or static
                     {nclients, 10},      % number of client to connect
                     {log_file, "./tsung.log"}, % log file name
                     %% use for IMS GET :
                     {http_modified_since_date, "Fri, 14 Nov 2003 02:43:31 GMT"},
                     {client_retry_timeout, 10}, % retry sending (in microsec.)
                     {max_retries, 3},        % number of max retries
                     {ssl_ciphers, negociate},

%%% -------- JABBER OPTIONS
                     {jabber_users, 2000000},
                     {jabber_username, "c"},
                     {jabber_password, "pas"},
                     {jabber_domain, "mydomain.com"},
%%% -------- WEBSOCKET OPTIONS
                     {websocket_path, "/chat"}
                    ]},
       {applications, [ kernel,stdlib,asn1,crypto,public_key,ssl,crypto]},
       {mod,          {tsung, []}}
      ]}.
