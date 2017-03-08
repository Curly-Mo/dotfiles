#!/bin/bash
curl -sSL https://get.haskellstack.org/ | sh
cd $ZPLUG_HOME/repos/olivierverdier/zsh-git-prompt
stack setup
stack build && stack install
echo "GIT_PROMPT_EXECUTABLE=\"haskell\"" >> $HOME/.localrc
