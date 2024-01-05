# Quarl Reproduction Guide

## Introduction to Quarl

## Hardware Dependencies

### Training Requirements

- The reinforcement learning agent in Quarl necessitates the use of GPUs for training.
- For the results presented in Table 2, 3, 4 and Figure 12 of the original paper, machines equipped with A100 GPUs were employed.
- Machines with V100 GPUs were used for the ablation studies.

### Access to Hardware

- Due to the current GPU shortages, the specific hardware (A100 and V100 GPUs) used in our study is not available for artifact evaluation.

- We provide access to the CMU Catalyst Cluster as an alternative. However, it is important to note that this cluster is equipped with Nvidia A5000 GPUs, which differ in performance characteristics from the A100 and V100 GPUs used in our study.

- Cluster Specifications:
    - Each node in the cluster includes:
        - 128 CPU cores.
        - 512 GB of memory.
        - 4 A5000 GPUs with 24 GB of GPU memory each.
    - Access details:
        - Username: ?????
        - Password: ?????
    - Launching an Interactive Node:
        - For artifact evaluation, reviewers will need to launch an interactive node on the CMU Catalyst Cluster, which is managed by Slurm. Detailed instructions for launching an interactive session with Slurm are provided in the Get Started section.

### Impact on Results Reproduction

- Due to the change in hardware, especially the use of A5000 GPUs instead of A100s and V100s, it may not be possible to fully reproduce the results presented in the paper, particularly those that are sensitive to the specific GPU performance or have time constraints.

- We recommend that reviewers take this hardware discrepancy into account when evaluating the artifact.

## Get Started

### Logging in and Launching a Node on the Catalyst Cluster

#### Logging in

To access the Catalyst Cluster, use SSH with the following command:

```bash
ssh aaa@catalyst-cluster.cs.cmu.edu
```

This command logs you into the login node of the Catalyst Cluster.

#### Launching an Interactive Node with Slurm

Once logged in, you can launch an interactive node for your evaluation using Slurm. Use the command:

```bash
salloc --nodes=1 --ntasks-per-node=1 --cpus-per-task=128 --mem=512G --gres=gpu:4 --time=01:00:00
```

Here, the `--time=01:00:00` parameter specifies a 1-hour allocation, which you can adjust as needed. This command requests a node with the specified resources.

After executing this command, Slurm will allocate a node and inform you which node has been allocated, as shown below:

```
salloc: Nodes catalyst-0-11 are ready for job
```

#### Accessing the Allocated Node

To access the allocated node, use SSH again:

```bash
ssh catalyst-0-11
```

Replace `catalyst-0-11` with the actual node name provided by Slurm.


### Docker (Recommended for Evaluation)

To use already setup environment, start the docker container via the following command.

```shell
docker run --name quarl --gpus all -itd co1lin/quarl
docker exec -it quarl zsh
cd quarl-artifact # /home/ubuntu/quarl-artifact
git pull && git checkout quarl-repro
```

### Manual Setup (Recommended for Development)

1. Setup the Python environment with [mamba](https://github.com/quantum-compiler/Quarl-artifact/blob/master/INSTALL.md#install-from-source). 

2. Install Quartz following [this section](https://github.com/quantum-compiler/Quarl-artifact/blob/master/INSTALL.md#install-from-source), in which a mamba (conda) environment `quartz` is created.

3. Install packages for Quarl:

    ```shell
    # at the root dir of quarl-artifact repo
    git checkout quarl-repro
    cd experiment/ppo-new
    mamba activate quartz
    mamba env update --file env_ppo.yml
    ```

    After the installation completes, check if the GPU-enabled PyTorch is installed. If not (only the CPU version is installed), uninstall `torch` via `pip` and install the GPU-enabled PyTorch following the instruction on its official website.

4. Logging into the Weights & Biases (wandb) account


To maintain the anonymity of reviewers, a dedicated wandb account has been created and will be provided in the communication channel during the kick-the-tires phase.

Once logged into the wandb account, you need to obtain an API key. This key is used for authentication when logging into wandb on the cluster node. To get your API key, follow these steps:

- Log into the wandb website with the provided account credentials.
- Navigate to your account settings or API section to find your API key.

After obtaining your API key, you can log into wandb on the cluster node using the following command:


```bash
wandb login
```

When prompted, enter the API key you obtained from the wandb account.


5. Download the checkpoints for AI models and create some folders:

    ```shell
    # at the root dir of quarl-artifact repo
    git checkout quarl-repro
    cd experiment/ppo-new # this is the folder for Quarl experiments
    
    wget https://share.la.co1in.me/ckpts.zip
    unzip ckpts.zip && rm ckpts.zip
    mkdir ftlog
    ```

## Reproduce

- Program entry: `ppo.py`
- Output:
    - local: `outputs`
    - online: wandb project webpages, e.g. https://wandb.ai/userXYZ/IBM-Finetune-6l-seed

Examples for Table 2, Nam Gate set:

```shell
# w/o rotation merging pre-processing
CKPT=ckpts/nam2_iter_384_6l.pt BS=4800 CIRC=mod_red_21 GPU=0 bash scripts/nam2_search.sh
CKPT=ckpts/nam2_iter_384_6l.pt BS=3200 CIRC=adder_8 GPU=1 bash scripts/nam2_search.sh

# w/ rotation merging pre-processing
CKPT=ckpts/nam2_rm_iter_404_6l.pt BS=4800 CIRC=mod_red_21 GPU=2 bash scripts/nam2_rm_search.sh
CKPT=ckpts/nam2_rm_iter_404_6l.pt BS=3200 CIRC=adder_8 GPU=3 bash scripts/nam2_rm_search.sh
```

(Metrics in Table 3 are obtained from experiments for Table 2.)

Examples for Table 4, IBM Gate set:

```shell
CKPT=ckpts/ibm_iter_921_6l.pt BS=4800 CIRC=barenco_tof_10 GPU=0 bash scripts/ibm_search_6l.sh
CKPT=ckpts/ibm_iter_921_6l.pt BS=2400 CIRC=adder_8 GPU=1 bash scripts/ibm_search_6l.sh
```

