#!/bin/sh
# Bootstrap dotfiles on a fresh machine (Codespaces, new install, etc.):
#   sh -c "$(curl -fsLS https://raw.githubusercontent.com/Lewiky/dotfiles/master/bootstrap.sh)"
set -e
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply Lewiky
