# scail2-Boris-autoinstall

Automatic model installation for SCAIL-2 Infinity ComfyUI workflows on RunPod.

## How to run

```bash
cd /workspace
git clone https://github.com/lenivez/scail2-Boris-autoinstall
cd scail2-Boris-autoinstall
chmod +x install_scail2_models.sh startup.sh
bash startup.sh
```

## Models (~36 GB total)

| Model | Size | Folder |
|---|---|---|
| wan2.1_14B_SCAIL_2_fp8_scaled.safetensors | ~16 GB | diffusion_models/ |
| wan_2.1_vae.safetensors | ~1.2 GB | vae/ |
| umt5_xxl_fp8_e4m3fn_scaled.safetensors | ~9 GB | text_encoders/ |
| clip_vision_h.safetensors | ~630 MB | clip_vision/ |
| sam3.1_multiplex_fp16.safetensors | ~1.75 GB | checkpoints/ |
| wan2.1_SCAIL_2_DPO_lora_bf16.safetensors | ~1.23 GB | loras/Wan22/ |
| wan21-lightx2v-i2v-14b-480p-cfg-step-distill-rank256-bf16.safetensors | ~2.8 GB | loras/Wan22/ |
| Wan21_PusaV1_LoRA_14B_rank512_bf16.safetensors | ~4.91 GB | loras/Wan22/ |

## Model Sources

- https://huggingface.co/Comfy-Org/SCAIL-2
- https://huggingface.co/Comfy-Org/sam3.1
- https://huggingface.co/Kijai/WanVideo_comfy
