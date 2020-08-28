# docker-miniGPT

[miniGPT](https://github.com/karpathy/minGPT) is A PyTorch re-implementation of GPT training. minGPT tries to be small, clean, interpretable and educational, as most of the currently available ones are a bit sprawling. GPT is not a complicated model and this implementation is appropriately about 300 lines of code, including boilerplate and a totally unnecessary custom causal self-attention module. Anyway, all that's going on is that a sequence of indices goes into a sequence of transformer blocks, and a probability distribution of the next index comes out. The rest of the complexity is just being clever with batching (both across examples and over sequence length) so that training is efficient.

This repo has `Dockerfile` to build docker images of miniGPT.

