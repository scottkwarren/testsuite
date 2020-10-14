#!/bin/bash

. ./setup.sh
export LIBPAPYRUS=${PAPYRUS_ROOT}/lib/libpapyruskv.a

TESTLIST="01_open_close  02_put_get  03_barrier  04_delete  05_fence  06_signal  07_consistency  08_protect  09_cache  10_checkpoint  11_restart  12_free "
# The last one, 13_upc, is using UPC.

for d in $TESTLIST; do 
    cd $d
    #mpicxx 
    eval $TEST_CXX_MPI -I${PAPYRUS_ROOT}/include -g -o test${d} test${d}.c $LIBPAPYRUS -lpthread -lm
    cd ..
done
