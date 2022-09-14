#!/bin/bash
set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ -e ~/.vimrc ]; then
  echo "[NG] '.vimrc' is existed."
else
  ln -s $SCRIPT_DIR/.vimrc ~/.vimrc
  echo "[OK] create link: '.vimrc'."
fi

if [ -e ~/.vim ]; then
  echo "[NG] '.vim' is existed."
else
  ln -s $SCRIPT_DIR/.vim ~/.vim
  echo "[OK] create link: '.vim'."
fi
