#!/bin/bash
set -e
echo "=== SCAIL-2 Infinity — автоустановка моделей (Boris Edition) ==="
bash "$(dirname "$0")/install_scail2_models.sh"
echo "=== Установка кастомных нодов ==="
NODES_DIR="/workspace/ComfyUI/custom_nodes"
NODE_DEST="$NODES_DIR/comfyui-scail2-infinity"
if [ ! -d "$NODE_DEST" ]; then
    echo "Копирую comfyui-scail2-infinity..."
    cp -r "$(dirname "$0")/custom_node" "$NODE_DEST"
    echo "comfyui-scail2-infinity установлена"
else
    echo "comfyui-scail2-infinity уже установлена"
fi
echo "=== Запуск ComfyUI ==="
cd /workspace/ComfyUI
pkill -f "python.*main.py" 2>/dev/null || true
sleep 2
python main.py --listen 0.0.0.0 --port 3000 --disable-xformers
