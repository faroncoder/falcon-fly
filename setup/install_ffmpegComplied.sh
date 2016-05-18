#!/bin/bash
export PATH=$PATH:/usr/local/bin

GET=( autoconf automake build-essential libass-dev libfreetype6-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo zlib1g-dev yasm libx264-dev cmake mercurial libmp3lame-dev libopus-dev )

for apt in "${GET[@]}"; do
      ff.apt.fetch $apt
done
FFMPG=$HOME/ffmpeg_sources
if [ ! -d "$FFMPG" ]; then
    mkdir $FFMPG
  fi
cd $FFMPG
hg clone https://bitbucket.org/multicoreware/x265
cd ~/ffmpeg_sources/x265/build/linux
PATH="/usr/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/usr" -DENABLE_SHARED:bool=off ../../source
make
make install
make distclean

cd $FFMPG
wget -O fdk-aac.tar.gz https://github.com/mstorsjo/fdk-aac/tarball/master
tar xzvf fdk-aac.tar.gz
rm fdk-aac.tar.gz
cd mstorsjo-fdk-aac*
autoreconf -fiv
./configure --prefix="/usr" --disable-shared
make
make install
make distclean

cs
wget http://storage.googleapis.com/downloads.webmproject.org/releases/webm/libvpx-1.4.0.tar.bz2
tar xjvf libvpx-1.4.0.tar.bz2
rm libvpx-1.4.0.tar.bz2
cd libvpx-1.4.0
PATH="$HOME/.local   sbin:$PATH"
./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests
make
make install
make clean

cd ~/ffmpeg_sources
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
#tar xjvf ffmpeg-snapshot.tar.bz2
#rm ffmpeg-snapshot.tar.bz2
cd ffmpeg
PKG_CONFIG_PATH="/usr/lib/pkgconfig"
./configure \
  --prefix="/usr" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I/usr/include" \
  --extra-ldflags="-L/usr/lib" \
  --bindir="/usr/bin" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree
make
make install
make distclean
hash -r

exit 0