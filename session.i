%{
#include <libtorrent/session.hpp>
#include <libtorrent/session_status.hpp>
#include <libtorrent/session_handle.hpp>
#include <libtorrent/settings_pack.hpp>
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
%ignore libtorrent::session_handle::get_peer_class_filter;
%ignore libtorrent::session_handle::dht_put_item;
%ignore libtorrent::session_handle::set_dht_storage;
%ignore libtorrent::session_handle::set_alert_queue_size_limit;
%ignore libtorrent::session_handle::add_extension;

%template(std_vector_torrent_handle) std::vector<libtorrent::torrent_handle>;
%template(stdVectorAlerts) std::vector<libtorrent::alert*>;

%extend libtorrent::session {
    libtorrent::session_handle* get_handle() {
        return self;
    }
}

%extend libtorrent::session_handle {
  std::vector<libtorrent::alert*> pop_alerts() {
    std::vector<libtorrent::alert*> alerts;
    self->pop_alerts(&alerts);
    return alerts;
  }
}

%extend libtorrent::session_handle {
    libtorrent::alert* pop_alert() {
        return self->pop_alert().release();
    }
}

%extend libtorrent::settings_pack {
  void set_bool(std::string const& name, bool val) {
    $self->set_bool(libtorrent::setting_by_name(name), val);
  };

  void set_int(std::string const& name, int val) {
    $self->set_int(libtorrent::setting_by_name(name), val);
  };

  void set_str(std::string const& name, std::string const& val) {
    $self->set_str(libtorrent::setting_by_name(name), val);
  };

  bool get_bool(std::string const& name) const { 
    return $self->get_bool(libtorrent::setting_by_name(name));
  }

  int get_int(std::string const& name) const { 
    return $self->get_int(libtorrent::setting_by_name(name));
  }

  std::string get_str(std::string const& name) const { 
    return $self->get_str(libtorrent::setting_by_name(name));
  }
}
%ignore libtorrent::session_handle::pop_alert;

%include "extensions.i"
%include <libtorrent/session.hpp>
%include <libtorrent/session_status.hpp>
%include <libtorrent/session_handle.hpp>
%include <libtorrent/settings_pack.hpp>