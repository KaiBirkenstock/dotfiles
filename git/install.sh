. script/functions.sh

setup_gitconfig() {
  # echo $GIT_AUTHORNAME
  link_files ${DOTFILES_ROOT}/git/gitconfig ${HOME}/.gitconfig
  rm -f ${HOME}/.gitconfig.local
  sed -e "s/AUTHORNAME/${GIT_AUTHORNAME}/" \
      -e "s/AUTHOREMAIL/${GIT_AUTHOREMAIL}/" \
      -e "s/GITHUBUSER/${GIT_GITHUBUSER}/" \
       ${DOTFILES_ROOT}/git/gitconfig.local.example > ${HOME}/.gitconfig.local
  success "setup local git configuration"
}

setup_gitconfig
