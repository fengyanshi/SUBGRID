#!/usr/bin/env python
# coding: utf-8

# # This script is used to generate the synthetic topographies with everything controllable.
# ## Author: Zhendong Cao (zhendong@udel.edu), University of Delaware

# In[1]:


# load main libs

import matplotlib.pyplot as plt
import numpy as np
import gstools as gs
from matplotlib import cm
from mpl_toolkits.axes_grid1 import make_axes_locatable


# In[2]:


# Set domain CONSTANTS

LX = 256.
LY = 256.

# Generate domain ranges for bathymetry
dx = 1.
dy = 1.
x = np.arange(0., LX, dx)
y = np.arange(0., LY, dy)
X, Y = np.meshgrid(x,y)


# # mannually design bath

# In[3]:


#1. set originall domain bathymetry

nX, nY = X.shape
bath0 = 1.5
bath = np.ones((nX, nY))*bath0
# bath[int(nX/2):, :] = -0.0

#block the domain
wall = 4
bath[:wall] = 1.5
bath[nX-wall:] = 1.5
bath[:,:wall] = 1.5
bath[:, nY-wall:] = 1.5
fig, ax = plt.subplots(figsize=(12,12))
divider = make_axes_locatable(ax)
cax = divider.append_axes('right', size='5%', pad=0.05)
im=ax.contourf(bath); 
ax.set_aspect('equal'); 
fig.colorbar(im, cax=cax) 


# In[4]:


#2. set second-order runnels across the first-order runnels
depth1 = -2.0
width1 = 4
dist1 = 8

for i in np.arange(wall, nX-wall, dist1):
    bath[i:i+width1, wall:-wall] = depth1
    
fig, ax = plt.subplots(figsize=(12,12))
divider = make_axes_locatable(ax)
cax = divider.append_axes('right', size='5%', pad=0.05)
im=ax.contourf(bath); 
ax.set_aspect('equal'); 
fig.colorbar(im, cax=cax)      


# In[5]:


#3. set first-order runnels across the central channel

depth2 = -2.0
width2 = 4
dist2 = 8

for j in np.arange(wall, nY-wall, dist2):
    bath[wall:-wall, j:j+width2] = depth2

fig, ax = plt.subplots(figsize=(12,12))
divider = make_axes_locatable(ax)
cax = divider.append_axes('right', size='5%', pad=0.05)
im=ax.contourf(bath); 
ax.set_aspect('equal'); 
fig.colorbar(im, cax=cax) 


# In[6]:


#4. define the central channel

width3 = 8
depth3 = -2.

nCenter = int(nX/2)
halfw = int(width3/2)
bath[nCenter-halfw:nCenter+halfw+4, wall:] = depth3

fig, ax = plt.subplots(figsize=(12,12))
divider = make_axes_locatable(ax)
cax = divider.append_axes('right', size='5%', pad=0.05)
im=ax.contourf(bath); 
ax.set_aspect('equal'); 
fig.colorbar(im, cax=cax)


# In[7]:


#5. add an open ocean to the south
ocn_dist = 64.
# assign water depth
ocn_nx = int(ocn_dist/dx)
ocn_ny = int(LY/dy)
ocn_dep = depth3*np.ones((ocn_ny, ocn_nx))
    
# concatenate land topography field_Gaussian_abs and water depth
bath_extend = np.zeros((ocn_ny+nX, nY))
bath_extend = np.concatenate((bath,ocn_dep),axis=1)

fig, ax = plt.subplots(figsize=(12,12))
divider = make_axes_locatable(ax)
cax = divider.append_axes('right', size='5%', pad=0.05)
im=ax.contourf(bath_extend, levels=8); 
ax.set_aspect('equal'); 
fig.colorbar(im, cax=cax)


figname = 'Channel_0115.jpg'
plt.savefig(figname, dpi=300)


# In[8]:


txtname = 'Channel_0115.txt'
np.savetxt(txtname, -bath_extend)


# In[9]:


txtname = 'manning.txt'
manning = np.ones((bath_extend.shape))*0.01
np.savetxt(txtname, manning)

