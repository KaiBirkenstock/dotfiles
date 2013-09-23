. script/functions.sh

setup_gitconfig() {
  for i in gitconfig gitignore; do
    link_files ${DOTFILES_ROOT}/git/${i} ${HOME}/.${i}
  done

  rm -f ${HOME}/.gitconfig.local
  sed -e "s/AUTHORNAME/${GIT_AUTHORNAME}/" \
      -e "s/AUTHOREMAIL/${GIT_AUTHOREMAIL}/" \
      -e "s/GITHUBUSER/${GIT_GITHUBUSER}/" \
       ${DOTFILES_ROOT}/git/gitconfig.local.example > ${HOME}/.gitconfig.local
  success "setup local git configuration"
}

setup_gitconfig
