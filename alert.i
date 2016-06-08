%{
#include <libtorrent/alert.hpp>
%}

// std::auto_ptr causes problems, so we ignore the methods which use it
%ignore libtorrent::alert::clone;
%ignore libtorrent::alert::clone_impl;
%include <libtorrent/alert.hpp>
