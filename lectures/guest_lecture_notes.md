# Notes / Outline for guest lecture

I want to set up a very simple example that explains how models can work before we get to welfare reform.

## The Example: Demand for Bananas

Consider three policies:

1. A 10% demand subsidy for bananas.
2. A 20% demand subsidy for bananas.
3. A 10% supply-side subsidy for bananas.

Two questions:

1. What is the effect on the quantity and price of bananas sold?
2. How much are consumers willing to pay for the subsidy? (a money metric of welfare effects)

Imagine you have data on price and quantity $(P_{m},Q_{m})$ across $M$ markets. 

## Making Point 1

###
Suppose you design an experiment to test policy 1. You write:

$$q_{m} = \beta_0 + \beta_1 Z_{m} + \epsilon_{m}$$
$$p_{m} = \alpha_0 + \alpha_1 Z_{m} + \eta_{m}$$

where $Z_{m}\in\{0,1\}$ indicates treatment and $(q,p)$ are log prices/quantities. Do $\alpha_1$ and $\beta_1$ allow us to do any extrapolation?

### 
If we look at the data, no clear patterns emerge. See just a cloud of points.

Next slide (via animation) shows this is because prices and quantities are determined jointly by supply and demand. There is no uniform relationship between prices and quantities, it depends whether the policy shifts demand or supply. 
 

Point: sometimes you need a model to make sense of the data and more carefully identify parameters of interest.

### 

Develop a simple theory.

1. Consumers $\max U(Q,X) s.t. PQ + X \leq Y$ 
2. Producers $\max PQ - C(Q)$ in competitive market

Simple model gives linear supply and demand:

$$ q_{m}^{S} = \gamma_0 + \gamma_1 p_{m} + \xi_{m} $$
$$ q_{m}^{D} = \kappa_0 - \kappa_1 p_{m} + \zeta_{m} $$


And the market clears: $q_{m}^{S}=q_{m}^{D}$.

- This can generate the previous picture.
- We can estimate supply and demand with the experiment...
- We now have parameters where we can forecast the effects of *all three policies*

###

Recall that $\alpha_1$ is the equilibrium effect of the 10\% subsidy on (log) price.

Producer gets price change $\alpha_1$, hence $\gamma_1 = \frac{\beta_{1}}{\alpha_{1}}$ is *elasticity of supply*.

Consumer gets (log) price change $\alpha_1 + \log(0.9)$, hence $\kappa_1 = -\frac{\beta_{1}}{\alpha_{1}+log(0.9)}$.

Point: model can interpolate / extrapolate existing variation to policies (including the supply side subsidy which has a natural link in the theory but no link otherwise)

Particular good at this when variation is in *prices* or *endowments* for a well-understood model. Call this "well-articulated" variation.

### Revealed Preference Explanation

- In this exercise we implicitly estimate utility $U$
- Allows us to calculate how consumers value bananas relative to $$$.
- Known has *revealed preference*... an incredibly powerful tool in economics.
- Assuming people know what they like, their choices (if properly modeled) reveal what they like
- This allows us to rank different policies without assuming we know what's good for people better than they do.

Point: models allow for welfare calculations

### 

After all this, we go on to dscribe the more intricate example and show how the model can do the same thing.

Be more explicit about the setup... individuals choose combinations of work and program participation that best suit their preferences given policy rules and labor market opportunities. 

Policy rules are "well articulated",.. most can be written as known changfes to prices and endowments in the model. Meaning we can synthesize different experiments into one model.

Show one picture from the paper that emphasizes the kind of finds we can get to.



