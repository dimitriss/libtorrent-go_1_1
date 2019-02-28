%{
#include <libtorrent/performance_counters.hpp>
#include <libtorrent/linked_list.hpp>
#include <libtorrent/hasher.hpp>
#include <libtorrent/tailqueue.hpp>
#include <libtorrent/io_service.hpp>
#include <libtorrent/storage_defs.hpp>
#include <libtorrent/settings_pack.hpp>
#include <libtorrent/peer_request.hpp>
#include <libtorrent/file.hpp>
#include <libtorrent/block_cache.hpp>
#include <libtorrent/resolve_links.hpp>
#include <libtorrent/disk_buffer_holder.hpp>
#include <libtorrent/disk_buffer_pool.hpp>
#include <libtorrent/disk_io_job.hpp>
#include <libtorrent/disk_io_thread.hpp>
#include <libtorrent/disk_job_pool.hpp>
#include <libtorrent/file_storage.hpp>
#include <libtorrent/file_pool.hpp>
#include <libtorrent/storage.hpp>
%}

%ignore libtorrent::disk_io_thread::do_read_and_hash;
%ignore libtorrent::disk_io_thread::do_resolve_links;

// SWiG voodoo for Windows and the dreaded "'iovec' has not been declared"...
namespace libtorrent {
  namespace file {}
}

%include <libtorrent/performance_counters.hpp>
%include <libtorrent/linked_list.hpp>
%include <libtorrent/hasher.hpp>
%include <libtorrent/tailqueue.hpp>
%include <libtorrent/io_service.hpp>
%include <libtorrent/storage_defs.hpp>
%include <libtorrent/settings_pack.hpp>
%include <libtorrent/peer_request.hpp>
%include <libtorrent/file.hpp>
%include <libtorrent/block_cache.hpp>
%include <libtorrent/resolve_links.hpp>
%include <libtorrent/disk_buffer_holder.hpp>
%include <libtorrent/disk_buffer_pool.hpp>
%include <libtorrent/disk_io_job.hpp>
%include <libtorrent/disk_io_thread.hpp>
%include <libtorrent/disk_job_pool.hpp>
%include <libtorrent/file_storage.hpp>
%include <libtorrent/file_pool.hpp>
%include <libtorrent/storage.hpp>

// %extend libtorrent::storage_interface {
  // virtual void set_size(boost::int64_t size) = 0;

  // char* read_string(boost::int64_t offset, int len, boost::int64_t piece_index) = 0;
  // char* read(int piece, int offset, int size) {
  //       libtorrent::storage_error ec;

  //       char* buf = new char[len];
  //       libtorrent::file::iovec_t v = {&buf, size_t(len)};
                        
  //       readv(&v, 1, piece_index, offset, 0, ec);

  //       return buf;
  // };

  // char* read(int piece, int offset, int size) {
  //   printf("Readstring interface: %d, off: %d, size: %d \n", piece, offset, size);
  // };
// }
