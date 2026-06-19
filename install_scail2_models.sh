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
if [ ! -f "/workspace/ComfyUI/models/diffusion_models/wan2.1_14B_SCAIL_2_fp8_scaled.safetensors" ]; then
    hf download Comfy-Org/SCAIL-2 diffusion_models/wan2.1_14B_SCAIL_2_fp8_scaled.safetensors \
        --local-dir /workspace/ComfyUI/models/diffusion_models/
    mv /workspace/ComfyUI/models/diffusion_models/diffusion_models/wan2.1_14B_SCAIL_2_fp8_scaled.safetensors \
       /workspace/ComfyUI/models/diffusion_models/wan2.1_14B_SCAIL_2_fp8_scaled.safetensors
    rmdir /workspace/ComfyUI/models/diffusion_models/diffusion_models 2>/dev/null || true
else
    echo "  уже есть, пропускаем"
fi

echo "=== VAE (254MB) ==="
if [ ! -f "/workspace/ComfyUI/models/vae/wan_2.1_vae.safetensors" ]; then
    hf download Comfy-Org/Wan_2.1_ComfyUI_repackaged split_files/vae/wan_2.1_vae.safetensors \
        --local-dir /workspace/ComfyUI/models/vae/
    mv /workspace/ComfyUI/models/vae/split_files/vae/wan_2.1_vae.safetensors \
       /workspace/ComfyUI/models/vae/wan_2.1_vae.safetensors
    rm -rf /workspace/ComfyUI/models/vae/split_files
else
    echo "  уже есть, пропускаем"
fi

echo "=== Text Encoder umt5 fp8 (~9GB) ==="
if [ ! -f "/workspace/ComfyUI/models/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors" ]; then
    hf download Comfy-Org/Wan_2.1_ComfyUI_repackaged \
        split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors \
        --local-dir /workspace/ComfyUI/models/text_encoders/
    mv /workspace/ComfyUI/models/text_encoders/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors \
       /workspace/ComfyUI/models/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors
    rm -rf /workspace/ComfyUI/models/text_encoders/split_files
else
    echo "  уже есть, пропускаем"
fi

echo "=== CLIP Vision H (630MB) ==="
if [ ! -f "/workspace/ComfyUI/models/clip_vision/clip_vision_h.safetensors" ]; then
    hf download Comfy-Org/Wan_2.1_ComfyUI_repackaged \
        split_files/clip_vision/clip_vision_h.safetensors \
        --local-dir /workspace/ComfyUI/models/clip_vision/
    mv /workspace/ComfyUI/models/clip_vision/split_files/clip_vision/clip_vision_h.safetensors \
       /workspace/ComfyUI/models/clip_vision/clip_vision_h.safetensors
    rm -rf /workspace/ComfyUI/models/clip_vision/split_files
else
    echo "  уже есть, пропускаем"
fi

echo "=== SAM 3.1 multiplex fp16 (1.75GB) ==="
if [ ! -f "/workspace/ComfyUI/models/checkpoints/sam3.1_multiplex_fp16.safetensors" ]; then
    hf download Comfy-Org/sam3.1 checkpoints/sam3.1_multiplex_fp16.safetensors \
        --local-dir /workspace/ComfyUI/models/checkpoints/
    mv /workspace/ComfyUI/models/checkpoints/checkpoints/sam3.1_multiplex_fp16.safetensors \
       /workspace/ComfyUI/models/checkpoints/sam3.1_multiplex_fp16.safetensors
    rmdir /workspace/ComfyUI/models/checkpoints/checkpoints 2>/dev/null || true
else
    echo "  уже есть, пропускаем"
fi

echo "=== LoRA: SCAIL-2 DPO bf16 (1.23GB) ==="
if [ ! -f "/workspace/ComfyUI/models/loras/Wan22/wan2.1_SCAIL_2_DPO_lora_bf16.safetensors" ]; then
    hf download Kijai/WanVideo_comfy wan2.1_SCAIL_2_DPO_lora_bf16.safetensors \
        --local-dir /workspace/ComfyUI/models/loras/Wan22/
else
    echo "  уже есть, пропускаем"
fi

echo "=== LoRA: LightX2V rank256 bf16 (2.8GB) ==="
if [ ! -f "/workspace/ComfyUI/models/loras/Wan22/wan21-lightx2v-i2v-14b-480p-cfg-step-distill-rank256-bf16.safetensors" ]; then
    hf download Kijai/WanVideo_comfy \
        Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.safetensors \
        --local-dir /workspace/ComfyUI/models/loras/Wan22/
    mv "/workspace/ComfyUI/models/loras/Wan22/Lightx2v/lightx2v_I2V_14B_480p_cfg_step_distill_rank256_bf16.safetensors" \
       "/workspace/ComfyUI/models/loras/Wan22/wan21-lightx2v-i2v-14b-480p-cfg-step-distill-rank256-bf16.safetensors"
    rmdir /workspace/ComfyUI/models/loras/Wan22/Lightx2v 2>/dev/null || true
else
    echo "  уже есть, пропускаем"
fi

echo "=== LoRA: PusaV1 rank512 bf16 (4.91GB) ==="
if [ ! -f "/workspace/ComfyUI/models/loras/Wan22/Wan21_PusaV1_LoRA_14B_rank512_bf16.safetensors" ]; then
    hf download Kijai/WanVideo_comfy \
        Pusa/Wan21_PusaV1_LoRA_14B_rank512_bf16.safetensors \
        --local-dir /workspace/ComfyUI/models/loras/Wan22/
    mv /workspace/ComfyUI/models/loras/Wan22/Pusa/Wan21_PusaV1_LoRA_14B_rank512_bf16.safetensors \
       /workspace/ComfyUI/models/loras/Wan22/Wan21_PusaV1_LoRA_14B_rank512_bf16.safetensors
    rmdir /workspace/ComfyUI/models/loras/Wan22/Pusa 2>/dev/null || true
else
    echo "  уже есть, пропускаем"
fi

echo "=== Все модели SCAIL-2 загружены! ==="
