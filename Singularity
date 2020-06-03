Bootstrap:docker
From:neurodebian:latest

%setup
    mkdir -p ${SINGULARITY_ROOTFS}/downloads
    mkdir -p ${SINGULARITY_ROOTFS}/code
    
    install -m 755 ./code/main.sh ${SINGULARITY_ROOTFS}/code

%post
    apt-get update
    apt-get -y install wget unzip libxext6 libxt6

    # download software
    MCRURL="https://ssd.mathworks.com/supportfiles/downloads/R2017b/deployment_files/R2017b/installers/glnxa64/MCR_R2017b_glnxa64_installer.zip"
    SPMURL="https://upload.uni-jena.de/data/5eb56ac0672962.94160102/Archiv.zip"
    CATURL="http://www.neuro.uni-jena.de/cat12/cat12_latest.zip"

    cd /downloads
    wget "${MCRURL}" && unzip -d /downloads/MCR MCR_R2017b_glnxa64_installer.zip
    wget "${SPMURL}" && unzip -d /code/SPM Archiv.zip
    wget "${CATURL}" && unzip -d /downloads/CAT cat12_latest.zip

    # install MCR
    /downloads/MCR/install -mode silent -agreeToLicense yes

    # install SPM
    /code/SPM/run_spm12.sh /usr/local/MATLAB/MATLAB_Runtime/v93 quit
    cd /code/SPM && chmod +rx run_spm12.sh spm12.sh spm12

    # install CAT standalone interface
    install -m 755 /downloads/CAT/cat12/standalone/*.sh /code

    # set permissions
    find /code -type f -print0 | xargs -0 chmod +r
    
    rm -fr /downloads

    apt-get clean
    apt-get autoremove

%environment
    export SPMROOT=/code/SPM
    export MCRROOT=/usr/local/MATLAB/MATLAB_Runtime/v93
    export MCR_INHIBIT_CTF_LOCK=1

%runscript
    exec /code/main.sh "$@"

%help

This container allows to run the standalone, compiled version of the Computational Anatomy Toolbox (CAT), which is an extension to SPM software. Using the container does not require the availability of a MATLAB licence.

The container includes:

- MATLAB Compiler Runtime (R2017b, 9.3)
- Standalone version of SPM software (SPM12, r7771)
- Computational Anatomy Toolbox (CAT12.7-Beta, r1613)
- Interface scripts (cat_standalone.sh, cat_parallelize.sh), included in the official distribution of CAT.

For more details on the exact version of the software used in this container, please refer to the README file.

HOW TO USE:

In principle this container allows you to perform the very same types of analysis that are possible with the standalone version of CAT. It is assumed that the user is familiar with the content of the batch files dedicated for the use with the standalone version of CAT (cat_standalone_segment.txt, cat_standalone_simple.txt, cat_standalone_resample.txt, cat_standalone_smooth.txt) and can modify their content according to his/her needs. For more details, please refer to the CAT12 documentation and manual.

Run the CAT analysis with the following command:
singularity run --cleanenv <container> <batch file> <arguments>

EXAMPLES:

CAT12 segmentation batch:
singularity run --cleanenv container.simg cat_standalone_segment.txt T1.nii

CAT12 simple processing batch:
singularity run --cleanenv container.simg cat_standalone_simple.txt T1.nii

CAT12 resample & smooth batch:
singularity run --cleanenv container.simg cat_standalone_resample.txt "12" "1" lh.thickness.T1

CAT12 volume smoothing batch:
singularity run --cleanenv container.simg cat_standalone_smooth.txt "[6 6 6]" "'s6'" T1.nii


Known issues:
- Parallelization with cat_parallelize.sh is not implemented yet.


Contact information:

Any problems or concerns regarding this container should be reported to Malgorzata Wierzba (m.wierzba@fz-juelich.de) or Michael Hanke (m.hanke@fz-juelich.de).


Acknowledgements:

The CAT toolbox (http://www.neuro.uni-jena.de/cat) is developed by Christian Gaser and Robert Dahnke (Jena University Hospital, Departments of Psychiatry and Neurology) and is free but copyright software, distributed under the terms of the GNU General Public Licence.

The SPM software (https://www.fil.ion.ucl.ac.uk/spm/) is developed by the Wellcome Trust Centre for Neuroimaging and is free but copyright software, distributed under the terms of the GNU General Public Licence.

MATLAB Compiler Runtime (https://uk.mathworks.com/products/compiler/matlab-runtime.html) is developed by the The MathWorks, Inc. and is subject to the MATLAB Runtime licence.

