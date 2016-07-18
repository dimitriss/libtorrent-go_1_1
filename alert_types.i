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

%template(stdVectorChar) std::vector<char>;

%extend libtorrent::save_resume_data_alert {
    entry resume_data() const {
        return *self->resume_data;
    }
}
%ignore libtorrent::save_resume_data_alert::resume_data;

%ignore libtorrent::torrent_alert::torrent_alert;
%ignore libtorrent::peer_alert::peer_alert;
%ignore libtorrent::tracker_alert::tracker_alert;
%ignore libtorrent::peer_log_alert;
%ignore libtorrent::picker_log_alert;
%ignore libtorrent::torrent_log_alert;
%ignore libtorrent::log_alert;
%ignore libtorrent::portmap_log_alert;
%ignore libtorrent::listen_succeeded_alert;
%ignore libtorrent::session_stats_alert;
%ignore libtorrent::dht_get_peers_reply_alert;
%ignore libtorrent::torrent_error_alert;

%include "alert_types_mod.hpp"
%include "add_torrent_params.i"
