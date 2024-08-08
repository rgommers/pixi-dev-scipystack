mkdir builddir

$PYTHON -m build -w -n -x \
    -Cbuild-dir=builddir \
    -Csetup-args=-Dblas=blas \
    -Csetup-args=-Dlapack=lapack

$PYTHON -m pip install dist/numpy*.whl
