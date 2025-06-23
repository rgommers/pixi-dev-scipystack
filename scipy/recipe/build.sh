mkdir builddir

CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY" \
    PYTHON -m build -w -n -x \
    -Cbuild-dir=builddir \
    -Cinstall-args=--tags=runtime,python-runtime,devel \
    -Csetup-args=-Dblas=blas \
    -Csetup-args=-Dlapack=lapack \
    -Csetup-args=-Duse-g77-abi=true

$PYTHON -m pip install dist/scipy*.whl
