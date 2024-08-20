# pixi-dev: SciPy

_Note: dev tasks will only run after you have a git clone of the `scipy`
repository in a subdirectory of the directory that this README is located in._


## SciPy dev environments

SciPy can be built in many different ways (operating systems, hardware
platforms, compilers, BLAS libraries, Python versions, etc.), and supports has
an number of optional runtime dependencies. Hence there is a large variability
in development environments possible. With the introduction of support for
non-NumPy array libraries, this variability increases a lot more. This `pixi`
development setup aims to capture that variability and provide working
environments for many commonly needed scenarios.

Currently there platforms are supported by this `pixi` setup, each with a
single compiler configuration:

1. Linux x86-64, with the default conda-forge `compilers`
2. macOS arm64, with the default conda-forge `compilers` (Clang 16, gfortran 12.3)
3. Windows x86-64, with TODO!

BLAS libraries, array libraries, and optional dependencies are switchable
(without rebuilds between dev tasks whenever possible!). The following tables
provide an overview of what is supported (read `pixi.toml` for more details):


|            | Linux x86-64 | macOS arm64 | Windows x86-64 |
|------------|--------------|-------------|----------------|
| OpenBLAS   | x            | x           | x              |
| MKL        | x            |             | x              |
| Accelerate |              | x           |                |
| Netlib     | x            | x           | x              |
| BLIS       | x            |             | x              |


| Array library    | Linux x86-64 | macOS arm64 | Windows x86-64 |
|------------------|--------------|-------------|----------------|
| NumPy            | x            | x           | x              |
| PyTorch          | x            | x           |                |
| JAX              | x            | x           |                |
| CuPy             |              | x           |                |
| array-api-strict | x            | x           | x              |
| Dask             | x            | x           | x              |
| MLX              |              | x           |                |
| ndonnx           | x            | x           | x              |


|      | Linux x86-64 | macOS arm64 | Windows x86-64 |
|------|--------------|-------------|----------------|
| CPU  | x            | x           | x              |
| CUDA | x            |             |                |
| MPS  |              | x           |                |


| Array library    | CPU | CUDA | MPS |
|------------------|-----|------|-----|
| NumPy            | x   |      |     |
| PyTorch          | x   | x    | x   |
| JAX              | x   | x    |     |
| CuPy             |     | x    |     |
| array-api-strict | x   | x    | x   |
| Dask             | x   | x    |     |
| MLX              | x   | x    |     |
| ndonnx           | x   |      |     |
