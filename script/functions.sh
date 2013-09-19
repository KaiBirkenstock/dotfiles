# From: https://github.com/holman/dotfiles/blob/master/script/bootstrap

DOTFILES_ROOT=`pwd`
CURDIR=`dirname $0`
SCRIPT_NAME=`basename $0`
MAKE="make"

if [ `uname` == "FreeBSD" ]; then
  MAKE="gmake"
fi

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_files () {
  rm -f $2
  ln -s $1 $2
  success "linked $1 to $2"
}
