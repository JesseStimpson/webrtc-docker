FROM ubuntu

RUN apt-get update \
  && apt-get install -y \
     make \
     git \
     vim \
     wget

RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

RUN apt-get install -y python

# Note for manual installations: Do not use `~` in your bashrc
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

# Accept ms fonts package
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true \
        | debconf-set-selections

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
