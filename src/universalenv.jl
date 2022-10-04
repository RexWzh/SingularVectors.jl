# Universal Enveloping algebra
# outline
## 1. basic operations

module UniversalEnvelope
using SparseArrays

# Data types
export SCMat, LieElement, EnvElement, LieAlgebra
export ObjMatchError

# Constructions
export commutative_liealgebra, sl2

# tools
export sparse2dict

# Data types
include("universal/types.jl")

# Operations
include("universal/operations.jl")

# Construction
include("universal/construct.jl")


end