$PYTHON -m build -w -n -x -Cbuild-dir=builddir

$PYTHON -m pip install dist/pywavelets-*.whl
