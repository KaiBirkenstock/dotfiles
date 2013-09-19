. script/functions.sh

install_emacs() {
  link_files ${CURDIR}/emacs.d ${HOME}/.emacs.d
}

install_emacs
