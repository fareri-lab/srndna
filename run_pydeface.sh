#!/usr/bin/env bash

# example code for pydeface
# runs pydeface on input subject, but need to fix permisions on input data first
# usage: bash run_pydeface.sh sub
# example: bash run_pydeface.sh 102

sub=$1
bidsroot=/data/projects/srndna/bids

sudo chmod -R aug+rwx ${bidsroot}/sub-${sub}

# defacing anatomicals to ensure compatibility with data sharing
pydeface.py ${bidsroot}/sub-${sub}/anat/sub-${sub}_T1w.nii.gz
mv ${bidsroot}/sub-${sub}/anat/sub-${sub}_T1w_defaced.nii.gz ${bidsroot}/sub-${sub}/anat/sub-${sub}_T1w.nii.gz
pydeface.py ${bidsroot}/sub-${sub}/anat/sub-${sub}_T2w.nii.gz
mv ${bidsroot}/sub-${sub}/anat/sub-${sub}_T2w_defaced.nii.gz ${bidsroot}/sub-${sub}/anat/sub-${sub}_T2w.nii.gz
