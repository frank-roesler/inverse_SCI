# inverse_SCI
This repository contains a MATLAB implementation of an algorithm to reconstruct the potential and Robin boundary conditions from the spectral data of a 1d Schrödinger equation on the interval [0,π]. The input data are assumed to consist of the first N eigenvalues and norming constants of the problem (where by definition n'th the norming constant is the squared L<sup>2</sup> norm of the eigenfunction y<sub>n</sub> normalized such that y<sub>n</sub>(0)=1). The algorithm works by computing the primitive u of the potential from the solution c of a matrix equation (Id-A)c = b.
Contents:
* `compute_u.m` main function that returns the primitive of the potential from the eigenvalues and norming constants,
* `build_A.m` computes the matrix A appearing in the equation (Id-A)c = b from the eigenvalues and norming constants,
* `build_b.m` computes the right-hand side b appearing in the equation (Id-A)c = b from the eigenvalues and norming constants,
* `I.m` returns the (symbolically computed) integral of cos(at)cos(bt) from t=0 to x,
* `inverse_main.m` example script that reconstructs the potential and boundary conditions from data provided in a .mat file. 

Any comments or queries are welcome at https://frank-roesler.github.io/contact/






