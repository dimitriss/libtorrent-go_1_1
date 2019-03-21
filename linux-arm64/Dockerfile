FROM cross-compiler:linux-arm64
MAINTAINER Dimitriss

RUN mkdir -p /build
WORKDIR /build

# Install Boost.System
ENV BOOST_VERSION 1.69.0
RUN curl -L https://dl.bintray.com/boostorg/release/${BOOST_VERSION}/source/boost_`echo ${BOOST_VERSION} | sed 's/\\./_/g'`.tar.bz2 | tar xvj && \
    cd boost_`echo ${BOOST_VERSION} | sed 's/\\./_/g'`/ && \
    ./bootstrap.sh --prefix=${CROSS_ROOT} && \
    echo "using gcc : linux : ${CROSS_TRIPLE}-c++ ;" > ${HOME}/user-config.jam && \
    ./b2 --with-date_time --with-system --with-chrono --with-random --prefix=${CROSS_ROOT} cxxflags=-fPIC toolset=gcc-linux link=static variant=release threading=multi target-os=linux install && \
    rm -rf ${HOME}/user-config.jam && \
    rm -rf `pwd`

# Install OpenSSL
ENV OPENSSL_VERSION 1.1.1b
RUN curl -L http://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz | tar xvz && \
    cd openssl-${OPENSSL_VERSION}/ && \
    CROSS_COMPILE=${CROSS_TRIPLE}- ./Configure threads no-shared linux-aarch64 -fPIC --prefix=${CROSS_ROOT} && \
    make && make install && \
    rm -rf `pwd`

# Install Golang
ENV BOOTSTRAP_GO_VERSION go1.4.3
ENV GO_VERSION go1.12.1
RUN cd /usr/local && \
    curl -L https://github.com/golang/go/archive/${BOOTSTRAP_GO_VERSION}.tar.gz | tar xvz && \
    cd /usr/local/go-${BOOTSTRAP_GO_VERSION}/src && \
    CC_FOR_TARGET=${CROSS_TRIPLE}-cc CXX_FOR_TARGET=${CROSS_TRIPLE}-c++ CGO_ENABLED=0 ./make.bash
RUN cd /usr/local && \
    curl -L https://github.com/golang/go/archive/${GO_VERSION}.tar.gz | tar xvz
RUN cd /usr/local/go-${GO_VERSION}/src && \
	echo ${GO_VERSION} > /usr/local/go-${GO_VERSION}/VERSION && \
    GOROOT_BOOTSTRAP=/usr/local/go-${BOOTSTRAP_GO_VERSION} CC_FOR_TARGET=${CROSS_TRIPLE}-cc CXX_FOR_TARGET=${CROSS_TRIPLE}-c++ GOOS=linux GOARCH=arm64 GOARM= CGO_ENABLED=1 ./make.bash
ENV PATH ${PATH}:/usr/local/go-${GO_VERSION}/bin


# Install SWIG
ENV SWIG_VERSION 3.0.12
RUN apt-get update && apt-get install -y automake libpcre3-dev bison yodl
RUN curl -L https://github.com/swig/swig/archive/rel-${SWIG_VERSION}.tar.gz | tar xvz && \
    cd swig-rel-${SWIG_VERSION}/ && \
    ./autogen.sh && \
    ./configure && make && make install && \
    rm -rf `pwd`

# Install libtorrent
ENV LIBTORRENT_VERSION RC_1_1
RUN echo "#define BOOST_SP_USE_PTHREADS" >> ${CROSS_ROOT}/include/boost/config/user.hpp
RUN curl -L https://github.com/arvidn/libtorrent/archive/`echo ${LIBTORRENT_VERSION} | sed 's/\\./_/g'`.tar.gz | tar xz && \
    cd libtorrent* && \
    ./autotool.sh && \
    \
    sed -i 's/$PKG_CONFIG openssl --libs-only-/$PKG_CONFIG openssl --static --libs-only-/' ./configure && \
    sed -i '/-msse4.2/d' configure && \
    sed -i '/-msse4.2/d' configure.ac && \
    touch configure.ac aclocal.m4 configure Makefile.am Makefile.in && \
    \
    PKG_CONFIG_PATH=${CROSS_ROOT}/lib/pkgconfig/ \
    CC=${CROSS_TRIPLE}-gcc CXX=${CROSS_TRIPLE}-g++ \
    CFLAGS="${CFLAGS} -Os -Wno-psabi -Wno-sign-compare -Wno-unused-function -Wno-unused-parameter -fPIC -std=c++11" \
    CXXFLAGS="${CXXFLAGS} ${CFLAGS}" \
    ./configure --disable-debug --enable-logging=no --enable-static --disable-shared --disable-deprecated-functions \
    --host=${CROSS_TRIPLE} --prefix=${CROSS_ROOT} \
    --with-boost=${CROSS_ROOT} --with-boost-libdir=${CROSS_ROOT}/lib && \
    \
    make && make install && \
    rm -rf `pwd`

WORKDIR /
RUN rm -rf /build
