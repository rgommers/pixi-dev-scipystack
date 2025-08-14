#!/bin/bash
mkdir -p ../build_dir
cd ../build_dir

if [[ -f configure-done ]]; then
    echo "Skipping configure step, already done."
else
    $SRC_DIR/configure --prefix=${PREFIX} \
        --oldincludedir=${BUILD_PREFIX}/${HOST}/sysroot/usr/include \
        --enable-shared \
        --srcdir=$SRC_DIR
fi

touch configure-done

make -j${CPU_COUNT} install
ln -sf ${PREFIX}/bin/python3.15 ${PREFIX}/bin/python
