
#!/usr/bin/python
# -*- coding: utf-8 -*-
##
# vexpm.py: vectorized matrix exponentian
##
# This file was written by Ian Hincks.
# 
# Since a few portions of the code are copied from 
# and/or modelled after the SciPy function scipy.sparse.expm (SHA 9fa91a07677 or 
# thereabouts), I am pasting the following copyright and disclaimer. Please 
# additionally attribute my modifications.
#     
# Copyright (c) 2001, 2002 Enthought, Inc.
# All rights reserved.
# 
# Copyright (c) 2003-2017 SciPy Developers.
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
#   a. Redistributions of source code must retain the above copyright notice,
#      this list of conditions and the following disclaimer.
#   b. Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in the
#      documentation and/or other materials provided with the distribution.
#   c. Neither the name of Enthought nor the names of the SciPy Developers
#      may be used to endorse or promote products derived from this software
#      without specific prior written permission.
# 
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
# OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
# THE POSSIBILITY OF SUCH DAMAGE.

from __future__ import division
import warnings

import numpy as np

def _max_onenorm(A):
    """
    Treats last two indeces of A as matrices and returns 
    the max 1-norm of all matrices
    """
    return np.amax(np.abs(A).sum(axis=-2))

class VectorizedMatrixExpHelper(object):
    """
    This class helps clean up the code a bit by caching things relevant 
    to matrix exponentiation algorithms.
    
    :paran np.ndarray A: Array of shape `(...,n,n)`
    """
    
    def __init__(self, A):
        
        # cached matrices
        self._I = None
        self._A = A
        self._A2 = None
        self._A4 = None
        self._A6 = None
        self._A8 = None
        self._A10 = None
        self._absA = None
        
        # cached 1-norms
        self._max_d1 = None
        self._max_d4 = None
        self._max_d6 = None
        self._max_d8 = None
        self._max_d10 = None
    
    @property
    def dim(self):
        return self.A.shape[-1]
    
    ## CACHED MATRIX POWERS ####################################################
    
    @property
    def I(self):
        if self._I is None: self._I = np.identity(self.dim)[np.newaxis,...]
        return self._I
    @property    
    def A(self):
        return self._A
    @property
    def A2(self):
        if self._A2 is None: self._A2 = np.matmul(self._A, self._A)
        return self._A2
    @property
    def A4(self):
        if self._A4 is None: self._A4 = np.matmul(self.A2, self.A2)
        return self._A4
    @property
    def A6(self):
        if self._A6 is None: self._A6 = np.matmul(self.A4, self.A2)
        return self._A6
    @property
    def A8(self):
        if self._A8 is None: self._A8 = np.matmul(self.A4, self.A4)
        return self._A8
    @property
    def A10(self):
        if self._A10 is None: self._A10 = np.matmul(self.A6, self.A4)
        return self._A10

    ## CACHED 1-NORMS ##########################################################
        
    @property
    def max_d1(self):
        if self._max_d1 is None: self._max_d1 = _max_onenorm(self._A)
        return self._max_d1
    @property
    def max_d4(self):
        if self._max_d4 is None: self._max_d4 = _max_onenorm(self.A4)**(1/4.)
        return self._max_d4
    @property
    def max_d6(self):
        if self._max_d6 is None: self._max_d6 = _max_onenorm(self.A6)**(1/6.)
        return self._max_d6
    @property
    def max_d8(self):
        if self._max_d8 is None: self._max_d8 = _max_onenorm(self.A6)**(1/8.)
        return self._max_d8
    @property
    def max_d10(self):
        if self._max_d10 is None: self._max_d10 = _max_onenorm(self.A10)**(1/10.)
        return self._max_d10
        
    ## PADE CALCULATORS ########################################################
        
    @property
    def pade3(self):
        b = (120., 60., 12., 1.)
        U = np.matmul(self.A, b[3]*self.A2 + b[1]*self.I)
        V = b[2]*self.A2 + b[0]*self.I
        return U, V    
    
    @property
    def pade5(self):
        b = (30240., 15120., 3360., 420., 30., 1.)
        U = np.matmul(self.A, b[5]*self.A4 + b[3]*self.A2 + b[1]*self.I)
        V = b[4]*self.A4 + b[2]*self.A2 + b[0]*self.I
        return U, V
        
    @property
    def pade7(self):
        b = (17297280., 8648640., 1995840., 277200., 25200., 1512., 56., 1.)
        U = np.matmul(
                self.A,
                b[7]*self.A6 + b[5]*self.A4 + b[3]*self.A2 + b[1]*self.I
            )
        V = b[6]*self.A6 + b[4]*self.A4 + b[2]*self.A2 + b[0]*self.I
        return U, V
    
    @property    
    def pade9(self):
        b = (
                17643225600., 8821612800., 2075673600., 302702400., 
                30270240., 2162160., 110880., 3960., 90., 1.
            )
        U = np.matmul(
                self.A,
                b[9]*self.A8 + b[7]*self.A6 + b[5]*self.A4 +
                b[3]*self.A2 + b[1]*self.I
            )
        V = (
                b[8]*self.A8 + b[6]*self.A6 + b[4]*self.A4 +
                b[2]*self.A2 + b[0]*self.I
            )
        return U, V
        
    def pade13_scaled(self, s):
        b = (
                64764752532480000., 
                32382376266240000., 
                2**(-2*s) * 7771770303897600.,
                2**(-2*s) * 1187353796428800., 
                2**(-4*s) * 129060195264000., 
                2**(-4*s) * 10559470521600.,
                2**(-6*s) * 670442572800., 
                2**(-6*s) * 33522128640., 
                2**(-2*s) * 1323241920., 
                2**(-2*s) * 40840800., 
                2**(-4*s) * 960960.,
                2**(-4*s) * 16380., 
                2**(-6*s) * 182., 
                2**(-6*s) * 1.
            )
        B6 = self.A6 * 2**(-6*s)
        U2 = np.matmul(B6, b[13]*self.A6 + b[11]*self.A4 + b[9]*self.A2)
        U = np.matmul(self.A * 2**-s, U2 + b[7]*self.A6 + b[5]*self.A4 + b[3]*self.A2 + b[1]*self.I)
        V2 = np.matmul(B6, b[12]*self.A6 + b[10]*self.A4 + b[8]*self.A2)
        V = V2 + b[6]*self.A6 + b[4]*self.A4 + b[2]*self.A2 + b[0]*self.I
        return U, V
    
    ## BOUNDS ########################################################
    
    # these are the constants of Higham, 2005
    theta = {
        3: 1.495585217958292e-002, 5: 2.539398330063230e-001,
        7: 9.504178996162932e-001, 9: 2.097847961257068e000,
        13: 5.371920351148152e000
    }
    
def _vexpm(A, scale_power=0, pade_order=13, verbose=False):
    """
    Computes the matrix exponential over the last two dimensions of A, using 
    any of the Pade approximation orders 3, 5, 7, 9 or 13. For order 13, 
    scale_power > 0 can be specified, so that the pade approximation is 
    taken as B = A / 2**s, and matrix_power(B, 2**s) is returned.
    
    :param A: ``np.ndarray`` of shape ``(...,n,n)``, or an instance 
         of ``VectorizedMatrixExpHelper(A)`` with such an A
    :param int scale_power: scale power reduction of A, only works when 
        ``pade_order=13``
    :param int pade_order: Any of ``(3,5,7,9,13)``
    :param bool verbose: If ``True`` prints the order and scale
    :returns: Array of shape `(...,n,n)`
    """
    
    h = A if isinstance(A, VectorizedMatrixExpHelper) else VectorizedMatrixExpHelper(A)
        
    if verbose:
        print "scale_power: {}, pade_order: {}".format(scale_power, pade_order)    
    
    if pade_order == 5:    
        U, V = h.pade5
    elif pade_order == 7:
        U, V = h.pade7
    elif pade_order == 9:
        U, V = h.pade9
    elif pade_order == 13:
        U, V = h.pade13_scaled(scale_power)
    else:
        raise ValueError('Unsupported Pade order {}'.format(pade_order))
        
    if scale_power != 0 and pade_order != 13:
        scale_power = 0
        warnings.warn('Scaling and squaring only supported for pade_order=13')

    # scale and square
    X = np.linalg.solve(V-U, V+U)
    for i in range(int(scale_power)):
        X = np.matmul(X, X)
    return X
        
def vexpm(A, verbose=False):
    """
    This function treats the last two indeces of the input as matrices and
    performs matrix exponentiation on each, using only operations on the entire
    array, that is, the exponentiations are done simultaneously thereby 
    avoiding python for loops, and making better use of low level BLAS/MKL 
    abilities. 
    
    This comes at the cost of having to use the same Pade approximation and 
    squaring-and-scaling factor for all matrices -- our approach is to use 
    the worst case over all matrices.
    
    Implements "The Scaling and Squaring Method for the Matrix 
    Exponential Revisited", 2005, by Higham. There have been improvements 
    to this algorithm since then, see for example Al-Moyy and Higham, 2009.
    However, these improvements are much more tedious to program (though 
    certainly doable) and the present implementation suit my needs.
    
    :param np.ndarray A: Array of shape `(...,n,n)`
    :returns: Array of shape `(...,n,n)`
    """
    
    # the only difference between this and _vexpm is that 
    # we try to figure out good values for scale_power and 
    # pade_order automatically by looking at the norms of A
    
    h = VectorizedMatrixExpHelper(A)

    if h.max_d1 < h.theta[3]:
        scale_power, pade_order = 0, 3
    if h.max_d1 < h.theta[5]:
        scale_power, pade_order = 0, 5
    elif h.max_d1 < h.theta[7]:
        scale_power, pade_order = 0, 7
    elif h.max_d1 < h.theta[9]:
        scale_power, pade_order = 0, 9
    else:
        s = max(int(np.ceil(np.log2(h.max_d1 / h.theta[13]))), 0)
        scale_power, pade_order = s, 13
        
    return _vexpm(h, scale_power=scale_power, pade_order=pade_order, verbose=verbose)
    
    
    
