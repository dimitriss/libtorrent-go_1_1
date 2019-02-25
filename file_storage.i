%{
#include <libtorrent/file_storage.hpp>
#include <libtorrent/settings_pack.hpp>
%}

namespace libtorrent
{
    class peer_request;
}

%include <libtorrent/storage_defs.hpp>
%include <libtorrent/file_storage.hpp>
%include <libtorrent/settings_pack.hpp>
