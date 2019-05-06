# Dockerfile
#FROM alpine:latest
FROM frolvlad/alpine-glibc

# Supercronic install settings
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.1.8/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=be43e64c45acd6ec4fce5831e03759c89676a0ea


#0.77 is ok
ENV WEEDFS_VERSION='0.90'


ENV PKGNAME=graphicsmagick
ENV PKGVER=1.3.31
ENV PKGSOURCE=https://jaist.dl.sourceforge.net/project/graphicsmagick/graphicsmagick/$PKGVER/GraphicsMagick-$PKGVER.tar.gz

# Docker Build Arguments
ARG RESTY_HTTP_VERSION="0.13"
ARG RESTY_VERSION="1.11.2.3"
ARG RESTY_OPENSSL_VERSION="1.0.2k"
ARG RESTY_PCRE_VERSION="8.39"
ARG RESTY_J="1"
ARG RESTY_CONFIG_OPTIONS="\
    --with-http_stub_status_module \
    --with-http_addition_module \
    --with-pcre-jit \
    "


#--with-luajit-xcflags='-mno-sse4.2'

# These are not intended to be user-specified
ARG _RESTY_CONFIG_DEPS="--with-openssl=/tmp/openssl-${RESTY_OPENSSL_VERSION} --with-pcre=/tmp/pcre-${RESTY_PCRE_VERSION}"

RUN \
    apk add --no-cache  --virtual build-dependencies --update \
        build-base \
        gd-dev \
        geoip-dev \
        libxslt-dev \
        linux-headers \
        make \
        perl-dev \
        readline-dev \
        zlib-dev \
        g++ \
        gcc \
        libjpeg-turbo-dev \
        libxml2 \
        jasper-libs \
        giflib-dev tiff-dev \
        freetype-dev \
        libgcc libstdc++ \
        lzip \
        wget \
        ca-certificates \
        libjpeg-turbo-dev \
        libpng-dev \
        libtool \
    && apk add --no-cache \
        gd \
        geoip \
        libgcc \
        libxslt \
        zlib \
        perl \
        libgomp \
        libltdl \
        libpng \
        libjpeg \
        tiff \
        curl \
        libwebp-tools \
        freetype \
        libjpeg-turbo  && \
    wget -P /tmp https://github.com/$(curl -s -L https://github.com/chrislusf/seaweedfs/releases/${WEEDFS_VERSION} | egrep -o 'chrislusf/seaweedfs/releases/download/.*/linux_amd64.tar.gz') && \
    tar -C /usr/bin/ -xzvf /tmp/linux_amd64.tar.gz && \
    curl -fsSLO "$SUPERCRONIC_URL" && \
    echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - && \
    chmod +x "$SUPERCRONIC" && \
    mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" && \
    ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic \
    && cd /tmp \
    && curl -fSL https://www.openssl.org/source/openssl-${RESTY_OPENSSL_VERSION}.tar.gz -o openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
    && tar xzf openssl-${RESTY_OPENSSL_VERSION}.tar.gz \
    && curl -fSL https://ftp.pcre.org/pub/pcre/pcre-${RESTY_PCRE_VERSION}.tar.gz -o pcre-${RESTY_PCRE_VERSION}.tar.gz \
    && tar xzf pcre-${RESTY_PCRE_VERSION}.tar.gz \
    && curl -fSL https://openresty.org/download/openresty-${RESTY_VERSION}.tar.gz -o openresty-${RESTY_VERSION}.tar.gz \
    && tar xzf openresty-${RESTY_VERSION}.tar.gz \
    && cd /tmp/openresty-${RESTY_VERSION} \
    && ./configure -j${RESTY_J} ${_RESTY_CONFIG_DEPS} ${RESTY_CONFIG_OPTIONS} \
    && make -j${RESTY_J} \
    && make -j${RESTY_J} install \
    && cd /tmp \
    && wget $PKGSOURCE && \
    tar xzf GraphicsMagick-$PKGVER.tar.gz && \
    cd GraphicsMagick-$PKGVER && \
    ./configure \
      --build=$CBUILD \
      --host=$CHOST \
      --prefix=/usr \
      --sysconfdir=/etc \
      --mandir=/usr/share/man \
      --infodir=/usr/share/info \
      --localstatedir=/var \
      --enable-shared \
      --disable-static \
      --with-modules \
      --with-threads \
      --with-webp=yes \
      --with-tiff=yes \
      --with-jpeg=yes \
      --with-jp2=yes \
      --with-gs-font-dir=/usr/share/fonts/Type1 \
      --with-quantum-depth=16 && \
    make && \
    make install && \
    apk del build-dependencies && \
    rm -rf /tmp/* \
    && ln -sf /dev/stdout /usr/local/openresty/nginx/logs/access.log \
    && ln -sf /dev/stderr /usr/local/openresty/nginx/logs/error.log



# Add additional binaries into PATH for convenience
ENV PATH=$PATH:/usr/local/openresty/luajit/bin/:/usr/local/openresty/nginx/sbin/:/usr/local/openresty/bin/

RUN opm get bungle/lua-resty-session && opm get pintsized/lua-resty-http && opm get detailyang/lua-resty-cors

RUN mkdir -p /var/www/media-server

RUN mkdir -p /data/filerdb

RUN mkdir -p /var/www/weedfs

RUN chmod 777 /var/www/weedfs

ADD resty /var/www/media-server/resty/

VOLUME /data

COPY filer.toml /etc/seaweedfs/filer.toml

ADD run.sh run.sh
RUN chmod +x run.sh
CMD ./run.sh