#!/usr/bin/env bash

set -e

. `pwd`/script/functions.sh


init_submodules() {
  git submodule init && git submodule update
  success "updating git submodules"
}

init_submodules

# Execute all install scripts
for file in `find $DOTFILES_ROOT -maxdepth 2 -name "install.sh"`
do
  /usr/bin/env bash $file
done

link_files ${DOTFILES_ROOT}/bin ${HOME}/bin
