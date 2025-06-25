mkdir -p $SRC_DIR/../build/$PKG_NAME

$PYTHON -m build -w -n -x \
    -Cbuild-dir=$SRC_DIR/../build/$PKG_NAME \
    -Csetup-args=-Dblas=blas \
    -Csetup-args=-Dlapack=lapack

$PYTHON -m pip install dist/numpy*.whl
