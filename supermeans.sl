#!/bin/bash -l

# DIRECTIVES:
#SBATCH --time=24:00:00
#SBATCH --error=supermeans-u-bb075.err
##SBATCH --out=supermeans-u-bb075.out
#SBATCH --job-name=supermeans-u-bb075
#SBATCH --partition=nesi_prepost
#SBATCH --cpus-per-task=1
#SBATCH --account=niwa00013
#SBATCH --hint=nomultithread
#SBATCH --mem-per-cpu=200G
#SBATCH --nodes=1
#SBATCH --ntasks=1

export runid=bb075
export nyears=20
export firstyear=1989

echo $runid 'for ' $nyears ' years starting in' $firstyear '!'

export PATH=/nesi/nobackup/niwa00013/williamsjh/miniconda2/bin:$PATH

#source activate python2-validation-note_env

#/nesi/nobackup/niwa00013/williamsjh/miniconda2/envs/python2-validation-note_env/bin/python  -u ~/scripts/supermeans.py --nyears=$nyears --in_dir=/nesi/project/niwa00013/williamsjh/MASS/u-bb075/apm.pp/ --runid=$runid --firstyear=1989 --prefix=bb075

source activate master

/nesi/nobackup/niwa00013/williamsjh/miniconda2/envs/master/bin/python  -u ~/scripts/supermeans-ann.py --nyears=$nyears --in_dir=/nesi/project/niwa00013/williamsjh/MASS/u-$runid/apm.pp/ --runid=$runid --firstyear=$firstyear --prefix=$runid

