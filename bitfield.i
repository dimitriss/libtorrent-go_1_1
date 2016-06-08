%{
#include <libtorrent/bitfield.hpp>
%}

%extend libtorrent::bitfield {
    void const* bytes() const {
        return (void*)self->bytes();
    }
}
%ignore libtorrent::bitfield::bytes;

%ignore libtorrent::bitfield::count;

%include <libtorrent/bitfield.hpp>
