# From: https://github.com/holman/dotfiles/blob/master/script/bootstrap

DOTFILES_ROOT=`pwd`
CURDIR=`dirname $0`
SCRIPT_NAME=`basename $0`

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_files () {
  if [ -f $2 ] || [ -d $2 ]; then
    # If the desination file exists and is a file or directory, rename it
    mv $2 $2.backup
  elif [ -L $2 ]; then
    # if the link already exists, unlink it
    unlink $2
  fi

  ln -s $1 $2
  success "linked $1 to $2"
}
