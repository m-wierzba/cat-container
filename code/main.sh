#! /bin/bash

NOW=$(date +%s)

case $(basename $1) in
    cat_standalone_segment.txt)       
    /code/cat_standalone.sh -b $1 $2 > $PWD/cat_standalone_segment_$NOW.log
    ;;
    cat_standalone_simple.txt)
    /code/cat_standalone.sh -b $1 $2 > $PWD/cat_standalone_simple_$NOW.log
    ;;            
    cat_standalone_resample.txt)       
    /code/cat_standalone.sh -b $1 -a1 "$2" -a2 "$3" $4 > $PWD/cat_standalone_resample_$NOW.log
    ;;
    cat_standalone_smooth.txt)       
    /code/cat_standalone.sh -b $1 -a1 "$2" -a2 "$3" $4 > $PWD/cat_standalone_smooth_$NOW.log
    ;;
    *)              
esac
