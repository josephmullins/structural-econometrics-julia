using FastGaussQuadrature, Distributions, Roots

# Fixed-node quadrature for integration (compatible with automatic differentiation)
function integrateGL(f, a, b; num_nodes = 10)
    nodes, weights = gausslegendre(num_nodes)
    ∫f = 0.
    for k in eachindex(nodes)
        x = (a + b)/2 + (b - a)/2 * nodes[k]
        ∫f += weights[k] * f(x)
    end
    return (b - a)/2 * ∫f
end

# Evaluate the derivative of the surplus function
dS(x; F, β, δ) = (1 - cdf(F, x)) / (1 - β*(1 - δ))

# Reservation wage equation (should equal zero at the solution)
function res_wage(wres, b, λ, δ, β, F::Distribution)
    ub = quantile(F, 0.9999)  # Upper bound of integration
    integral = integrateGL(x -> dS(x; F, β, δ), wres, ub)
    return wres - b - β * λ * integral
end

function solve_res_wage(b, λ, δ, β, F)
    return find_zero(
        x -> res_wage(x, b, λ, δ, β, F),
        eltype(b)(4.)  # Initial guess of $4/hour
    )
end
