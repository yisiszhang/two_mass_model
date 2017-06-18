#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Wed Jun  7 00:38:38 2017

@author: yisi
"""

def get_par_scale(Q):
    po = 1/4;     # which power law
    dr = 0.0001          # dampling ratio
    m1l = m1r = m1 = 0.01 * Q
    m2l = m2r = m2 = 0.005 * Q
    k1l = k1r = k1 = 5*Q**(po)
    k2l = k2r = k2 = 2*Q**(po)
    kcl = kcr = 2*Q**(po)
    c1l = c1r = 3*k1
    c2l = c2r = 3*k2
    r1l = r1r = 0.02 #2*dr*(m1*k1)**0.5
    r2l = r2r = 0.02 #2*dr*(m2*k2)**0.5
    a10 = a20 = 0.05*Q**(2*po)
    l = 0.3*Q**(po)
    d1 =0.1*Q**(po)
    d2 = 0.05*Q**(po)
    Ps = 0.01
    pars = [m1l, m2l, m1r, m2r, k1l, k2l, k1r, k2r, 
    r1l, r2l, r1r, r2r, c1l, c2l, c1r, c2r,
    kcl, kcr, a10, a20, d1, d2, l, Ps]
    return pars

def get_par_asymmetry(Q):
    dr = 0.0          # dampling ratio
    m1l = m1 = 0.0125
    m2l = m2 = 0.025
    k1l = k1 = 0.08
    k2l = k2 = 0.008
    kcl = kc = 0.025
    c1l = 3*k1
    c2l = 3*k2
    r1l = 2*dr*(m1*k1)**0.5
    r2l = 2*dr*(m2*k2)**0.5
    a10 = a20 = 0.05
    l = 0.3
    d1 =0.25
    d2 = 0.05
    m1r = m1/Q
    m2r = m2/Q
    k1r = k1*Q
    k2r = k2*Q
    kcr = kc
    c1r = 3*k1r
    c2r = 3*k2r
    r1r = 2*dr*(m1*k1)**0.5
    r2r = 2*dr*(m2*k2)**0.5
    Ps = 0.008
    pars = [m1l, m2l, m1r, m2r, k1l, k2l, k1r, k2r,
            r1l, r2l, r1r, r2r, c1l, c2l, c1r, c2r,
            kcl, kcr, a10, a20, d1, d2, l, Ps]
    return pars
