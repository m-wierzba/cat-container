#! /bin/bash

NOW=$(date +%s)
LOG=${SINGULARITY_ROOTFS}/mnt

case  $1  in
    cat_standalone_segment.txt)       
    /code/cat_standalone.sh -b /mnt/$1 /mnt/$2 > $LOG/cat_standalone_segment_$NOW.log
    ;;
    cat_standalone_simple.txt)
    /code/cat_standalone.sh -b /mnt/$1 /mnt/$2 > $LOG/cat_standalone_simple_$NOW.log
    ;;            
    cat_standalone_resample.txt)       
    /code/cat_standalone.sh -b /mnt/$1 -a1 "$2" -a2 "$3" /mnt/$4 > $LOG/cat_standalone_resample_$NOW.log
    ;;
    cat_standalone_smooth.txt)       
    /code/cat_standalone.sh -b /mnt/$1 -a1 "$2" -a2 "$3" /mnt/$4 > $LOG/cat_standalone_smooth_$NOW.log
    ;;
    *)              
esac
