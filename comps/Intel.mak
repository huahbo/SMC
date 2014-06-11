    F90 := ifort
    FC  := ifort
    CC  := icc

    FFLAGS   = -module $(mdir) -I $(mdir)
    F90FLAGS = -module $(mdir) -I $(mdir)
    CFLAGS   = -std=c99

    ifdef OMP
      FFLAGS   += -openmp -openmp-report2
      F90FLAGS += -openmp -openmp-report2
      CFLAGS   += -openmp -openmp-report2
    endif

    ifdef NDEBUG
      F90FLAGS += -O3
      FFLAGS   += -O3
      CFLAGS   += -O3
    else
      F90FLAGS += -g -traceback -O0 #-check all -warn all -u 
      FFLAGS   += -g -traceback -O0 #-check all -warn all -u 
      CFLAGS   += -g -Wcheck
    endif

    ifdef GPROF
      FFLAGS   += -p
      F90FLAGS += -p
      CFLAGS   += -p
    endif
