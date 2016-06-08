// +build android

package libtorrent

// #cgo pkg-config: libtorrent-rasterbar openssl
// #cgo android CXXFLAGS: -Wno-deprecated-declarations
// #cgo android LDFLAGS: -lm -ldl -lstdc++
import "C"
