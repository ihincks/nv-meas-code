# Ancilliary Files for "Statistical Inference with Quantum Measurements: Methodologies for Nitrogen Vacancy Centers in Diamond"

- Ian Hincks
- Christopher Granade
- David G. Cory

## Introduction

This repository contains all source code and data necessary to reproduce the results found in the paper [_Statistical Inference with Quantum Measurements: Methodologies for Nitrogen Vacancy Centers in Diamond_](https://doi.org/10.1088/1367-2630/aa9c9f). Questions about the contents of this repository should be submitted as GitHub issues to this library, so that everyone can benefit from the answer. If private communication is desired, please contact ihincks@uwaterloo.ca.

## Requirements

Both Mathematica and Python are used. They are used independently -- Mathematica for derivations, calculations, and corresponding plots; Python for analysing the experimental data and corresponding plots and table.

#### Mathematica

File extensions `.nb` are to be run with _Wolfram Mathematica 11_ (though earlier and later versions will likely work too). As this is paid software, we have also made the notebooks available in the `.cdf` format where they can be viewed, but not run, using the free [Wolfram CDF Player](https://www.wolfram.com/cdf-player/). 

The following third party packages are required when running with _Mathematica_:

 - [QuantumUtils for Mathematica](https://github.com/QuantumUtils/quantum-utils-mathematica)
 - [MaTeX](https://github.com/szhorvat/MaTeX)

#### Python

Standard versions between `2.7` and `3.5` should work. The following necessary libraries can be installed with `pip` or `conda`:

 - [Jupyter Notebook](http://jupyter.org/) : `conda install jupyter` -- to view `.ipynb` notebook files
 - [qinfer](http://qinfer.org/) : `pip install qinfer` -- an implementation of the Sequential Monte Carlo inference algorithm
 - [numpy](http://www.numpy.org/) : `conda install numpy`
 - [scipy](https://www.scipy.org/) : `conda install scipy`
 - [matplotlib](http://matplotlib.org/) : `conda install matplotlib`
 
Optional for parallelization:

 - [ipyparallel](https://github.com/ipython/ipyparallel): `conda install ipyparallel`
 - [dill](https://pypi.python.org/pypi/dill): `conda install dill`

These requirements can be installed automatically with pip:

```bash
$ pip install -r requirements.txt
```

Or with Anaconda (recommended):

```bash
$ conda install nb_conda # Optional, exposes new environment to Jupyter.
$ conda env create -f environment.yml
```
 
Or with pip and virtualenv:
```
$ virtualenv env/
$ env/scripts/activate.sh # Use ".ps1" instead of ".sh" on Windows.
$ pip install -r requirements.txt
```
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
