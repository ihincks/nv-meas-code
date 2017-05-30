# -*- coding: utf-8 -*-
from __future__ import division
from functools import partial

import qinfer as qi

import numpy as np
import scipy.io as sio
from scipy.linalg import expm
from scipy.special import xlogy, gammaln
from vexpm import vexpm

from glob import glob

## CONSTANTS ##################################################################

# Zero field spitting and gyromagnetic ratios (all in MHz)

Si = np.eye(3)
Sx = np.array([[0,1,0],[1,0,1],[0,1,0]])/np.sqrt(2)
Syp = np.array([[0,-1j,0],[1j,0,1j],[0,-1j,0]])/np.sqrt(2)
Sz = np.array([[1,0,0],[0,0,0],[0,0,-1]])
Sz2 = np.dot(Sz, Sz)

two_pi = np.pi * 2
two_pii = two_pi*1j
two_pii_s2 = two_pii/np.sqrt(2)
four_pi = two_pi * 2

# Construct a vectorized 0 projector
P0 = np.zeros((3, 3), dtype=complex)
P0[1, 1] = 1
P0vec = P0.flatten(order='F')

HX = 2 * np.pi * Sx
GX = 1j *(np.kron(HX.T, np.eye(3)) - np.kron(np.eye(3), HX))
HY = 2 * np.pi * Syp
GY = 1j *(np.kron(HY.T, np.eye(3)) - np.kron(np.eye(3), HY))
HZ = 2 * np.pi * Sz
GZ = 1j *(np.kron(HZ.T, np.eye(3)) - np.kron(np.eye(3), HZ))
HZ2 = 2 * np.pi * Sz2
GZ2 = 1j *(np.kron(HZ2.T, np.eye(3)) - np.kron(np.eye(3), HZ2))

## FUNCTIONS ##################################################################

def poisson_pdf(k, mu):
    """
    Probability of k events in a poisson process of expectation mu
    """
    return np.exp(xlogy(k, mu) - gammaln(k + 1) - mu)

def load_averages(pattern, times_file):
    """
    Sums up matlab "average files" specified by glob pattern.
    """
    file_list = glob(pattern)
    file_list.sort()
    M = [sio.loadmat(fname)['M'][np.newaxis, ...] for fname in file_list]
    return np.concatenate(M,axis=0)

def unitary(t, phi, wr, we, dwc):
    """
    Returns the unitary at time t of
    H = wr*cos(phi)*Sx + wr*sin(phi)*Syp + we*Sz + dwc*Sz.Sz
    """
    wr, we, dwc = -t*two_pii_s2*wr, -t*two_pii*we, -t*two_pii*dwc
    wrp, wrm = np.exp(1j*phi)*wr, np.exp(-1j*phi)*wr
    return expm(
        np.array([[dwc+we, wrm, 0], [wrp, 0, wrp], [0, wrm, dwc-we]])
    )

def superop(t, wr, we, dwc, T2inv):
    """
    Returns superoperator at time t resulting from
    the Hamiltonian/Lindblad
    H = wr*Sx + we*Sz + dwc*Sz.Sz, L=sqrt(T2)Sz
    Formulas taken from formulas.nb notebook.
    """
    wr, we, dwc, T2inv2 = t*two_pii_s2*wr, t*two_pii*we, t*two_pii*dwc, t*np.pi*T2inv
    v1 = [-wr, -wr, 0, -wr, -wr, 0, -wr, -wr]
    v3 = [wr, wr, wr, wr, wr, wr]
    G = np.diag([
        0, -T2inv2 + dwc + we, -4*T2inv2 + 2*we, 
        - T2inv2 - dwc - we, 0, -T2inv2 - dwc + we, 
        -4*T2inv2 - 2*we, -T2inv2 + dwc - we, 0
    ], k=0) + \
    np.diag(v1, k=1) + np.diag(v1, k=-1) + \
    np.diag(v3, k=3) + np.diag(v3, k=-3)

    return expm(G)
    

def rabi(tp, tau, phi, wr, we, dwc, an, T2inv):
    """
    Return signal calculated by propagating
    supergenerator due to Rabi experiment with 
    given parameters. tau is ignored.
    """
    n_models = wr.shape[0]
    sig = np.empty((n_models,))
    for idx in xrange(n_models):
        # take an incoherent sum over nitrogen values
        S = superop(tp, wr[idx], we[idx], dwc[idx], T2inv[idx]) + \
            superop(tp, wr[idx], we[idx] + an[idx], dwc[idx], T2inv[idx]) + \
            superop(tp, wr[idx], we[idx] - an[idx], dwc[idx], T2inv[idx])
        sig[idx] =  np.real(np.dot(P0vec, np.dot(S, P0vec))) / 3

    return sig
    
class RepeatedOperator(object):
    def __init__(self, op):
        self.op = op
        self._memo = {}
        
    def _construct_op(self, size):
        return np.repeat(self.op[np.newaxis, ...], size, axis=0)
    
    def __call__(self, size=1):
        if size not in self._memo:
            self._memo[size] = self._construct_op(size)
        return self._memo[size]
            
vecGx = RepeatedOperator(GX)
vecGy = RepeatedOperator(GY)
vecGz = RepeatedOperator(GZ)
vecGz2 = RepeatedOperator(GZ2)   
vecSx = RepeatedOperator(-1j * 2 * np.pi * Sx)
vecSyp = RepeatedOperator(-1j * 2 * np.pi * Syp)
vecSz = RepeatedOperator(-1j * 2 * np.pi * Sz)
vecSz2 = RepeatedOperator(-1j * 2 * np.pi * Sz2)   
vecLz = RepeatedOperator(two_pi * (np.kron(Sz, Sz) - (np.kron(Sz2, Si) + np.kron(Si, Sz2)) / 2))

def rabi2(tp, tau, phi, wr, we, dwc, an, T2inv):
    # this is the same as rabi, except that we use the vexpm function
    n_models = wr.shape[0]
    # supergenerator without nitrogen
    G1 = tp * (wr[:, np.newaxis, np.newaxis] * vecGx(n_models) \
        + we[:, np.newaxis, np.newaxis] * vecGz(n_models) \
        + dwc[:, np.newaxis, np.newaxis] * vecGz2(n_models) \
        + T2inv[:, np.newaxis, np.newaxis] * vecLz(n_models))
    # supergenerator for just nitrogen
    GA = tp * an[:, np.newaxis, np.newaxis] * vecGz(n_models)
    # simulate three nitrogen cases and average results
    # note that preparing P0 and measuring P0 is equivalent to getting central element (4,4)
    return np.real(vexpm(G1 - GA)[:, 4, 4] + vexpm(G1)[:, 4, 4] + vexpm(G1 + GA)[:, 4, 4]) / 3

def pure_evolve(U):
    """
    Multiplies U by the 0 state and then takes the outer product.
    """
    psi = U[:,1]
    return np.dot(psi[:,np.newaxis],psi.conj()[np.newaxis,:])

def ramsey(tp, tau, phi, wr, we, dwc, an, T2inv):
    """
    Return signal due to Ramsey experiment with
    given parameters
    """
    n_models = wr.shape[0]
    sig = np.empty((n_models,))
    for idx in xrange(n_models):
        # assume tp is small enough that T2 doesn't matter
        Pinit1 = pure_evolve(unitary(tp, 0, wr[idx], we[idx], dwc[idx])).flatten(order='F')
        Pinit2 = pure_evolve(unitary(tp, 0, wr[idx], we[idx] + an[idx], dwc[idx])).flatten(order='F')
        Pinit3 = pure_evolve(unitary(tp, 0, wr[idx], we[idx] - an[idx], dwc[idx])).flatten(order='F')
        if phi == 0:
            Pfinal1, Pfinal2, Pfinal3 = Pinit1, Pinit2, Pinit3
        else:
            Pfinal1 = pure_evolve(unitary(tp, phi, wr[idx], we[idx], dwc[idx])).flatten(order='F')
            Pfinal2 = pure_evolve(unitary(tp, phi, wr[idx], we[idx] + an[idx], dwc[idx])).flatten(order='F')
            Pfinal3 = pure_evolve(unitary(tp, phi, wr[idx], we[idx] - an[idx], dwc[idx])).flatten(order='F')
        
        # take an incoherent sum over nitrogen values
        S = np.real(np.dot(Pfinal1, np.dot(superop(tau, 0, we[idx], dwc[idx], T2inv[idx]), Pinit1)))
        S = S + np.real(np.dot(Pfinal2, np.dot(superop(tau, 0, we[idx] + an[idx], dwc[idx], T2inv[idx]), Pinit2)))
        S = S + np.real(np.dot(Pfinal3, np.dot(superop(tau, 0, we[idx] - an[idx], dwc[idx], T2inv[idx]), Pinit3)))

        sig[idx] =  S / 3

    return sig
    
def ramsey2(tp, tau, phi, wr, we, dwc, an, T2inv):
    """
    Return signal due to Ramsey experiment with
    given parameters
    """
    # this is the same as the ramsey function, but using vexpm
    n_models = wr.shape[0]
    # hamiltonian without nitrogen during rabi
    H1 = tp * (wr[:, np.newaxis, np.newaxis] * vecSx(n_models) \
        + we[:, np.newaxis, np.newaxis] * vecSz(n_models) \
        + dwc[:, np.newaxis, np.newaxis] * vecSz2(n_models))
    # hamiltonian for just nitrogen
    HA = tp * an[:, np.newaxis, np.newaxis] * vecSz(n_models)
    
    # states after square pulses
    sm = vexpm(H1 - HA)[...,1]
    s0 = vexpm(H1)[...,1]
    sp = vexpm(H1 + HA)[...,1]
    
    # convert to vectorized density matrix
    sm = np.repeat(sm.conj(), 3, axis=-1) * np.reshape(np.tile(sm, 3), (-1, 9))
    sm = sm[...,np.newaxis]
    s0 = np.repeat(s0.conj(), 3, axis=-1) * np.reshape(np.tile(s0, 3), (-1, 9))
    s0 = s0[...,np.newaxis]
    sp = np.repeat(sp.conj(), 3, axis=-1) * np.reshape(np.tile(sp, 3), (-1, 9))
    sp = sp[...,np.newaxis]
    
    # supergenerator during wait
    G1 = tau * (we[:, np.newaxis, np.newaxis] * vecGz(n_models) \
        + dwc[:, np.newaxis, np.newaxis] * vecGz2(n_models) \
        + T2inv[:, np.newaxis, np.newaxis] * vecLz(n_models))
    # supergenerator for just nitrogen
    GA = tau * an[:, np.newaxis, np.newaxis] * vecGz(n_models)
    
    # sandwich wait between square pulses
    p = np.matmul(sm.swapaxes(-2,-1), np.matmul(vexpm(G1 - GA), sm))[...,0,0]
    p = p + np.matmul(s0.swapaxes(-2,-1), np.matmul(vexpm(G1), s0))[...,0,0]
    p = p + np.matmul(sp.swapaxes(-2,-1), np.matmul(vexpm(G1 + GA), sp))[...,0,0]
    
    return np.real(p) / 3


    n_models = wr.shape[0]
    sig = np.empty((n_models,))
    for idx in xrange(n_models):
        # assume tp is small enough that T2 doesn't matter
        Pinit1 = pure_evolve(unitary(tp, 0, wr[idx], we[idx], dwc[idx])).flatten(order='F')
        Pinit2 = pure_evolve(unitary(tp, 0, wr[idx], we[idx] + an[idx], dwc[idx])).flatten(order='F')
        Pinit3 = pure_evolve(unitary(tp, 0, wr[idx], we[idx] - an[idx], dwc[idx])).flatten(order='F')
        if phi == 0:
            Pfinal1, Pfinal2, Pfinal3 = Pinit1, Pinit2, Pinit3
        else:
            Pfinal1 = pure_evolve(unitary(tp, phi, wr[idx], we[idx], dwc[idx])).flatten(order='F')
            Pfinal2 = pure_evolve(unitary(tp, phi, wr[idx], we[idx] + an[idx], dwc[idx])).flatten(order='F')
            Pfinal3 = pure_evolve(unitary(tp, phi, wr[idx], we[idx] - an[idx], dwc[idx])).flatten(order='F')
        
        # take an incoherent sum over nitrogen values
        S = np.real(np.dot(Pfinal1, np.dot(superop(tau, 0, we[idx], dwc[idx], T2inv[idx]), Pinit1)))
        S = S + np.real(np.dot(Pfinal2, np.dot(superop(tau, 0, we[idx] + an[idx], dwc[idx], T2inv[idx]), Pinit2)))
        S = S + np.real(np.dot(Pfinal3, np.dot(superop(tau, 0, we[idx] - an[idx], dwc[idx], T2inv[idx]), Pinit3)))

        sig[idx] =  S / 3

    return sig

def rabi_analytic(tp, tau, phi, wr, we, dwc, an, T2inv):
    """
    Return signal calculated with an analytic formula for the
    qubit approximation. Note this formula fails for very long times.
    See formulas.nb for derivation.
    """
    decay = np.exp(- tp * T2inv)
    sig = (1 - decay) / 2
    dw = two_pi * (we - dwc)
    dw2 = dw ** 2
    wr2 = (two_pi * wr) ** 2

    # The effective field term with m_I=0
    w_eff2 = (dw2 + 2 * wr2)
    sig  = sig + (1/6) * decay * (
        (dw2 + wr2 * (1 + np.cos(tp * np.sqrt(w_eff2)))) /
        w_eff2
    )

    # The effective field term with m_I=-1
    dwan2 = (dw + two_pi * an) ** 2
    w_eff2 = (dwan2 + wr2)
    sig  = sig + (1/6) * decay * (
        (dwan2 + wr2 * (1 + np.cos(tp * np.sqrt(w_eff2)))) /
        w_eff2
    )

    # The effective field term with m_I=+1
    dwan2 = (dw - two_pi * an) ** 2
    w_eff2 = (dwan2 + wr2)
    sig  = sig + (1/6) * decay * (
        (dwan2 + wr2 * (1 + np.cos(tp * np.sqrt(w_eff2)))) /
        w_eff2
    )

    return sig
    
def detect_peaks(x, mph=None, mpd=1, threshold=0, edge='rising',
                 kpsh=False, valley=False, show=False, ax=None):
    """Detect peaks in data based on their amplitude and other features.

    References
    ----------
    .. [1] http://nbviewer.ipython.org/github/demotu/BMC/blob/master/notebooks/DetectPeaks.ipynb
    """

    x = np.atleast_1d(x).astype('float64')
    if x.size < 3:
        return np.array([], dtype=int)
    if valley:
        x = -x
    # find indices of all peaks
    dx = x[1:] - x[:-1]
    # handle NaN's
    indnan = np.where(np.isnan(x))[0]
    if indnan.size:
        x[indnan] = np.inf
        dx[np.where(np.isnan(dx))[0]] = np.inf
    ine, ire, ife = np.array([[], [], []], dtype=int)
    if not edge:
        ine = np.where((np.hstack((dx, 0)) < 0) & (np.hstack((0, dx)) > 0))[0]
    else:
        if edge.lower() in ['rising', 'both']:
            ire = np.where((np.hstack((dx, 0)) <= 0) & (np.hstack((0, dx)) > 0))[0]
        if edge.lower() in ['falling', 'both']:
            ife = np.where((np.hstack((dx, 0)) < 0) & (np.hstack((0, dx)) >= 0))[0]
    ind = np.unique(np.hstack((ine, ire, ife)))
    # handle NaN's
    if ind.size and indnan.size:
        # NaN's and values close to NaN's cannot be peaks
        ind = ind[np.in1d(ind, np.unique(np.hstack((indnan, indnan-1, indnan+1))), invert=True)]
    # first and last values of x cannot be peaks
    if ind.size and ind[0] == 0:
        ind = ind[1:]
    if ind.size and ind[-1] == x.size-1:
        ind = ind[:-1]
    # remove peaks < minimum peak height
    if ind.size and mph is not None:
        ind = ind[x[ind] >= mph]
    # remove peaks - neighbors < threshold
    if ind.size and threshold > 0:
        dx = np.min(np.vstack([x[ind]-x[ind-1], x[ind]-x[ind+1]]), axis=0)
        ind = np.delete(ind, np.where(dx < threshold)[0])
    # detect small peaks closer than minimum peak distance
    if ind.size and mpd > 1:
        ind = ind[np.argsort(x[ind])][::-1]  # sort ind by peak height
        idel = np.zeros(ind.size, dtype=bool)
        for i in range(ind.size):
            if not idel[i]:
                # keep peaks with the same height if kpsh is True
                idel = idel | (ind >= ind[i] - mpd) & (ind <= ind[i] + mpd) \
                    & (x[ind[i]] > x[ind] if kpsh else True)
                idel[i] = 0  # Keep current peak
        # remove the small peaks and sort back the indices by their occurrence
        ind = np.sort(ind[~idel])

    if show:
        if indnan.size:
            x[indnan] = np.nan
        if valley:
            x = -x
        _plot(x, mph, mpd, threshold, edge, valley, ax, ind)

    return ind
    

## CLASSES ##################################################################

class MemoizeLikelihood(object):
    """
    Simple depth-1 memoizer for the likelihood function -- useful because 
    particles only move with resample.
    """
    def __init__(self, lhood):
        self._lhood = lhood
        self._latest_hash = None
        self._cached_lhood = None
    def __get__(self, obj, objtype=None):
        if obj is None:
            return self._lhood
        return partial(self, obj)
    def __call__(self, obj, outcomes, modelparams, expparams):
        # this is a naive but fast hash; not too worried because the 
        # the memory is only depth 1
        h = hash(str(outcomes) + str(modelparams) + str(expparams))
        if h != self._latest_hash:
            self._latest_hash = h
            self._cached_lhood = self._lhood(obj, outcomes, modelparams, expparams)
        return self._cached_lhood

class RabiRamseyModel(qi.FiniteOutcomeModel):
    r"""
    Model of a single shot in a Rabi flopping experiment.
    
    Model parameters:
    0: :math:`\Omega`, Rabi strength (MHz); coefficient of Sx
    1: :math:`\omega_e`, Zeeman frequency (MHz); coefficient of Sz
    2: :math:`\Delta \omega_c`, ZFS detuning (MHz); coefficient of Sz^2
    3: :math:`\A_N`, Nitrogen hyperfine splitting (MHz); modeled as incoherent average  
    4: :math:`T_2^-1`, inverse of electron T2* (MHz)
    5: :math:`\Omega_\text{Ramsey}`, the Rabi strength (MHz) while doing a Ramsey experiment

    Experiment parameters:
    mode: Specifies whether a reference or signal count is being performed.
    t:   Pulse width
    tau: Ramsey wait time (only relevent if mode is `RabiRamseyModel.RAMSEY`)
    phi: Ramsey phase between pulses (")
    """
    
    RABI = 0
    RAMSEY = 1

    (
        IDX_OMEGA, IDX_ZEEMAN,
        IDX_DCENTER,
        IDX_A_N, IDX_T2_INV,
        IDX_OMEGA_RAMSEY,
        IDX_ALPHA, IDX_BETA
    ) = range(8)

    def __init__(self, use_separate_ramsey_power=False):
        super(RabiRamseyModel, self).__init__()

        self.use_separate_ramsey_power = use_separate_ramsey_power
        self.simulator = {
            self.RABI:   rabi2,
            self.RAMSEY: ramsey2
        }

        self._domain = qi.IntegerDomain(min=0, max=1)

    @property
    def n_modelparams(self):
        return len(self.modelparam_names)

    @property
    def modelparam_names(self):
        return [
            r'\Omega',
            r'\omega_e',
            r'\Delta\omega_c',
            r'A_N',
            r'T_2^{-1}',
            r'\Omega_{Ramsey}' # this modelparam is ignored if use_separate_ramsey_power is false
        ]
        
    @property
    def expparams_dtype(self):
        return [('t', 'float'), ('tau', 'float'), ('phi', 'float'), ('emode', 'int')]
        
    @property
    def is_n_outcomes_constant(self):
        return True
        
    @staticmethod
    def are_models_valid(modelparams):
        return np.all(
            [
                # Require that some frequencies be positive.
                modelparams[:, RabiRamseyModel.IDX_OMEGA] >= 0,
                modelparams[:, RabiRamseyModel.IDX_OMEGA_RAMSEY] >= 0,
                modelparams[:, RabiRamseyModel.IDX_ZEEMAN] >= 0,
                modelparams[:, RabiRamseyModel.IDX_A_N] >= 0,

                # Require that T₂ is positive.
                modelparams[:, RabiRamseyModel.IDX_T2_INV] >= 0
            ],
            axis=0
        )
        
    def domain(self, expparams):
        return self._domain if expparams is None else [self._domain]*expparams.shape[0]

    def n_outcomes(self, expparams):
        return 2
        
    @MemoizeLikelihood
    def likelihood(self, outcomes, modelparams, expparams):
        """
        Returns the likelihood of measuring |0> under a projective
        measurement.
        """
        
        pr0 = np.empty((modelparams.shape[0], expparams.shape[0]))
        
        # get model details for all particles
        wr    = modelparams[:, self.IDX_OMEGA]
        wrr   = modelparams[:, self.IDX_OMEGA_RAMSEY]
        we    = modelparams[:, self.IDX_ZEEMAN]
        dwc   = modelparams[:, self.IDX_DCENTER]
        an    = modelparams[:, self.IDX_A_N]
        T2inv = modelparams[:, self.IDX_T2_INV]
        
        # Loop over experiment parameters
        for idx_experiment in xrange(expparams.shape[0]):
            mode = expparams[idx_experiment]['emode']
            
            # Otherwise, we need to simulate
            t = expparams[idx_experiment]['t'] 
            tau = expparams[idx_experiment]['tau'] 
            phi = expparams[idx_experiment]['phi']

            # we allow the ramsey pulse amplitude to be different from other experiments
            if mode == self.RAMSEY and self.use_separate_ramsey_power:
                wr = wrr

            # simulate according to the simulator for the current mode
            # the simulator should be vectorized with respect to the 
            # last five arguments
            pr0[:, idx_experiment] = self.simulator[mode](t, tau, phi, wr, we, dwc, an, T2inv)

        return qi.FiniteOutcomeModel.pr0_to_likelihood_array(outcomes, pr0)

class ReferencedPoissonModel(qi.DerivedModel):
    """
    Model whose "true" underlying model is a coin flip, but where the coin is
    only accessible by drawing three poisson random variates, the rate
    of the third being the convex combination of the rates of the first two,
    and the linear parameter being the weight of the coin.
    By drawing from all three poisson random variables, information about the
    coin can be extracted, and the rates are thought of as nuisance parameters.

    This model is in many ways similar to the :class:`BinomialModel`, in
    particular, it requires the underlying model to have exactly two outcomes.

    :param Model underlying_model: The "true" model hidden by poisson random
        variables which set upper and lower references.

    Note that new ``modelparam`` fields alpha and beta are
    added by this model. They refer to, respectively, the higher poisson
    rate (corresponding to underlying probability 1)
    and the lower poisson rate (corresponding to underlying probability 0).

    Additionally, an exparam field ``mode`` is added.
    This field indicates whether just the signal has been measured (0), the
    bright reference (1), or the dark reference (2).
    To ensure the correct operation of this model, it is important that the
    decorated model does not also admit a field with the name ``mode``.
    """

    SIGNAL = 0
    BRIGHT = 1
    DARK = 2

    def __init__(self, underlying_model):
        super(ReferencedPoissonModel, self).__init__(underlying_model)

        if not (underlying_model.is_n_outcomes_constant and underlying_model.domain(None).n_members == 2):
            raise ValueError("Decorated model must be a two-outcome model.")

        if isinstance(underlying_model.expparams_dtype, str):
            # We default to calling the original experiment parameters "p".
            self._expparams_scalar = True
            self._expparams_dtype = [('p', underlying_model.expparams_dtype), ('mode', 'int')]
        else:
            self._expparams_scalar = False
            self._expparams_dtype = underlying_model.expparams_dtype + [('mode', 'int')]

        # The domain for any mode of an experiment is all of the non-negative integers
        self._domain = qi.IntegerDomain(min=0, max=np.inf)
        
        

    ## PROPERTIES ##

    @property
    def n_modelparams(self):
        return super(ReferencedPoissonModel, self).n_modelparams + 2

    @property
    def modelparam_names(self):
        underlying_names = super(ReferencedPoissonModel, self).modelparam_names
        return underlying_names + [r'\alpha', r'\beta']

    @property
    def expparams_dtype(self):
        return self._expparams_dtype

    @property
    def is_n_outcomes_constant(self):
        """
        Returns ``True`` if and only if the number of outcomes for each
        experiment is independent of the experiment being performed.

        This property is assumed by inference engines to be constant for
        the lifetime of a Model instance.
        """
        return True

    ## METHODS ##

    def are_models_valid(self, modelparams):
        u_valid = self.underlying_model.are_models_valid(modelparams[:,:-2])
        s_valid = np.logical_and(modelparams[:,-1] <= modelparams[:,-2], modelparams[:,-2] >= 0)
        return np.logical_and(u_valid, s_valid)

    def canonicalize(self, modelparams):
        u_model = self.underlying_model.canonicalize(modelparams[:,:-2])
        mask = modelparams[:,-2] <= modelparams[:,-1]
        avg = (modelparams[mask,-1] + modelparams[mask,-2]) / 2 
        modelparams[mask,-2] = avg
        modelparams[mask,-1] = avg
        return modelparams

    def n_outcomes(self, expparams):
        """
        Returns an array of dtype ``uint`` describing the number of outcomes
        for each experiment specified by ``expparams``.

        :param numpy.ndarray expparams: Array of experimental parameters. This
            array must be of dtype agreeing with the ``expparams_dtype``
            property.

        Note: This is incorrect as there are an infinite number of outcomes.
        We arbitrarily pick a number.
        """
        return 1000

    def domain(self, expparams):
        """
        Returns a list of ``Domain``s, one for each input expparam.

        :param numpy.ndarray expparams:  Array of experimental parameters. This
            array must be of dtype agreeing with the ``expparams_dtype``
            property.

        :rtype: list of ``Domain``
        """
        return self._domain if expparams is None else [self._domain for ep in expparams]

    def likelihood(self, outcomes, modelparams, expparams):
        
        # By calling the superclass implementation, we can consolidate
        # call counting there.
        super(ReferencedPoissonModel, self).likelihood(outcomes, modelparams, expparams)

        L = np.empty((outcomes.shape[0], modelparams.shape[0], expparams.shape[0]))
        ot = np.tile(outcomes, (modelparams.shape[0],1)).T

        for idx_ep, expparam in enumerate(expparams):

            if expparam['mode'] == self.SIGNAL:

                # Get the probability of outcome 1 for the underlying model.
                pr0 = self.underlying_model.likelihood(
                    np.array([0], dtype='uint'),
                    modelparams[:,:-2],
                    np.array([expparam['p']]) if self._expparams_scalar else np.array([expparam]))[0,:,0]
                pr0 = np.tile(pr0, (outcomes.shape[0], 1))

                # Reference Rate
                alpha = np.tile(modelparams[:, -2], (outcomes.shape[0], 1))
                beta = np.tile(modelparams[:, -1], (outcomes.shape[0], 1))

                # For each model parameter, turn this into an expected poisson rate
                gamma = pr0 * alpha + (1 - pr0) * beta

                # The likelihood of getting each of the outcomes for each of the modelparams
                L[:,:,idx_ep] = poisson_pdf(ot, gamma)

            elif expparam['mode'] == self.BRIGHT:

                # Reference Rate
                alpha = np.tile(modelparams[:, -2], (outcomes.shape[0], 1))

                # The likelihood of getting each of the outcomes for each of the modelparams
                L[:,:,idx_ep] = poisson_pdf(ot, alpha)

            elif expparam['mode'] == self.DARK:

                # Reference Rate
                beta = np.tile(modelparams[:, -1], (outcomes.shape[0], 1))

                # The likelihood of getting each of the outcomes for each of the modelparams
                L[:,:,idx_ep] = poisson_pdf(ot, beta)
            else:
                raise(ValueError('Unknown mode detected in ReferencedPoissonModel.'))

        assert not np.any(np.isnan(L))
        return L

    def simulate_experiment(self, modelparams, expparams, repeat=1):
        super(ReferencedPoissonModel, self).simulate_experiment(modelparams, expparams, repeat)

        n_mps = modelparams.shape[0]
        n_eps = expparams.shape[0]
        outcomes = np.empty(shape=(repeat, n_mps, n_eps))

        for idx_ep, expparam in enumerate(expparams):
            if expparam['mode'] == self.SIGNAL:
                # Get the probability of outcome 1 for the underlying model.
 
                ep = np.array([expparam['p']]) if self._expparams_scalar else np.array([expparam])
                pr0 = self.underlying_model.likelihood(
                    np.array([0], dtype='uint'),
                    modelparams[:,:-2],
                    ep)[0,:,0]

                # Reference Rate
                alpha = modelparams[:, -2]
                beta = modelparams[:, -1]

                outcomes[:,:,idx_ep] = np.random.poisson(pr0 * alpha + (1 - pr0) * beta, size=(repeat, n_mps))
            elif expparam['mode'] == self.BRIGHT:
                alpha = modelparams[:, -2]
                outcomes[:,:,idx_ep] = np.random.poisson(alpha, size=(repeat, n_mps))
            elif expparam['mode'] == self.DARK:
                beta = modelparams[:, -1]
                outcomes[:,:,idx_ep] = np.random.poisson(beta, size=(repeat, n_mps))
            else:
                raise(ValueError('Unknown mode detected in ReferencedPoissonModel.'))

        return outcomes[0,0,0] if outcomes.size == 1 else outcomes

    def update_timestep(self, modelparams, expparams):
        mps = self.underlying_model.update_timestep(modelparams[:,:-2],
            np.array([expparams['p']]) if self._expparams_scalar else expparams)
        return np.concatenate([
                mps, 
                np.repeat(modelparams[:,-2:,np.newaxis], expparams.shape[0], axis=2)
            ], axis=1)
            
            
class SliceResampler(qi.LiuWestResampler):
    def __call__(self, model, particle_weights, particle_locations,
        precomputed_mean=None, precomputed_cov=None
    ):
        store_refs = particle_locations[:,-2:].copy()
        w, l = super(SliceResampler, self).__call__(
                model, particle_weights, particle_locations, 
                n_particles=particle_weights.shape[0], 
                precomputed_cov=precomputed_cov, 
                precomputed_mean=precomputed_mean
            )
        l[:,-2:] = store_refs
        return w, l
            
class BridgedRPMUpdater(qi.SMCUpdater):
    """
    We make a few changes to the SMC updater specific to the referenced 
    poisson model. We can make the updater more numerically stable by detecting
    those updates which reduce the number of effective particles drastically,
    and compensating by reducing the update into smaller artificial updates.
    """
    
    def __init__(self, model, n_particles, prior, branch_size=2, max_recursion=10, zero_weight_policy='ignore', n_ess_thresh= 1000, **kwargs):
        super(BridgedRPMUpdater, self).__init__(model, n_particles, prior, **kwargs)
        self.resampler = SliceResampler(default_n_particles=n_particles)
        self.n_ess_thresh = n_ess_thresh
        self.branch_size = branch_size
        self.max_recursion = max_recursion
        self._zero_weight_policy = zero_weight_policy

    def update(self, outcome, expparams, check_for_resample=True, data_divider=1):
        """
        Here we modify the usual update step slightly by refusing to update 
        the particles if the anticipated n_ess is lower than self.n_ess_thresh.
        In this case we recursively call update, having divided the data 
        counts 
        
        We can bypass this behaviour by setting force_update to True
        """

        # Then calculate what would happen with an update of these data at the
        # current value of data_divider
        # note that we may not be giving it an integer outcome, but poisson_pdf can handle it
        if data_divider > 1:
            self.particle_locations[:,-2:] = self.particle_locations[:,-2:] / data_divider
        weights, norm = self.hypothetical_update(outcome / data_divider, expparams, return_normalization=True)
        if data_divider > 1:
            self.particle_locations[:,-2:] = self.particle_locations[:,-2:] * data_divider
        n_ess = 1 / (np.sum(weights[0,0,:]**2))

        # Check for negative weights           
        if not np.all(weights >= 0):
            warnings.warn("Negative weights occured in particle approximation. Smallest weight observed == {}. Clipping weights.".format(np.min(weights)), ApproximationWarning)
            np.clip(weights, 0, 1, out=weights)

        # Next, check if we have caused the weights to go to zero, as can
        # happen if the likelihood is identically zero for all particles,
        # or if the previous clip step choked on a NaN.
        if np.sum(weights) <= self._zero_weight_thresh:
            if self._zero_weight_policy == 'ignore':
                n_ess = 0
            elif self._zero_weight_policy == 'skip':
                return
            elif self._zero_weight_policy == 'warn':
                warnings.warn("All particle weights are zero. This will very likely fail quite badly.", ApproximationWarning)
            elif self._zero_weight_policy == 'error':
                raise RuntimeError("All particle weights are zero.")
            elif self._zero_weight_policy == 'reset':
                warnings.warn("All particle weights are zero. Resetting from initial prior.", ApproximationWarning)
                self.reset()
            else:
                raise ValueError("Invalid zero-weight policy {} encountered.".format(self._zero_weight_policy))

        # we can use the current data_divider value to figure out 
        # how deep into the recursion we are
        depth = np.log(data_divider) / np.log(self.branch_size)

        # allow another recurse only if we are not too deep
        if depth < self.max_recursion:
            # if effective particle count from this update is too low, 
            # bridge it into branch_size number of steps, with a resample
            # allowed after each one
            if n_ess < self.n_ess_thresh:
                n_ess = [
                    self.update(
                        outcome, expparams, 
                        check_for_resample=check_for_resample, 
                        data_divider = self.branch_size*data_divider
                    )
                    for idx_branch in range(self.branch_size)
                ]
                
                return n_ess
        
        # if we have made it here, we have hit a base case, and 
        # are actually going to update
        self._data_record.append(outcome / data_divider)
        self._just_resampled = False
        self._normalization_record.append(norm[0][0])

        self.particle_weights[:] = weights[0,0,:]
        self.particle_locations = self.model.update_timestep(
            self.particle_locations, expparams
        )[:, :, 0]

        # Check if we need to update our min_n_ess attribute.
        if self.n_ess <= self._min_n_ess:
            self._min_n_ess = self.n_ess
        
        # Resample if needed.
        if check_for_resample:
            self._maybe_resample()
            
        return int(n_ess)
