
#=======================================#
# Makefile options for Xplot11 library  #
#   Set up or select a set of compile   #
#   options for your system             #
#=======================================#


# Set library name
PLTLIB = libPlt_gDP.a

# Some fortrans need trailing underscores in C interface symbols (see Xwin.c)
# This should work for most of the "unix" fortran compilers
DEFINE = -DUNDERSCORE

FC = gfortran
CC  = gcc
DP = -fdefault-real-8

FFLAGS  = -O2 $(DP) -fallow-argument-mismatch
CFLAGS  = -O2 $(DEFINE) -I/opt/X11/include
AR = ar r
RANLIB = ranlib
LINKLIB = -L/opt/X11/lib -lX11

