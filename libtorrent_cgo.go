// +build !android

package libtorrent

// #cgo pkg-config: --static libtorrent-rasterbar openssl
// #cgo darwin LDFLAGS: -lm -lstdc++
// #cgo linux CXXFLAGS: -I/usr/include/libtorrent -I/usr/include -Wno-deprecated-declarations
// #cgo linux LDFLAGS: -lm -lstdc++ -ldl -lrt
// #cgo windows CXXFLAGS: -DIPV6_TCLASS=39 -DSWIGWIN -D_WIN32_WINNT=0x0501 -D__MINGW32__ -I/usr/i686-pc-mingw32/usr/include -I/usr/i686-pc-mingw32/usr/include/libtorrent
// #cgo windows LDFLAGS: -static-libgcc -static-libstdc++ -L/usr/i686-pc-mingw32/usr/lib
import "C"
