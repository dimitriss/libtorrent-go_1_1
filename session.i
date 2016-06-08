%{
#include <libtorrent/session.hpp>
#include <libtorrent/session_status.hpp>
#include <libtorrent/session_handle.hpp>
%}

%include <std_vector.i>

namespace libtorrent
{
    class io_service;
    class cache_status;
    class cached_piece_info;
    class feed_settings;
    class feed_handle;
    class peer_class_info;
    class peer_class_type_filter;
}

// These are problematic, so we ignore them.
%ignore libtorrent::session_handle::get_ip_filter;
%ignore libtorrent::session_handle::dht_put_item;
%ignore libtorrent::session_handle::set_dht_storage;
%ignore libtorrent::session_handle::set_alert_queue_size_limit;

%template(std_vector_torrent_handle) std::vector<libtorrent::torrent_handle>;

%extend libtorrent::session {
    libtorrent::session_handle* get_handle() {
        return self;
    }
}

%extend libtorrent::session_handle {
    libtorrent::alert* pop_alert() {
        return self->pop_alert().release();
    }
}
%ignore libtorrent::session_handle::pop_alert;

%include "extensions.i"
%include <libtorrent/session.hpp>
%include <libtorrent/session_status.hpp>
%include <libtorrent/session_handle.hpp>
