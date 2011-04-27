#!/bin/sh

#  Automatic build script for OpenSSL and Cyrus SASL 
#  for iPhoneOS and iPhoneSimulator
#
#  Created by Miyabi Kazamatsuri on 25.04.11.
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

CURRENTPATH=`pwd`
BUILD_PATH="${CURRENTPATH}/lib"

echo "Start building libraries."

if [ -d lib ]; then
	rm -rf  ${BUILD_PATH}
fi
mkdir -p "${BUILD_PATH}/OpenSSL/Headers/"
mkdir -p "${BUILD_PATH}/SASL/Headers/"

cd "${CURRENTPATH}/OpenSSL/"
/bin/sh build-libssl.sh
cd "${CURRENTPATH}/SASL/"
/bin/sh build-libsasl.sh

echo "Copy libraries to 'lib' directory."

cp -p "${CURRENTPATH}/OpenSSL/libcrypto.a" "${BUILD_PATH}/OpenSSL"
cp -p "${CURRENTPATH}/OpenSSL/libssl.a" "${BUILD_PATH}/OpenSSL"
cp -Rp "${CURRENTPATH}/OpenSSL/include/openssl" "${BUILD_PATH}/OpenSSL/Headers/"

cp -p "${CURRENTPATH}/SASL/libsasl2.a" "${BUILD_PATH}/SASL"
cp -Rp "${CURRENTPATH}/SASL/include/sasl" "${BUILD_PATH}/SASL/Headers/"

echo "Building libraries done."
