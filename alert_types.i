%{
#include <libtorrent/alert_types.hpp>
%}

namespace libtorrent {
    class feed_handle;
    class feed_item;
    class stat;
    class size_t;
    class counters;
    class operation_t;
    class close_reason_t;
    class add_torrent_params;
    class settings_pack;
    class log_alert;
    class portmap_log_alert;
    class dht_lookup;
    class dht_routing_bucket;
}

%include "add_torrent_params.i"
