#!/bin/bash

# Determine build directory based on PYTHON_ASAN
if [[ -n "${PYTHON_ASAN}" ]]; then
    BUILD_DIR="../build_asan"
    CONFIGURE_EXTRA="--with-address-sanitizer"
    export ASAN_OPTIONS="detect_leaks=0"
else
    BUILD_DIR="../build_dir"
    CONFIGURE_EXTRA=""
fi

mkdir -p "${BUILD_DIR}"
cd "${BUILD_DIR}"

if [[ -f configure-done ]]; then
    echo "Skipping configure step, already done."
else
    "${SRC_DIR}/configure" \
        --prefix="${PREFIX}" \
        --oldincludedir="${BUILD_PREFIX}/${HOST}/sysroot/usr/include" \
        --enable-shared \
        --srcdir="${SRC_DIR}" \
        ${CONFIGURE_EXTRA}
fi

touch configure-done

make -j"${CPU_COUNT}" install
ln -sf "${PREFIX}/bin/python${MINOR_VERSION}" "${PREFIX}/bin/python"
