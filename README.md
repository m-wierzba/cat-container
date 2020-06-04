
# CAT container

This container allows to run the standalone, compiled version of the [Computational Anatomy Toolbox (CAT)](http://www.neuro.uni-jena.de/cat/), which is an extension to [SPM](https://www.fil.ion.ucl.ac.uk/spm/software/) software. Using the container does not require the availability of a MATLAB licence.

The container includes:

- [MATLAB Compiler Runtime](https://uk.mathworks.com/products/compiler/matlab-runtime.html) (R2017b, 9.3)
- Standalone version of [SPM](https://www.fil.ion.ucl.ac.uk/spm/software/) software (SPM12, r7771)
- [Computational Anatomy Toolbox](http://www.neuro.uni-jena.de/cat/) (CAT12.7-Beta, r1613)
- Interface scripts (`cat_standalone.sh`, `cat_parallelize.sh`), included in the [official distribution](http://www.neuro.uni-jena.de/cat/index.html#DOWNLOAD) of CAT.

For more details on the exact version of the software used in this container, please refer to the [recipe file](https://jugit.fz-juelich.de/m.wierzba/cat-container/-/blob/master/Singularity).

## How to use:

In principle this container allows you to perform the very same types of analysis that are possible with the standalone version of CAT. It is assumed that the user is familiar with the content of the [batch files](https://jugit.fz-juelich.de/m.wierzba/cat-container/-/tree/master/batch) dedicated for the use with the standalone version of CAT (`cat_standalone_segment.txt`, `cat_standalone_simple.txt`, `cat_standalone_resample.txt`, `cat_standalone_smooth.txt`) and can modify their content according to his/her needs. For more details, please refer to the [CAT12 documentation and manual](http://www.neuro.uni-jena.de/cat12/CAT12-Manual.pdf).

Run the CAT analysis with the following command:

`singularity run --cleanenv <container> <batch file> <arguments>`

## Examples:

CAT12 segmentation batch:

`singularity run --cleanenv container.simg -b cat_standalone_segment.txt T1.nii`

CAT12 simple processing batch:

`singularity run --cleanenv container.simg -b cat_standalone_simple.txt T1.nii`

CAT12 resample & smooth batch:

`singularity run --cleanenv container.simg -b cat_standalone_resample.txt -a1 "12" -a2 "1" lh.thickness.T1`

CAT12 volume smoothing batch:

`singularity run --cleanenv container.simg -b cat_standalone_smooth.txt -a1 "[6 6 6]" -a2 "'s6'" T1.nii`


## Known issues:

* Parallelization with `cat_parallelize.sh` is not implemented yet.


## Contact information:

Any problems or concerns regarding this container should be reported to Malgorzata Wierzba (m.wierzba@fz-juelich.de) or Michael Hanke (m.hanke@fz-juelich.de).


## Acknowledgements:

The CAT toolbox is developed by Christian Gaser and Robert Dahnke (Jena University Hospital, Departments of Psychiatry and Neurology) and is free but copyright software, distributed under the terms of the GNU General Public Licence.

The SPM software is developed by the Wellcome Trust Centre for Neuroimaging and is free but copyright software, distributed under the terms of the GNU General Public Licence.

MATLAB Compiler Runtime is developed by the The MathWorks, Inc. and is subject to the MATLAB Runtime licence.
