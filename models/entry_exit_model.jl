# Entry-Exit Model Solution Functions
# This file contains routines for solving the symmetric duopoly entry-exit model

using ForwardDiff, LinearAlgebra

# Payoff functions
u1(x, a, d′, ϕ) = ϕ[1] + ϕ[2]*x - ϕ[3]*d′ + ϕ[4]*(1-a)
u0(a, ϕ) = a * ϕ[5]

# Compute choice-specific values given the other firm's choice probability
function choice_values(x, a, p, V, ϕ, β)
    v0 = u0(a, ϕ) + β * p * V[1,2] + β * (1-p) * V[1,1]
    v1 = u1(x, a, p, ϕ) + β * p * V[2,2] + β * (1-p) * V[2,1]
    return v0, v1
end

# Compute V as a 2x2 array from the vector of choice-specific values
function calc_V(v)
    idx = LinearIndices((2,2,2))
    [log(exp(v[idx[1,1+a,1+a′]]) + exp(v[idx[2,1+a,1+a′]])) for a in 0:1, a′ in 0:1]
end

# Compute choice probabilities as a 2x2 array from the vector v
function calc_p(v)
    idx = LinearIndices((2,2,2))
    [1 / (1+exp(v[idx[1,1+a,1+a′]] - v[idx[2,1+a,1+a′]])) for a in 0:1, a′ in 0:1]
end

# Iterate the model to update choice-specific values
function iterate_model_v(v, x, ϕ, β)
    idx = LinearIndices((2,2,2))
    vnew = copy(v)
    V = calc_V(v)
    for a′ in axes(idx,3)
        for a in axes(idx,2)
            i0′ = idx[1,a′,a]  # position in v for v₀(x,a',a)
            i1′ = idx[2,a′,a]  # position in v for v₁(x,a',a)
            p = 1 / (1 + exp(v[i0′] - v[i1′]))
            v0, v1 = choice_values(x, a-1, p, V, ϕ, β)
            vnew[idx[1,a,a′]] = v0
            vnew[idx[2,a,a′]] = v1
        end
    end
    return vnew
end

# Fixed point residual
F(v, x, ϕ, β) = v .- iterate_model_v(v, x, ϕ, β)

# Solve the model using Newton's method
function solve_model_newton(x, ϕ, β; max_iter=10, verbose=false)
    v = zeros(8)
    dF(v) = ForwardDiff.jacobian(y -> F(y, x, ϕ, β), v)
    err = Inf
    iter = 1
    while (err > 1e-10) && (iter < max_iter)
        Fv = F(v, x, ϕ, β)
        dFv = dF(v)
        vnew = v - inv(dFv) * Fv
        err = maximum(abs.(Fv))
        if verbose
            println("Iteration $iter, error is $err")
        end
        iter += 1
        v = vnew
    end
    return v
end

# Alternative: solve by iteration
function iterate_model(V, p, x, ϕ, β)
    Vnew = copy(V)
    pnew = copy(p)
    for a′ in axes(V,2)
        for a in axes(V,1)
            p′ = p[a′,a]
            v0, v1 = choice_values(x, a-1, p′, V, ϕ, β)
            pnew[a,a′] = exp(v1) / (exp(v0)+exp(v1))
            Vnew[a,a′] = log(exp(v0)+exp(v1))
        end
    end
    return Vnew, pnew
end

function solve_by_iteration(x, ϕ, β; max_iter=1000, verbose=false)
    V0 = zeros(2,2)
    p0 = fill(0.1, 2, 2)
    err = Inf
    iter = 1
    while err > 1e-10 && iter < max_iter
        V1, p1 = iterate_model(V0, p0, x, ϕ, β)
        err = maximum(abs.(V1 .- V0))
        if mod(iter, 100) == 0 && verbose
            println("Iteration $iter, error is $err")
        end
        V0 = V1
        p0 = p1
        iter += 1
    end
    return V0, p0
end
