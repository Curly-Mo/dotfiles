#!/bin/bash
cd $ZPLUG_HOME/repos/olivierverdier/zsh-git-prompt
stack setup
stack build && stack install
echo -e "GIT_PROMPT_EXECUTABLE="haskell"\n$(cat $HOME/.zsh_theme)" > $HOME/.zsh_theme
