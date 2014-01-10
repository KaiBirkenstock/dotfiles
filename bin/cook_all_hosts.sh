#!/usr/bin/env zsh

cd ~/Code/nww_cookbooks/

for i in nodes/*; do
  CURRENT_NODE=`basename $i | sed -e 's/\(.*\)\.json/\1/'`
  tmux new-window -n ${CURRENT_NODE}
  tmux send-keys "cook_and_clean ${CURRENT_NODE}" C-m
done
