#!/bin/bash

#SBATCH --job-name=end_pose 
#SBATCH --nodes=1   
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8 #4   #num works4 can not be too big; 
#SBATCH --mem=68G #35G#25G  # 20G may cause bus error?   # mem * num_GPUS
##SBATCH --gpus=1   # p6000 6 rtx_6000 2
##SBATCH --gpus=v100:1   # p6000 6 rtx_6000 2
##SBATCH --gpus=rtxa5000:1   # p6000 6 rtx_6000 2
#SBATCH --gpus=a100:1   # p6000 6 rtx_6000 2
#SBATCH --time=180:00:00
##SBATCH --time=250:00:00
##SBATCH --time=10:00:00
#SBATCH --mail-user=xu.jinjing@uniklinikum-dresden.de
#SBATCH --mail-type=BEGIN,END,FAIL,REQUEUE,TIME_LIMIT_90
#SBATCH --error=/mnt/ceph/tco/TCO-Staff/Homes/jinjing/slurm_out/%j.err
#SBATCH --output=/mnt/ceph/tco/TCO-Staff/Homes/jinjing/slurm_out/%j.out
##SBATCH --open-mode=append





#python /mnt/ceph/tco/TCO-Staff/Homes/jinjing/proj/v_loc/ace/train_ace.py \
#/mnt/cluster/datasets/7scenes/7scenes_office /mnt/ceph/tco/TCO-Staff/Homes/jinjing/exps/train/ace/outputs/7scenes_office.pt \



# training
WANDB__SERVICE_WAIT=300 /mnt/cluster/environments/jinjingxu/pkg/envs/Gaussians4D/bin/python -u \
/mnt/ceph/tco/TCO-Staff/Homes/jinjing/proj/gs/4DGaussians/train.py  \
-s /mnt/ceph/tco/TCO-Staff/Homes/jinjing/proj/gs/4DGaussians/toy_data/SM/fc0_1_raw/colmap --port 6017

#test
#WANDB__SERVICE_WAIT=300 /mnt/cluster/environments/jinjingxu/pkg/envs/ace/bin/python -u /mnt/ceph/tco/TCO-Staff/Homes/jinjing/proj/v_loc/ace/test_ace.py  \
#/mnt/cluster/datasets/7scenes/7scenes_heads /mnt/ceph/tco/TCO-Staff/Homes/jinjing/exps/train/ace/outputs/7scenes_heads.pt \
#--render_visualization True \
#--render_target_path /mnt/ceph/tco/TCO-Staff/Homes/jinjing/exps/train/ace/test_render/ 


 
