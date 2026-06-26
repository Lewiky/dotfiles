#!/usr/bin/env bash
set -euo pipefail

OMZ_DIR="${HOME}/.oh-my-zsh"
OMZ_CUSTOM="${OMZ_DIR}/custom"

clone_if_missing() {
    local url="$1"
    local dest="$2"
    if [ ! -d "${dest}" ]; then
        echo "Installing ${dest}..."
        git clone --depth 1 "${url}" "${dest}"
    fi
}

clone_if_missing https://github.com/ohmyzsh/ohmyzsh.git              "${OMZ_DIR}"
clone_if_missing https://github.com/romkatv/powerlevel10k.git        "${OMZ_CUSTOM}/themes/powerlevel10k"
clone_if_missing https://github.com/zsh-users/zsh-autosuggestions.git "${OMZ_CUSTOM}/plugins/zsh-autosuggestions"
clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting.git "${OMZ_CUSTOM}/plugins/zsh-syntax-highlighting"
