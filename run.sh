#!/bin/bash

# Set vips version
export VIPS_VERSION=7.38.5
export WEBP_VERSION=0.4.0
export ORC_VERSION=0.4.19
export BUILD_PATH=/tmp
export OUT_PATH=/app/vendor/vips
export PKG_CONFIG_PATH=$OUT_PATH/lib/pkgconfig:$PKG_CONFIG_PATH

echo $OUT_PATH

# Remove out path if already exists
rm -Rf $OUT_PATH

# Build path
cd $BUILD_PATH

###############
#     Orc     #
###############

# Download orc dependency
curl http://cgit.freedesktop.org/gstreamer/orc/snapshot/orc-$ORC_VERSION.tar.gz -o orc.tar.gz
# Unzip
tar -xvf orc.tar.gz
# Get into orc folder
cd orc-$ORC_VERSION
# Configure
./autogen.sh
# Configure build
./configure --prefix $OUT_PATH
# Make orc
make
# Install orc
make install

cd $BUILD_PATH

###############
#     WebP    #
###############

# Download webp dependency
curl https://webp.googlecode.com/files/libwebp-$WEBP_VERSION.tar.gz -o libwebp.tar.gz
# Unzip
tar -xvf libwebp.tar.gz
# Get into webp folder
cd libwebp-$WEBP_VERSION
# Configure build
./configure --prefix $OUT_PATH
# Make libwebp
make
# Install webp
make install

cd $BUILD_PATH

###############
#     VIPS    #
###############

# Download vips runtime
curl http://www.vips.ecs.soton.ac.uk/supported/current/vips-$VIPS_VERSION.tar.gz -o vips.tar.gz
# Unzip
tar -xvf vips.tar.gz
# Get into vips folder
cd vips-$VIPS_VERSION
# Configure build and output everything in /tmp/vips
./configure --prefix --without-fftw $OUT_PATH
# Make
make
# install vips
make install


###############
#    Output   #
###############

# Get into output path
cd $OUT_PATH
# Create dist package
tar -cvzf output.tar.gz *

pwd
open .