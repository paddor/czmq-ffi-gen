#!/bin/bash

set -e
# set -u
# set -x

ARCHITECTURE=$1

BASE_DIR=$(cd $(dirname $0)/..; pwd)
cd ${BASE_DIR}

PREFIX=${BASE_DIR}/vendor/local
export PKG_CONFIG_LIBDIR=${PREFIX}/lib/pkgconfig

if [ "${ARCHITECTURE}" = "x64" ]; then
  COMPILER_PREFIX=x86_64-w64-mingw32
else
  COMPILER_PREFIX=i686-w64-mingw32
fi

rm -rf ${PREFIX}

libzmq_build_dir=build/libzmq
rm -rf ${libzmq_build_dir}
mkdir -p ${libzmq_build_dir}
cd ${libzmq_build_dir}
cmake ${BASE_DIR}/vendor/libzmq \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_SYSTEM_NAME=Windows \
  -DCMAKE_SYSTEM_PROCESSOR=${ARCHITECTURE} \
  -DCMAKE_C_COMPILER=${COMPILER_PREFIX}-gcc \
  -DCMAKE_CXX_COMPILER=${COMPILER_PREFIX}-g++ \
  -DCMAKE_RC_COMPILER=${COMPILER_PREFIX}-windres \
  -DZMQ_BUILD_TESTS=OFF \
  -DHAVE_WS2_32=ON \
  -DHAVE_RPCRT4=ON \
  -DHAVE_IPHLAPI=ON
make -j8
make install
cd -

czmq_build_dir=build/czmq
rm -rf ${czmq_build_dir}
mkdir -p ${czmq_build_dir}
cd ${czmq_build_dir}
cmake ${BASE_DIR}/vendor/czmq \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_SYSTEM_NAME=Windows \
  -DCMAKE_SYSTEM_PROCESSOR=${ARCHITECTURE} \
  -DCMAKE_C_COMPILER=${COMPILER_PREFIX}-gcc \
  -DCMAKE_CXX_COMPILER=${COMPILER_PREFIX}-g++ \
  -DCMAKE_RC_COMPILER=${COMPILER_PREFIX}-windres
make -j8
make install
cd -

for gcc_dll in libstdc++-6.dll libgcc_s_sjlj-1.dll libgcc_s_seh-1.dll; do
  absolute_gcc_dll=$(${COMPILER_PREFIX}-g++ -print-file-name=${gcc_dll})
  if [ -f "${absolute_gcc_dll}" ]; then
    cp "${absolute_gcc_dll}" vendor/local/bin
  fi
done
