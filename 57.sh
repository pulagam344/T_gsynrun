#!/bin/bash
echo 1.20

apt-get install -y sudo
sudo apt-get update

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
nvm install 22
nvm use 22
nvm alias default 22
npm install -g yarn

pip install git+https://github.com/huggingface/trl.git@main
pip install wandb==0.15.12
pip install gensyn-genrl==0.1.6
pip install reasoning-gym>=0.1.20 # for reasoning gym env
pip install trl # for grpo config, will be deprecated soon
pip install hivemind@git+https://github.com/gensyn-ai/hivemind@639c964a8019de63135a2594663b5bec8e5356dd # We need the latest, 1.1.11 is broken

sudo apt-get install kmod -y
pip uninstall -y libtpu libtpu-nightly tensorflow_tpu torch-xla tpu-info

tpu_vars=(
    "TPU_CHIPS_PER_HOST_BOUNDS" "XRT_TPU_CONFIG" "CLOUD_TPU_TASK_ID"
    "TPU_ML_PLATFORM" "TPU_SKIP_MDS_QUERY" "TPU_RUNTIME_METRICS_PORTS"
    "TPU_WORKER_ID" "ISTPUVM" "PJRT_DEVICE" "TPU_WORKER_HOSTNAMES"
    "LIBTPU_INIT_ARGS" "TPU_ACCELERATOR_TYPE" "TPU_HOST_BOUNDS"
    "TPU_PROCESS_ADDRESSES" "CLOUD_TPU_TASK_ID" "TPU_ML_PLATFORM_VERSION"
)

for var in "${tpu_vars[@]}"; do
    unset "$var"
done

pip uninstall -y tensorflow tensorboard
pip install tensorflow==2.12.0 tensorboard==2.12.0

pip install --upgrade protobuf==6.31.1

export HYDRA_FULL_ERROR=1
export PYTORCH_CUDA_ALLOC_CONF='expandable_segments:True'
git config --global credential.helper store

# Part 1
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_1
cd /root/my_rl_swarm_1
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/C_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_1.pem
sed -i 's|3000|3001|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3001|' run_rl_swarm.sh
sed -i 's|3000|3001|' rgym_exp/config/rg-swarm.yaml
# Part 2
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_2
cd /root/my_rl_swarm_2
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_2.pem
sed -i 's|3000|3002|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3002|' run_rl_swarm.sh
sed -i 's|3000|3002|' rgym_exp/config/rg-swarm.yaml
# Part 3
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_3
cd /root/my_rl_swarm_3
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_3.pem
sed -i 's|3000|3003|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3003|' run_rl_swarm.sh
sed -i 's|3000|3003|' rgym_exp/config/rg-swarm.yaml
# Part 4
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_4
cd /root/my_rl_swarm_4
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_4.pem
sed -i 's|3000|3004|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3004|' run_rl_swarm.sh
sed -i 's|3000|3004|' rgym_exp/config/rg-swarm.yaml
# Part 5
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_5
cd /root/my_rl_swarm_5
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_5.pem
sed -i 's|3000|3005|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3005|' run_rl_swarm.sh
sed -i 's|3000|3005|' rgym_exp/config/rg-swarm.yaml
# Part 6
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_6
cd /root/my_rl_swarm_6
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_6.pem
sed -i 's|3000|3006|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3006|' run_rl_swarm.sh
sed -i 's|3000|3006|' rgym_exp/config/rg-swarm.yaml
# Part 7
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_7
cd /root/my_rl_swarm_7
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_7.pem
sed -i 's|3000|3007|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3007|' run_rl_swarm.sh
sed -i 's|3000|3007|' rgym_exp/config/rg-swarm.yaml
# Part 8
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_8
cd /root/my_rl_swarm_8
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_8.pem
sed -i 's|3000|3008|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3008|' run_rl_swarm.sh
sed -i 's|3000|3008|' rgym_exp/config/rg-swarm.yaml
# Part 9
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_9
cd /root/my_rl_swarm_9
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_9.pem
sed -i 's|3000|3009|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3009|' run_rl_swarm.sh
sed -i 's|3000|3009|' rgym_exp/config/rg-swarm.yaml
# Part 10
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_10
cd /root/my_rl_swarm_10
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_10.pem
sed -i 's|3000|3010|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3010|' run_rl_swarm.sh
sed -i 's|3000|3010|' rgym_exp/config/rg-swarm.yaml
# Part 11
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_11
cd /root/my_rl_swarm_11
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_11.pem
sed -i 's|3000|3011|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3011|' run_rl_swarm.sh
sed -i 's|3000|3011|' rgym_exp/config/rg-swarm.yaml
# Part 12
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_12
cd /root/my_rl_swarm_12
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_12.pem
sed -i 's|3000|3012|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3012|' run_rl_swarm.sh
sed -i 's|3000|3012|' rgym_exp/config/rg-swarm.yaml
# Part 13
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_13
cd /root/my_rl_swarm_13
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_13.pem
sed -i 's|3000|3013|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3013|' run_rl_swarm.sh
sed -i 's|3000|3013|' rgym_exp/config/rg-swarm.yaml
# Part 14
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_14
cd /root/my_rl_swarm_14
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_14.pem
sed -i 's|3000|3014|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3014|' run_rl_swarm.sh
sed -i 's|3000|3014|' rgym_exp/config/rg-swarm.yaml
# Part 15
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_15
cd /root/my_rl_swarm_15
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_15.pem
sed -i 's|3000|3015|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3015|' run_rl_swarm.sh
sed -i 's|3000|3015|' rgym_exp/config/rg-swarm.yaml
# Part 16
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_16
cd /root/my_rl_swarm_16
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_16.pem
sed -i 's|3000|3016|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3016|' run_rl_swarm.sh
sed -i 's|3000|3016|' rgym_exp/config/rg-swarm.yaml
# Part 17
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_17
cd /root/my_rl_swarm_17
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_17.pem
sed -i 's|3000|3017|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3017|' run_rl_swarm.sh
sed -i 's|3000|3017|' rgym_exp/config/rg-swarm.yaml
# Part 18
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_18
cd /root/my_rl_swarm_18
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_18.pem
sed -i 's|3000|3018|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3018|' run_rl_swarm.sh
sed -i 's|3000|3018|' rgym_exp/config/rg-swarm.yaml
# Part 19
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_19
cd /root/my_rl_swarm_19
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_19.pem
sed -i 's|3000|3019|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3019|' run_rl_swarm.sh
sed -i 's|3000|3019|' rgym_exp/config/rg-swarm.yaml
# Part 20
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_20
cd /root/my_rl_swarm_20
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_20.pem
sed -i 's|3000|3020|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3020|' run_rl_swarm.sh
sed -i 's|3000|3020|' rgym_exp/config/rg-swarm.yaml
# Part 21
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_21
cd /root/my_rl_swarm_21
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_21.pem
sed -i 's|3000|3021|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3021|' run_rl_swarm.sh
sed -i 's|3000|3021|' rgym_exp/config/rg-swarm.yaml
# Part 22
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_22
cd /root/my_rl_swarm_22
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_22.pem
sed -i 's|3000|3022|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3022|' run_rl_swarm.sh
sed -i 's|3000|3022|' rgym_exp/config/rg-swarm.yaml
# Part 23
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_23
cd /root/my_rl_swarm_23
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_23.pem
sed -i 's|3000|3023|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3023|' run_rl_swarm.sh
sed -i 's|3000|3023|' rgym_exp/config/rg-swarm.yaml
# Part 24
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_24
cd /root/my_rl_swarm_24
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_24.pem
sed -i 's|3000|3024|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3024|' run_rl_swarm.sh
sed -i 's|3000|3024|' rgym_exp/config/rg-swarm.yaml
# Part 25
git clone https://github.com/gensyn-ai/rl-swarm.git /root/my_rl_swarm_25
cd /root/my_rl_swarm_25
rm -f run_rl_swarm.sh && wget -O run_rl_swarm.sh https://raw.githubusercontent.com/pulagam344/gsyn_runsh/main/T_run_rl_swarm.sh && chmod +x run_rl_swarm.sh
wget -O rgym_exp/config/rg-swarm.yaml https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/c-rg-swarm.yaml
wget -O rgym_exp/src/manager.py https://raw.githubusercontent.com/pulagam344/gsyn_connfig/main/T_manager.py
wget -O modal-login/temp-data/userData.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userData.json
wget -O modal-login/temp-data/userApiKey.json https://raw.githubusercontent.com/pulagam344/gsyn_login/main/117/userApiKey.json
wget -O swarm.pem https://raw.githubusercontent.com/pulagam344/swarm_peer/main/T_swarm_peers/57/swarm_25.pem
sed -i 's|3000|3025|' hivemind_exp/chain_utils.py
sed -i 's|REPLACE|3025|' run_rl_swarm.sh
sed -i 's|3000|3025|' rgym_exp/config/rg-swarm.yaml


# Function to run a swarm with logging and core allocation
run_swarm() {
  local dir=$1
  local swarm_name=$2
  local core_start=$3
  local core_end=$4
  (
    cd "$dir" && taskset -c $core_start-$core_end ./run_rl_swarm.sh 2>&1 |
    while IFS= read -r line; do
      echo "[$(date +%H:%M:%S)]-[$swarm_name] $line"
    done
  )
}

# Function to monitor and restart swarms
monitor_swarms() {
  while true; do
    # Check swarm_1
    if [ ! -f "/root/running_3001.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_1 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_1" "swarm_1" 0 3 &
    fi
    # Check swarm_2
    if [ ! -f "/root/running_3002.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_2 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_2" "swarm_2" 4 7 &
    fi
    # Check swarm_3
    if [ ! -f "/root/running_3003.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_3 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_3" "swarm_3" 8 11 &
    fi
    # Check swarm_4
    if [ ! -f "/root/running_3004.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_4 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_4" "swarm_4" 12 15 &
    fi
    # Check swarm_5
    if [ ! -f "/root/running_3005.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_5 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_5" "swarm_5" 16 19 &
    fi
    # Check swarm_6
    if [ ! -f "/root/running_3006.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_6 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_6" "swarm_6" 20 23 &
    fi
    # Check swarm_7
    if [ ! -f "/root/running_3007.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_7 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_7" "swarm_7" 24 27 &
    fi
    # Check swarm_8
    if [ ! -f "/root/running_3008.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_8 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_8" "swarm_8" 28 31 &
    fi
    # Check swarm_9
    if [ ! -f "/root/running_3009.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_9 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_9" "swarm_9" 32 35 &
    fi
    # Check swarm_10
    if [ ! -f "/root/running_3010.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_10 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_10" "swarm_10" 36 39 &
    fi
    # Check swarm_11
    if [ ! -f "/root/running_3011.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_11 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_11" "swarm_11" 40 43 &
    fi
    # Check swarm_12
    if [ ! -f "/root/running_3012.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_12 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_12" "swarm_12" 44 47 &
    fi
    # Check swarm_13
    if [ ! -f "/root/running_3013.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_13 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_13" "swarm_13" 48 51 &
    fi
    # Check swarm_14
    if [ ! -f "/root/running_3014.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_14 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_14" "swarm_14" 52 55 &
    fi
    # Check swarm_15
    if [ ! -f "/root/running_3015.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_15 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_15" "swarm_15" 56 59 &
    fi
    # Check swarm_16
    if [ ! -f "/root/running_3016.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_16 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_16" "swarm_16" 60 63 &
    fi
    # Check swarm_17
    if [ ! -f "/root/running_3017.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_17 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_17" "swarm_17" 64 67 &
    fi
    # Check swarm_18
    if [ ! -f "/root/running_3018.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_18 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_18" "swarm_18" 68 71 &
    fi
    # Check swarm_19
    if [ ! -f "/root/running_3019.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_19 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_19" "swarm_19" 72 75 &
    fi
    # Check swarm_20
    if [ ! -f "/root/running_3020.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_20 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_20" "swarm_20" 76 79 &
    fi
    # Check swarm_21
    if [ ! -f "/root/running_3021.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_21 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_21" "swarm_21" 80 83 &
    fi
    # Check swarm_22
    if [ ! -f "/root/running_3022.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_22 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_22" "swarm_22" 84 87 &
    fi
    # Check swarm_23
    if [ ! -f "/root/running_3023.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_23 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_23" "swarm_23" 88 91 &
    fi
    # Check swarm_24
    if [ ! -f "/root/running_3024.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_24 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_24" "swarm_24" 92 93 &
    fi
    # Check swarm_25
    if [ ! -f "/root/running_3025.txt" ]; then
      echo "[$(date +%H:%M:%S)]-[monitor] Swarm_25 stopped, restarting..."
      run_swarm "/root/my_rl_swarm_25" "swarm_25" 94 95 &
    fi

    # Wait before next check (e.g., every 2 minutes)
    sleep 120
  done
}

# Start all swarms with specific core allocations
run_swarm "/root/my_rl_swarm_1" "swarm_1" 0 3 &
sleep 250
run_swarm "/root/my_rl_swarm_2" "swarm_2" 4 7 &
sleep 5
run_swarm "/root/my_rl_swarm_3" "swarm_3" 8 11 &
sleep 5
run_swarm "/root/my_rl_swarm_4" "swarm_4" 12 15 &
sleep 5
run_swarm "/root/my_rl_swarm_5" "swarm_5" 16 19 &
sleep 5
run_swarm "/root/my_rl_swarm_6" "swarm_6" 20 23 &
sleep 5
run_swarm "/root/my_rl_swarm_7" "swarm_7" 24 27 &
sleep 5
run_swarm "/root/my_rl_swarm_8" "swarm_8" 28 31 &
sleep 5
run_swarm "/root/my_rl_swarm_9" "swarm_9" 32 35 &
sleep 5
run_swarm "/root/my_rl_swarm_10" "swarm_10" 36 39 &
sleep 5
run_swarm "/root/my_rl_swarm_11" "swarm_11" 40 43 &
sleep 5
run_swarm "/root/my_rl_swarm_12" "swarm_12" 44 47 &
sleep 5
run_swarm "/root/my_rl_swarm_13" "swarm_13" 48 51 &
sleep 5
run_swarm "/root/my_rl_swarm_14" "swarm_14" 52 55 &
sleep 5
run_swarm "/root/my_rl_swarm_15" "swarm_15" 56 59 &
sleep 5
run_swarm "/root/my_rl_swarm_16" "swarm_16" 60 63 &
sleep 5
run_swarm "/root/my_rl_swarm_17" "swarm_17" 64 67 &
sleep 5
run_swarm "/root/my_rl_swarm_18" "swarm_18" 68 71 &
sleep 5
run_swarm "/root/my_rl_swarm_19" "swarm_19" 72 75 &
sleep 5
run_swarm "/root/my_rl_swarm_20" "swarm_20" 76 79 &
sleep 5
run_swarm "/root/my_rl_swarm_21" "swarm_21" 80 83 &
sleep 5
run_swarm "/root/my_rl_swarm_22" "swarm_22" 84 87 &
sleep 5
run_swarm "/root/my_rl_swarm_23" "swarm_23" 88 91 &
sleep 5
run_swarm "/root/my_rl_swarm_24" "swarm_24" 92 93 &
sleep 5
run_swarm "/root/my_rl_swarm_25" "swarm_25" 94 95 &
sleep 5

# Start monitoring after 1 minute
sleep 60
monitor_swarms &

# Wait for all background processes to complete
wait
