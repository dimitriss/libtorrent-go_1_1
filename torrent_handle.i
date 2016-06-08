%{
#include <libtorrent/torrent_handle.hpp>
#include <libtorrent/torrent_info.hpp>
#include <libtorrent/torrent_status.hpp>
#include <libtorrent/entry.hpp>
#include <libtorrent/announce_entry.hpp>
%}

%include <std_vector.i>
%include <std_pair.i>
%include <carrays.i>

%template(std_vector_partial_piece_info) std::vector<libtorrent::partial_piece_info>;
%template(std_vector_announce_entry) std::vector<libtorrent::announce_entry>;
%template(std_vector_int) std::vector<int>;
%template(std_vector_size_type) std::vector<long long>;
%template(std_pair_int_int) std::pair<int, int>;
%template(std_pair_string_int) std::pair<std::string, int>;

// Equaler interface
%rename(Equal) libtorrent::torrent_handle::operator==;
%rename(NotEqual) libtorrent::torrent_handle::operator!=;
%rename(Less) libtorrent::torrent_handle::operator<;

%array_class(libtorrent::block_info, block_info_list);

%extend libtorrent::torrent_handle {
    const libtorrent::torrent_info* torrent_file() {
        return self->torrent_file().get();
    }
}
%ignore libtorrent::torrent_handle::torrent_file;

%extend libtorrent::partial_piece_info {
    block_info_list* blocks() {
        return block_info_list_frompointer(self->blocks);
    }
}
%ignore libtorrent::partial_piece_info::blocks;
%ignore libtorrent::hash_value;

%include <libtorrent/torrent_handle.hpp>
%include <libtorrent/torrent_info.hpp>
%include <libtorrent/torrent_status.hpp>
%include <libtorrent/entry.hpp>
%include <libtorrent/announce_entry.hpp>
