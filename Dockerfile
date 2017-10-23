FROM ubuntu

RUN apt-get update \
  && apt-get install -y \
     make \
     git \
     vim \
     wget

RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

RUN apt-get install -y python

ENV PATH="/depot_tools:$PATH"

RUN mkdir webrtc-checkout

WORKDIR /webrtc-checkout

RUN fetch --nohooks webrtc

RUN apt-get install -y \
        xz-utils \
        lbzip2

RUN gclient sync

RUN apt-get install -y \
        lsb-release \
        sudo

# Optional step. Copied from install-build-deps.sh for Docker intermediate
RUN apt-get install -y \
    acl adwaita-icon-theme apache2 apache2-bin apache2-data apache2-utils at \
    at-spi2-core autoconf automake autotools-dev binutils bison bsdmainutils \
    build-essential bzip2 bzip2-doc cabextract cdbs colord colord-data \
    comerr-dev cpp cpp-5 curl dbus dbus-x11 dconf-gsettings-backend \
    dconf-service dctrl-tools debhelper debugedit devscripts \
    dh-strip-nondeterminism dh-translations diffstat dpkg-dev dput elfutils \
    fakeroot ffmpeg flex fontconfig fontconfig-config fonts-beng \
    fonts-beng-extra fonts-dejavu-core fonts-deva fonts-deva-extra fonts-gargi   \
    fonts-gubbi fonts-gujr fonts-gujr-extra fonts-guru fonts-guru-extra          \
    fonts-indic fonts-ipafont fonts-ipafont-gothic fonts-ipafont-mincho          \
    fonts-kalapi fonts-knda fonts-lato fonts-liberation                          \
    fonts-lohit-beng-assamese fonts-lohit-beng-bengali fonts-lohit-deva          \
    fonts-lohit-gujr fonts-lohit-guru fonts-lohit-knda fonts-lohit-mlym          \
    fonts-lohit-orya fonts-lohit-taml fonts-lohit-taml-classical                 \
    fonts-lohit-telu fonts-mlym fonts-nakula fonts-navilu fonts-orya             \
    fonts-orya-extra fonts-pagul fonts-sahadeva fonts-samyak-deva                \
    fonts-samyak-gujr fonts-samyak-mlym fonts-samyak-taml fonts-sarai fonts-smc  \
    fonts-taml fonts-telu fonts-telu-extra fonts-thai-tlwg fonts-tlwg-garuda     \
    fonts-tlwg-garuda-ttf fonts-tlwg-kinnari fonts-tlwg-kinnari-ttf              \
    fonts-tlwg-laksaman fonts-tlwg-laksaman-ttf fonts-tlwg-loma                  \
    fonts-tlwg-loma-ttf fonts-tlwg-mono fonts-tlwg-mono-ttf fonts-tlwg-norasi    \
    fonts-tlwg-norasi-ttf fonts-tlwg-purisa fonts-tlwg-purisa-ttf                \
    fonts-tlwg-sawasdee fonts-tlwg-sawasdee-ttf fonts-tlwg-typewriter            \
    fonts-tlwg-typewriter-ttf fonts-tlwg-typist fonts-tlwg-typist-ttf            \
    fonts-tlwg-typo fonts-tlwg-typo-ttf fonts-tlwg-umpush fonts-tlwg-umpush-ttf  \
    fonts-tlwg-waree fonts-tlwg-waree-ttf g++ g++-5 gcc gcc-5 gconf-service      \
    gconf-service-backend gconf2 gconf2-common gettext gettext-base giblib1      \
    gir1.2-atk-1.0 gir1.2-atspi-2.0 gir1.2-freedesktop gir1.2-gconf-2.0          \
    gir1.2-gdkpixbuf-2.0 gir1.2-glib-2.0 gir1.2-gnomekeyring-1.0 gir1.2-gtk-2.0  \
    gir1.2-gtk-3.0 gir1.2-pango-1.0 git-core git-svn glib-networking             \
    glib-networking-common glib-networking-services gperf groff-base             \
    gsettings-desktop-schemas hardening-includes hicolor-icon-theme              \
    humanity-icon-theme i965-va-driver icu-devtools intltool intltool-debian     \
    iso-codes javascript-common krb5-multidev lib32gcc1 lib32stdc++6 libaacs0    \
    libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl     \
    libapache2-mod-php7.0 libapr1 libaprutil1 libaprutil1-dbd-sqlite3            \
    libaprutil1-ldap libapt-inst2.0 libapt-pkg-perl libarchive-zip-perl          \
    libarchive13 libasan2 libasm1 libasound2 libasound2-data libasound2-dev      \
    libasprintf-dev libasprintf0v5 libass5 libasyncns0 libatk-bridge2.0-0        \
    libatk-bridge2.0-dev libatk1.0-0 libatk1.0-data libatk1.0-dev libatomic1     \
    libatspi2.0-0 libatspi2.0-dev libauthen-sasl-perl libav-tools                \
    libavahi-client3 libavahi-common-data libavahi-common3 libavc1394-0          \
    libavcodec-ffmpeg56 libavdevice-ffmpeg56 libavfilter-ffmpeg5                 \
    libavformat-ffmpeg56 libavresample-ffmpeg2 libavutil-ffmpeg54 libbdplus0     \
    libbison-dev libblas-common libblas3 libbluetooth-dev libbluetooth3          \
    libbluray1 libboost-filesystem1.58.0 libboost-system1.58.0 libbrlapi-dev     \
    libbrlapi0.6 libbs2b0 libbz2-dev libc-dev-bin libc6-dev libc6-i386 libcaca0  \
    libcairo-gobject2 libcairo-script-interpreter2 libcairo2 libcairo2-dev       \
    libcap-dev libcap-ng0 libcapnp-0.5.3 libcc1-0 libcdio-cdda1                  \
    libcdio-paranoia1 libcdio13 libcgi-fast-perl libcgi-pm-perl libcilkrts5      \
    libclass-accessor-perl libclone-perl libcolord2 libcolorhug2 libcroco3       \
    libcrystalhd3 libcups2 libcups2-dev libcurl4-gnutls-dev libdata-alias-perl   \
    libdatrie1 libdbus-1-3 libdbus-1-dev libdbus-glib-1-2 libdc1394-22           \
    libdconf-dev libdconf-doc libdconf1 libdigest-hmac-perl libdistro-info-perl  \
    libdpkg-perl libdrm-amdgpu1 libdrm-dev libdrm-intel1 libdrm-nouveau2         \
    libdrm-radeon1 libdrm2 libdw1 libegl1-mesa libegl1-mesa-dev libelf-dev       \
    libelf1 libemail-valid-perl libencode-locale-perl libepoxy-dev libepoxy0     \
    libexif12 libexpat1-dev libexporter-tiny-perl libfakeroot libfcgi-perl       \
    libffi-dev libfile-basedir-perl libfile-fcntllock-perl libfile-listing-perl  \
    libfile-stripnondeterminism-perl libfl-dev libflac8 libflite1                \
    libfont-afm-perl libfontconfig1 libfontconfig1-dev libfontenc1 libfreetype6  \
    libfreetype6-dev libfribidi0 libgbm-dev libgbm1 libgcc-5-dev libgconf-2-4    \
    libgconf2-dev libgconf2-doc libgd3 libgdk-pixbuf2.0-0                        \
    libgdk-pixbuf2.0-common libgdk-pixbuf2.0-dev libgettextpo-dev libgettextpo0  \
    libgfortran3 libgif7 libgirepository-1.0-1 libgl1-mesa-dev libgl1-mesa-dri   \
    libgl1-mesa-glx libglapi-mesa libgles2-mesa libgles2-mesa-dev libglib2.0-0   \
    libglib2.0-bin libglib2.0-data libglib2.0-dev libglu1-mesa libglu1-mesa-dev  \
    libgme0 libgmp-dev libgmpxx4ldbl libgnome-keyring-common                     \
    libgnome-keyring-dev libgnome-keyring0 libgomp1 libgphoto2-6 libgphoto2-l10n \
    libgphoto2-port12 libgraphite2-3 libgsm1 libgssrpc4 libgtk-3-0 libgtk-3-bin  \
    libgtk-3-common libgtk-3-dev libgtk2.0-0 libgtk2.0-bin libgtk2.0-common      \
    libgtk2.0-dev libgtkglext1 libgudev-1.0-0 libgusb2 libharfbuzz-dev           \
    libharfbuzz-gobject0 libharfbuzz-icu0 libharfbuzz0b libhtml-form-perl        \
    libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl                  \
    libhtml-tree-perl libhttp-cookies-perl libhttp-daemon-perl libhttp-date-perl \
    libhttp-message-perl libhttp-negotiate-perl libice-dev libice6 libicu-dev \
    libicu55 libid3tag0 libiec61883-0 libieee1284-3 libilmbase12 libimlib2 \
    libio-html-perl libio-pty-perl libio-socket-inet6-perl libio-socket-ssl-perl \
    libio-string-perl libipc-run-perl libipc-system-simple-perl libisl15 libitm1 \
    libjack-jackd2-0 libjasper1 libjbig0 libjpeg-dev libjpeg-turbo8 \
    libjpeg-turbo8-dev libjpeg8 libjpeg8-dev libjs-jquery libjs-sphinxdoc \
    libjs-underscore libjson-c2 libjson-glib-1.0-0 libjson-glib-1.0-common \
    libkadm5clnt-mit9 libkadm5srv-mit9 libkdb5-8 libkrb5-dev liblapack3 \
    liblcms2-2 liblist-moreutils-perl libllvm4.0 liblocale-gettext-perl liblsan0 \
    libltdl7 liblua5.1-0 liblua5.2-0 liblwp-mediatypes-perl \
    liblwp-protocol-https-perl liblzo2-2 libmail-sendmail-perl libmailtools-perl \
    libmirclient-dev libmirclient9 libmircommon-dev libmircommon7 \
    libmircookie-dev libmircookie2 libmircore-dev libmircore1 libmirprotobuf3 \
    libmodplug1 libmp3lame0 libmpc3 libmpfr4 libmpx0 libmspack0 libnet-dns-perl \
    libnet-domain-tld-perl libnet-http-perl libnet-ip-perl libnet-smtp-ssl-perl \
    libnet-ssleay-perl libnspr4 libnspr4-dev libnss3 libnss3-dev libnss3-nssdb \
    libnuma1 libobrender32 libobt2 libogg0 libopenal-data libopenal1 \
    libopencv-calib3d2.4v5 libopencv-contrib2.4v5 libopencv-core2.4v5 \
    libopencv-features2d2.4v5 libopencv-flann2.4v5 libopencv-highgui2.4v5 \
    libopencv-imgproc2.4v5 libopencv-legacy2.4v5 libopencv-ml2.4v5 \
    libopencv-objdetect2.4v5 libopencv-photo2.4v5 libopencv-video2.4v5 \
    libopenexr22 libopenjpeg5 libopus0 liborc-0.4-0 libpam-systemd libpam0g-dev \
    libpango-1.0-0 libpango1.0-0 libpango1.0-dev libpangocairo-1.0-0 \
    libpangoft2-1.0-0 libpangox-1.0-0 libpangoxft-1.0-0 \
    libparse-debianchangelog-perl libpci-dev libpci3 libpciaccess0 libpcre16-3 \
    libpcre3-dev libpcre32-3 libpcrecpp0v5 libperlio-gzip-perl libpipeline1 \
    libpixman-1-0 libpixman-1-dev libpng12-0 libpng12-dev libpolkit-agent-1-0 \
    libpolkit-backend-1-0 libpolkit-gobject-1-0 libpostproc-ffmpeg53 \
    libprotobuf-dev libprotobuf-lite9v5 libprotobuf9v5 libproxy1v5 \
    libpthread-stubs0-dev libpulse-dev libpulse-mainloop-glib0 libpulse0 \
    libpython-dev libpython2.7 libpython2.7-dev libquadmath0 libraw1394-11 \
    librest-0.7-0 librpm3 librpmbuild3 librpmio3 librpmsign3 librsvg2-2 \
    librsvg2-common libruby2.3 libsamplerate0 libsane libsane-common \
    libschroedinger-1.0-0 libsctp-dev libsctp1 libsdl1.2debian libsensors4 \
    libserf-1-1 libshine3 libsigsegv2 libslang2 libsm-dev libsm6 libsnappy1v5 \
    libsndfile1 libsocket6-perl libsodium18 libsoup-gnome2.4-1 libsoup2.4-1 \
    libsoxr0 libspeechd-dev libspeechd2 libspeex1 libsqlite3-dev libssh-gcrypt-4 \
    libssl-dev libssl-doc libstartup-notification0 libstdc++-5-dev \
    libsub-name-perl libsvn-perl libsvn1 libswresample-ffmpeg1 \
    libswscale-ffmpeg3 libsys-hostname-long-perl libtbb2 libterm-readkey-perl \
    libtext-levenshtein-perl libthai-data libthai0 libtheora0 libtiff5 \
    libtimedate-perl libtsan0 libtwolame0 libtxc-dxtn-s2tc0 libubsan0 \
    libudev-dev libunistring0 libunity-gtk2-parser0 liburi-perl libusb-1.0-0 \
    libv4l-0 libv4lconvert0 libva1 libvdpau1 libvorbis0a libvorbisenc2 libvpx3 \
    libwavpack1 libwayland-bin libwayland-client0 libwayland-cursor0 \
    libwayland-dev libwayland-egl1-mesa libwayland-server0 libwebp5 libwrap0 \
    libwww-perl libwww-robotrules-perl libx11-dev libx11-doc libx11-xcb-dev \
    libx11-xcb1 libx264-148 libx265-79 libxau-dev libxaw7 libxcb-dri2-0 \
    libxcb-dri2-0-dev libxcb-dri3-0 libxcb-dri3-dev libxcb-glx0 libxcb-glx0-dev \
    libxcb-present-dev libxcb-present0 libxcb-randr0 libxcb-randr0-dev \
    libxcb-render0 libxcb-render0-dev libxcb-shape0 libxcb-shape0-dev \
    libxcb-shm0 libxcb-shm0-dev libxcb-sync-dev libxcb-sync1 libxcb-util1 \
    libxcb-xfixes0 libxcb-xfixes0-dev libxcb1-dev libxcomposite-dev \
    libxcomposite1 libxcursor-dev libxcursor1 libxdamage-dev libxdamage1 \
    libxdmcp-dev libxext-dev libxfixes-dev libxfixes3 libxfont1 libxft-dev \
    libxft2 libxi-dev libxi6 libxinerama-dev libxinerama1 libxkbcommon-dev \
    libxkbcommon0 libxml-parser-perl libxml2 libxml2-dev libxml2-utils libxmu6 \
    libxpm4 libxrandr-dev libxrandr2 libxrender-dev libxrender1 libxshmfence-dev \
    libxshmfence1 libxslt1-dev libxslt1.1 libxss-dev libxss1 libxt-dev libxt6 \
    libxtst-dev libxtst6 libxv1 libxvidcore4 libxxf86dga1 libxxf86vm-dev \
    libxxf86vm1 libyaml-0-2 libyaml-libyaml-perl libyaml-perl libzmq5 \
    libzvbi-common libzvbi0 lintian linux-libc-dev locales m4 man-db manpages \
    manpages-dev mesa-common-dev mesa-vdpau-drivers nettle-dev obconf openbox \
    patchutils php-common php7.0-cgi php7.0-cli php7.0-common php7.0-json \
    php7.0-opcache php7.0-readline pkg-config po-debconf policykit-1 psmisc \
    python-apt-common python-cffi-backend python-cherrypy3 python-crypto \
    python-cryptography python-dev python-enum34 python-idna python-ipaddress \
    python-numpy python-opencv python-openssl python-pkg-resources python-psutil \
    python-pyasn1 python-repoze.lru python-routes python-scour python-six \
    python-webob python-xdg python-yaml python2.7-dev python3-apt \
    python3-chardet python3-dbus python3-debian python3-distupgrade python3-gi \
    python3-magic python3-pkg-resources python3-six python3-update-manager rake \
    realpath rpm rpm-common rpm2cpio ruby ruby-did-you-mean ruby-minitest \
    ruby-net-telnet ruby-power-assert ruby-test-unit ruby2.3 \
    rubygems-integration scrot sgml-base shared-mime-info ssl-cert strace \
    subversion t1utils tcpd ttf-dejavu-core 

# Accept ms fonts package
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true \
        | debconf-set-selections

RUN apt-get install -y \
    ttf-mscorefonts-installer tzdata \
    ubuntu-mono ubuntu-release-upgrader-core ucf unity-gtk-module-common \
    unity-gtk2-module unzip update-manager-core update-notifier-common \
    va-driver-all vdpau-driver-all vdpau-va-driver wdiff x11-common x11-utils \
    x11proto-composite-dev x11proto-core-dev x11proto-damage-dev \
    x11proto-dri2-dev x11proto-fixes-dev x11proto-gl-dev x11proto-input-dev \
    x11proto-kb-dev x11proto-randr-dev x11proto-record-dev x11proto-render-dev \
    x11proto-scrnsaver-dev x11proto-xext-dev x11proto-xf86vidmode-dev \
    x11proto-xinerama-dev xcompmgr xdg-user-dirs xfonts-encodings xfonts-utils \
    xkb-data xml-core xorg-sgml-doctools xtrans-dev zip zlib1g-dev \
    libsystemd0 libudev1 systemd

RUN ./src/build/install-build-deps.sh \
        --no-prompt \
        --no-arm \
        --no-nacl \
        --no-chromeos-fonts

WORKDIR /webrtc-checkout/src

RUN gn gen out/Default

RUN ninja -C out/Default

WORKDIR /

CMD ["/bin/bash"]
#
