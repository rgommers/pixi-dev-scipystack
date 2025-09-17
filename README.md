# pixi-dev-scipystack

This is an _experimental_ development setup for using [Pixi](https://pixi.sh/)
to do development work on NumPy, SciPy and some related projects.


## Getting started

### Prerequisites

- [Install `pixi`](https://pixi.sh/latest/installation/)
- Authenticate with [`gh`](https://cli.github.com/manual/gh)
  - If you don't have `gh` installed, you can `pixi global install gh`
  - Run [`gh auth login`](https://cli.github.com/manual/gh_auth_login)
  - Run [`gh auth setup-git`](https://cli.github.com/manual/gh_auth_setup-git)
- Clone this repository
  - For example, with `gh repo clone rgommers/pixi-dev-scipystack`

### Setup

In the root directory of this repository:
- run `pixi run clone-all` to clone
all of the source repos into the workspace
  - alternatively, you can select only specific repos to clone, like `pixi run clone-numpy`
- fork repositories with `pixi run fork-all`
  - this forks repositories under the username set with `gh`, and sets `upstream` and `origin` remotes appropriately
  - similarly, you can select specific repos to fork, like `pixi run fork-numpy`

`pixi run clone-fork-all` will do all of this in one go.

### Usage

After that, if you `cd REPO` (replacing `REPO` with the name of a repo in the workspace),
you will be able to build and test that repo (plus other dev tasks, see `pixi task list`).
For example, with SciPy:

```console
❯ pixi run clone-scipy
{snip}

❯ cd scipy

❯ pixi run build

✨ Pixi task (build in default): spin build --setup-args=-Dblas=blas --setup-args=-Dlapack=lapack --setup-args=-Duse-g77-abi=true  $ meson setup build --prefix=/usr -Dblas=blas -Dlapack=lapack -Duse-g77-abi=true
The Meson build system
Version: 1.8.2
Source dir: /Users/lucascolley/ghq/github.com/rgommers/pixi-dev-scipystack/scipy/scipy
{snip}

❯ pixi run test-torch
? The task 'test-torch' can be run in multiple environments.

Please select an environment to run the task in: ›
❯ torch
  array-api

✨ Pixi task (build in default): spin build --setup-args=-Dblas=blas --setup-args=-Dlapack=lapack --setup-args=-Duse-g77-abi=true  $ meson compile -j 8 -C build
{snip}
✨ Pixi task (test-torch in torch): spin test --no-build -b torch -m 'array_api_backends and not slow'
{snip}
======================================== 1945 passed, 14 skipped, 228 deselected in 2.52s =========================================
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
