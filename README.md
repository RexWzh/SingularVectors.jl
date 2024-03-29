# SingularVectors

[![][docs-dev-img]][docs-dev-url]
[![][action-img]][action-url]
[![][codecov-img]][codecov-url]

Demo for implementation of Universal Enveloping Algebras, which can be used for finding singular vectors.

## Usage

Install by github links.
```jl
using Pkg
Pkg.add("http://github.com/RexWzh/SingularVectors.jl")
```


### Example
Treat the Lie algebra as a subalgebra of the corresponding universal enveloping algebra.
```jl
using SingularVectors, Test
alg = AlgebraBySC(sl2scmat)
# elements of lie algebra
(e, h, f), scmat = alg.basis, alg.scmat
# elements of the enveloping algebra
ee, hh, ff = LieEnvElem.(alg.basis)

# PBW ordering: e < h < f
# (hh, ff, ee) = (hh, ee, ff) + (hh, [ff, ee])
#              = (ee, hh, ff) + 2 * (ee, ff) - (hh, hh)
@test ff * ee == ee * ff + f * e
@test hh * ff * ee == hh * ee * ff + hh * (f * e)
```

Notes:
 - Data type `AlgebraBySC` is an analogy of the GAP function `AlgebraByStructureConstants`
 - Element of `SCMat` are `SparseVector`s in order to save memory
 - For simplicity, I use `SCMat` instead of `SCMat{T}` to represent the structure constants array. This should be changed in the later work.


<!-- URLS -->

[action-img]: https://github.com/RexWzh/SingularVectors.jl/actions/workflows/CI.yml/badge.svg
[action-url]: https://github.com/RexWzh/SingularVectors.jl/actions
[codecov-img]: https://codecov.io/gh/RexWzh/SingularVectors.jl/branch/main/graph/badge.svg
[codecov-url]: https://codecov.io/gh/RexWzh/SingularVectors.jl?branch=master
[docs-dev-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docs-dev-url]: https://rexwzh.github.io/SingularVectors.jl/dev/
