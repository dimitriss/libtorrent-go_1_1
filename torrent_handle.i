%{
#include <libtorrent/torrent_info.hpp>
#include <libtorrent/torrent_handle.hpp>
#include <libtorrent/torrent_status.hpp>
#include <libtorrent/torrent.hpp>
#include <libtorrent/entry.hpp>
#include <libtorrent/announce_entry.hpp>
%}

%include <std_vector.i>
%include <std_pair.i>
%include <carrays.i>

// %template(stdVectorPeerInfo) std::vector<libtorrent::peer_info>;
%template(stdVectorPartialPieceInfo) std::vector<libtorrent::partial_piece_info>;
%template(stdVectorAnnounceEntry) std::vector<libtorrent::announce_entry>;
%template(stdVectorTorrentHandle) std::vector<libtorrent::torrent_handle>;

// Equaler interface
%rename(Equal) libtorrent::torrent_handle::operator==;
%rename(NotEqual) libtorrent::torrent_handle::operator!=;
%rename(Less) libtorrent::torrent_handle::operator<;

%array_class(libtorrent::block_info, block_info_list);

%extend libtorrent::torrent_handle {
    const libtorrent::torrent_info* torrent_file() {
        return self->torrent_file().get();
    }

    libtorrent::memory_storage* get_memory_storage() {
        return ((libtorrent::memory_storage*) self->get_storage_impl());
    }

    // void remove_piece(int piece) const {
    //     // m_picker->remove_piece(piece);
    //     //m_picker->restore_piece(piece);
    //     // self->m_torrent.m_picker->restore_piece(piece);
    //     libtorrent::torrent* t = self->native_handle().get();
    //     t->picker().restore_piece(piece);
    // }
}
%ignore libtorrent::torrent_handle::torrent_file;
%ignore libtorrent::torrent_handle::use_interface;

%extend libtorrent::partial_piece_info {
    block_info_list* blocks() {
        return block_info_list_frompointer(self->blocks);
    }
}
%ignore libtorrent::partial_piece_info::blocks;
%ignore libtorrent::hash_value;
%ignore libtorrent::block_info::peer; // linux_arm
%ignore libtorrent::block_info::set_peer; // linux_arm

%feature("director") torrent_handle;
%feature("director") torrent_info;
%feature("director") torrent_status;

%include <libtorrent/entry.hpp>
%include <libtorrent/torrent_info.hpp>
%include <libtorrent/torrent_handle.hpp>
%include <libtorrent/torrent_status.hpp>
#include <libtorrent/torrent.hpp>
%include <libtorrent/announce_entry.hpp>

// %extend libtorrent::piece_picker {
//     void remove_piece(int index) {
//         m_piece_map[index] = libtorrent::piece_pos::piece_open;
//     }
// }
