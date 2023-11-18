#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -sfnv ${SCRIPT_DIR}/.zshrc ~/
ln -sfnv ${SCRIPT_DIR}/.vimrc ~/
ln -sfnv ${SCRIPT_DIR}/zsh/ ~/
ln -sfnv ${SCRIPT_DIR}/.config/ ~/
