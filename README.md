# pixi-dev-scipystack

This is an _experimental_ development setup for using [pixi](https://pixi.sh/)
to do development work on NumPy, SciPy and some related projects.


## Getting started

Install `pixi`, clone this repo, and then for the project you want to work
on ensure that you have a clone of the upstream repo one level below the
subdirectory for the project containing `pixi.toml`. For example:

```zsh
% git clone https://github.com/rgommers/pixi-dev-scipystack.git
% cd pixi-dev-scipystack/scipy
% git clone https://github.com/scipy/scipy.git
% cd scipy && git submodule update --init --recursive && cd ..
```

After that, you will be able to build and test SciPy (plus other dev tasks,
see `pixi task ls`):

```zsh
% pixi run build
✨ Pixi task (build in default): python dev.py build
💻  meson setup /Users/rgommers/code/pixi-dev/scipy/scipy/build --prefix /Users/rgommers/code/pixi-dev/scipy/scipy/build-install
The Meson build system
Version: 1.5.1
Source dir: /Users/rgommers/code/pixi-dev/scipy/scipy
...


% pixi run test-torch
? The task 'test-torch' can be run in multiple environments.

Please select an environment to run the task in: ›
❯ pytorch
  array-api

✨ Pixi task (test-torch in pytorch): python dev.py test -b pytorch -s cluster
💻  ninja -C /Users/rgommers/code/pixi-dev/scipy/scipy/build -j8
ninja: Entering directory `/Users/rgommers/code/pixi-dev/scipy/scipy/build'
[2/2] Generating scipy/generate-version with a custom command
Build OK
💻  meson install -C build --only-changed --tags runtime,python-runtime,tests,devel
Installing, see meson-install.log...
Installation OK
SciPy from development installed path at: /Users/rgommers/code/pixi-dev/scipy/scipy/build-install/lib/python3.12/site-packages
Running tests for scipy version:1.15.0.dev0+1346.64a49b0, installed at:/Users/rgommers/code/pixi-dev/scipy/scipy/build-install/lib/python3.12/site-packages/scipy
...
======================================================= 125 passed, 23 skipped in 2.46s =======================================================
```


## Goals

Goals of this repository include:

1. Making it easier to get started contributing to projects like NumPy and SciPy.
2. Making it easier for maintainers to reliably test in non-standard environments,
   e.g. when working on support for PyTorch, JAX, CuPy and other array libraries,
   or with BLAS/LAPACK libraries like MKL.
3. Prototype extra spin/dev.py commands that may be useful.
4. See what else Pixi can bring!


## Contributing

This repo is highly experimental - everything is subject to change, so please don't
rely on it too much. Ideas, questions, bug reports and pull requests are very welcome
though!
