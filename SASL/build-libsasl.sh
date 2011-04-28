#!/bin/sh

#  Automatic build script for libsasl2 
#  for iPhoneOS and iPhoneSimulator
#
#  Created by Miyabi Kazamatsuri on 19.04.11.
#  Copyright 2011 Miyabi Kazamatsuri. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
###########################################################################
#  Change values here							  #
#									  #
VERSION="2.1.23"							  #
SDKVERSION="4.3"							  #
OPENSSL="${PWD}/../OpenSSL"						  #
#									  #
###########################################################################
#									  #
# Don't change anything under this line!				  #
#									  #
###########################################################################

CURRENTPATH=`pwd`
DEVELOPER=`xcode-select --print-path`

set -e
if [ ! -e cyrus-sasl-${VERSION}.tar.gz ]; then
	echo "Downloading cyrus-sasl-${VERSION}.tar.gz"
    curl -O ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${VERSION}.tar.gz
else
	echo "Using cyrus-sasl-${VERSION}.tar.gz"
fi

if [ -d  ${CURRENTPATH}/src ]; then
	rm -rf ${CURRENTPATH}/src
fi

if [ -d ${CURRENTPATH}/bin ]; then
	rm -rf ${CURRENTPATH}/bin
fi

mkdir -p "${CURRENTPATH}/src"
tar zxf cyrus-sasl-${VERSION}.tar.gz -C "${CURRENTPATH}/src"

############
# iPhone Simulator
ARCH="i386"
PLATFORM="iPhoneSimulator"
echo "Building cyrus-sasl for ${PLATFORM} ${SDKVERSION} ${ARCH}"
echo "Please stand by..."

pushd "${CURRENTPATH}/src/cyrus-sasl-${VERSION}"

CC="${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/usr/bin/gcc"
CFLAGS="-isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk -I"${OPENSSL}/include" -L"${OPENSSL}" -arch ${ARCH} -pipe -Os -gdwarf-2"
#LDFLAGS="-isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk -arch ${ARCH}"
mkdir -p "${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}.sdk"

LOG="${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}.sdk/build-cyrus-sasl-${VERSION}.log"

echo "Configure cyrus-sasl for ${PLATFORM} ${SDKVERSION} ${ARCH}"

export CC="${CC}"
export CFLAGS="${CFLAGS}"
#export LDFLAGS="${LDFLAGS}"
./configure -prefix=${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}.sdk --host=${ARCH}-apple-darwin --disable-shared --enable-static --with-openssl > "${LOG}" 2>&1

echo "Make cyrus-sasl for ${PLATFORM} ${SDKVERSION} ${ARCH}"

(cd lib && make) >> "${LOG}" 2>&1
(cd include && make saslinclude_HEADERS="hmac-md5.h md5.h sasl.h saslplug.h saslutil.h prop.h" install) >> "${LOG}" 2>&1
(cd include && make clean) >> "${LOG}" 2>&1
(cd lib && make install) >> "${LOG}" 2>&1
(cd lib && make clean) >> "${LOG}" 2>&1
rm config.cache
popd

echo "Building cyrus-sasl for ${PLATFORM} ${SDKVERSION} ${ARCH}, finished"
#############

#############
# iPhoneOS armv6
ARCH="armv6"
PLATFORM="iPhoneOS"
echo "Building cyrus-sasl for ${PLATFORM} ${SDKVERSION} ${ARCH}"
echo "Please stand by..."

pushd "${CURRENTPATH}/src/cyrus-sasl-${VERSION}"

CC="${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/usr/bin/gcc"
CFLAGS="-isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk -I"${OPENSSL}/include" -L"${OPENSSL}" -arch ${ARCH} -pipe -Os -gdwarf-2"
#LDFLAGS="-isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk -arch ${ARCH}"
mkdir -p "${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}-${ARCH}.sdk"

LOG="${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}-${ARCH}.sdk/build-cyrus-sasl-${VERSION}.log"

echo "Configure cyrus-sasl for ${PLATFORM} ${SDKVERSION} ${ARCH}"

export CC="${CC}"
export CFLAGS="${CFLAGS}"
#export LDFLAGS="${LDFLAGS}"
./configure -prefix=${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}-${ARCH}.sdk --host=${ARCH}-apple-darwin --disable-shared --enable-static --with-openssl > "${LOG}" 2>&1

echo "Make cyrus-sasl for ${PLATFORM} ${SDKVERSION} ${ARCH}"

(cd lib && make) >> "${LOG}" 2>&1
(cd include && make saslinclude_HEADERS="hmac-md5.h md5.h sasl.h saslplug.h saslutil.h prop.h" install) >> "${LOG}" 2>&1
(cd include && make clean) >> "${LOG}" 2>&1
(cd lib && make install) >> "${LOG}" 2>&1
(cd lib && make clean) >> "${LOG}" 2>&1
rm config.cache
popd

echo "Building cyrus-sasl for ${PLATFORM} ${SDKVERSION} ${ARCH}, finished"
#############

#############
# iPhoneOS armv7
ARCH="armv7"
PLATFORM="iPhoneOS"
echo "Building cyrus-sasl for ${PLATFORM} ${SDKVERSION} ${ARCH}"
echo "Please stand by..."

pushd "${CURRENTPATH}/src/cyrus-sasl-${VERSION}"

CC="${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/usr/bin/gcc"
CFLAGS="-isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk -I"${OPENSSL}/include" -L"${OPENSSL}" -arch ${ARCH} -pipe -Os -gdwarf-2"
#LDFLAGS="-isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk -arch ${ARCH}"
mkdir -p "${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}-${ARCH}.sdk"

LOG="${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}-${ARCH}.sdk/build-cyrus-sasl-${VERSION}.log"

echo "Configure cyrus-sasl for ${PLATFORM} ${SDKVERSION} ${ARCH}"

export CC="${CC}"
export CFLAGS="${CFLAGS}"
#export LDFLAGS="${LDFLAGS}"
./configure -prefix=${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}-${ARCH}.sdk --host=${ARCH}-apple-darwin --disable-shared --enable-static --with-opnessl > "${LOG}" 2>&1

echo "Make cyrus-sasl for ${PLATFORM} ${SDKVERSION} ${ARCH}"

(cd lib && make) >> "${LOG}" 2>&1
(cd include && make saslinclude_HEADERS="hmac-md5.h md5.h sasl.h saslplug.h saslutil.h prop.h" install) >> "${LOG}" 2>&1
(cd include && make clean) >> "${LOG}" 2>&1
(cd lib && make install) >> "${LOG}" 2>&1
(cd lib && make clean) >> "${LOG}" 2>&1
rm config.cache
popd

echo "Building cyrus-sasl for ${PLATFORM} ${SDKVERSION} ${ARCH}, finished"
#############

#############
# Universal Library
echo "Build universal library..."

lipo -create ${CURRENTPATH}/bin/iPhoneSimulator${SDKVERSION}.sdk/lib/libsasl2.a ${CURRENTPATH}/bin/iPhoneOS${SDKVERSION}-armv6.sdk/lib/libsasl2.a ${CURRENTPATH}/bin/iPhoneOS${SDKVERSION}-armv7.sdk/lib/libsasl2.a -output ${CURRENTPATH}/libsasl2.a

mkdir -p ${CURRENTPATH}/include
cp -R ${CURRENTPATH}/bin/iPhoneSimulator${SDKVERSION}.sdk/include/sasl ${CURRENTPATH}/include/
echo "Building all steps done."
echo "Cleaning up..."
rm -rf ${CURRENTPATH}/src
rm -rf ${CURRENTPATH}/bin
echo "Done."
