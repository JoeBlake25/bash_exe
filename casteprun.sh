#!/bin/bash
#
#
#SBATCH --nodes=10
#SBATCH --tasks-per-node=20
#SBATCH --exclusive

#SBATCH -o  %J.o
#SBATCH -e  %J.e
#SBATCH --time=72:00:00






mpirun -srun  castep.mpi Tl2NiMnO6
