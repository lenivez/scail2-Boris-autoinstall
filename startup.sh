#!/bin/bash
set -e
echo "=== SCAIL-2 Infinity — автоустановка моделей (Boris Edition) ==="
bash "$(dirname "$0")/install_scail2_models.sh"
echo "=== Установка кастомных нодов ==="
NODE_DEST="/workspace/ComfyUI/custom_nodes/comfyui-scail2-infinity"
if [ ! -d "$NODE_DEST" ]; then
    echo "Копирую comfyui-scail2-infinity..."
    cp -r "$(dirname "$0")/custom_node" "$NODE_DEST"
    echo "comfyui-scail2-infinity установлена"
else
    echo "comfyui-scail2-infinity уже установлена"
fi
echo "=== Готово! ==="
