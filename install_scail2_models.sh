#!/bin/bash
set -e
echo "=== SCAIL-2 — установка моделей (Boris Edition) ==="
mkdir -p /workspace/ComfyUI/models/diffusion_models
mkdir -p /workspace/ComfyUI/models/vae
mkdir -p /workspace/ComfyUI/models/text_encoders
mkdir -p /workspace/ComfyUI/models/clip_vision
mkdir -p /workspace/ComfyUI/models/checkpoints
mkdir -p /workspace/ComfyUI/models/loras/Wan22

echo "=== Основная модель SCAIL-2 fp8 (~16GB) ==="
wget -q --show-progress -O /workspace/ComfyUI/models/diffusion_models/wan2.1_14B_SCAIL_2_fp8_scaled.safetensors \
"https://huggingface.co/Comfy-Org/SCAIL-2/resolve/main/diffusion_models/wan2.1_14B_SCAIL_2_fp8_scaled.safetensors?download=true"

echo "=== VAE (1.2GB) ==="
wget -q --show-progress -O /workspace/ComfyUI/models/vae/wan_2.1_vae.safetensors \
"https://huggingface.co/Comfy-Org/SCAIL-2/resolve/main/vae/wan_2.1_vae.safetensors?download=true"

echo "=== Text Encoder umt5 fp8 (~9GB) ==="
wget -q --show-progress -O /workspace/ComfyUI/models/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors \
"https://huggingface.co/Comfy-Org/SCAIL-2/resolve/main/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors?download=true"

echo "=== CLIP Vision H (630MB) ==="
wget -q --show-progress -O /workspace/ComfyUI/models/clip_vision/clip_vision_h.safetensors \
"https://huggingface.co/Comfy-Org/SCAIL-2/resolve/main/clip_vision/clip_vision_h.safetensors?download=true"

echo "=== SAM 3.1 multiplex fp16 (1.75GB) ==="
wget -q --show-progress -O /workspace/ComfyUI/models/checkpoints/sam3.1_multiplex_fp16.safetensors \
"https://huggingface.co/Comfy-Org/sam3.1/resolve/main/checkpoints/sam3.1_multiplex_fp16.safetensors?download=true"

echo "=== LoRA: SCAIL-2 DPO bf16 (1.23GB) ==="
wget -q --show-progress -O /workspace/ComfyUI/models/loras/Wan22/wan2.1_SCAIL_2_DPO_lora_bf16.safetensors \
"https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/wan2.1_SCAIL_2_DPO_lora_bf16.safetensors?download=true"

echo "=== LoRA: LightX2V rank256 bf16 (2.8GB) ==="
wget -q --show-progress -O "/workspace/ComfyUI/models/loras/Wan22/wan21-lightx2v-i2v-14b-480p-cfg-step-distill-rank256-bf16.safetensors" \
"https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.safetensors?download=true"

echo "=== LoRA: PusaV1 rank512 bf16 (4.91GB) ==="
wget -q --show-progress -O /workspace/ComfyUI/models/loras/Wan22/Wan21_PusaV1_LoRA_14B_rank512_bf16.safetensors \
"https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Pusa/Wan21_PusaV1_LoRA_14B_rank512_bf16.safetensors?download=true"

echo "=== Все модели SCAIL-2 загружены! ==="
