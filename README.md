# Ancilliary Files for "Statistical Inference with Quantum Measurements: Methodologies for Nitrogen Vacancy Centers in Diamond"

- Ian Hincks
- Christopher Granade
- David G. Cory

## Introduction

This repository contains all source code and data necessary to reproduce the results found in the paper _Statistical Inference with Quantum Measurements: Methodologies for Nitrogen Vacancy Centers in Diamond_. Questions about the contents of this repository should be submitted as GitHub issues to this library, so that everyone can benefit from the answer. If private communication is desired, please contact ihincks@uwaterloo.ca.

## Requirements

Both Mathematica and Python are used. They are used independently -- Mathematica for derivations, calculations, and corresponding plots; Python for analysing the experimental data and corresponding plots and table.

#### Mathematica

File extensions `.nb` are to be run with _Wolfram Mathematica 11_ (though earlier and later versions will likely work too). As this is paid software, we have also made the notebooks available in the `.cdf` format where they can be viewed, but not run, using the free [Wolfram CDF Player](1). 

The following third party packages are required when running with _Mathematica_:

 - [QuantumUtils for Mathematica](2)
 - [MaTeX](3)

#### Python

Standard versions between `2.7` and `3.5` should work. The following necessary libraries can be installed with `pip` or `conda`:

 - [Jupyter Notebook](4) : `conda install jupyter` -- to view `.ipynb` notebook files
 - [qinfer](5) : `conda install qinfer` -- an implementation of the Sequential Monte Carlo inference algorithm
 - [numpy](6) : `conda install numpy`
 - [scipy](7) : `conda install scipy`
 - [matplotlib](8) : `conda install matplotlib`
 
Optional for parallelization:

 - [ipyparallel](9): `conda install ipyparallel`
 - [dill](10): `conda install dill`
 

## Index

#### By Figure Number

- Figure 1: `optical-dynamics.nb`, "Dynamics" section
- Figure 2: `optical-dynamics.nb`, "Rate Matrix Steady State" section
- Figure 3: Just a cartoon drawn in inkscape; not included
- Figure 4: `drift_tests.nb`
- Figure 5: `mle-derivation.nb`, "Fisher Information" section
- Figure 6: `optical-dynamics.nb`, "Measurement Plots" section
- Figure 7: `risk-calculations.nb`
- Figure 8a-b: `qhl.ipynb`, "Simulate with estimate" section
- Figure 8c-d: `qhl.ipynb`, "Process Data" > "Run inference on summed data" section
- Figure 8e-f: `qhl.ipynb`, "Least Squared Fits" section
- Figure 9: (appendix) `bivariate-poisson-prior.nb`, "Priors and Posteriors" > "Correlated Mixture weights" section
- Figure 10: (appendix) `bivariate-poisson-prior.nb`, "Plots" section
- Figure 11: (appendix) `qhl.ipynb`, "Test Model and Updater" > "Test our custom updater" section
- Figure 12: (appendix) `qhl.ipynb`, "Import Data from Disk" > "Raw data plots"
- Figure 13: (appendix) `qhl.ipynb`, "Process Data" > "Run inference on summed data" section
- Figure 14: (appendix) `qhl.ipynb`, "Simulate with estimate" section

#### By Table Number

- Table 1: `qhl.ipynb`, "Least Squared Fits" section


[1]: https://www.wolfram.com/cdf-player/
[2]: https://github.com/QuantumUtils/quantum-utils-mathematica
[3]: https://github.com/szhorvat/MaTeX
[4]: http://jupyter.org/
[5]: http://qinfer.org/
[6]: http://www.numpy.org/
[7]: https://www.scipy.org/
[8]: http://matplotlib.org/
[9]: https://github.com/ipython/ipyparallel
[10]: https://pypi.python.org/pypi/dill
