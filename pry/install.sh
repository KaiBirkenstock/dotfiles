. script/functions.sh

link_files ${CURDIR}/irb-config ${HOME}/.irb
cd ${CURDIR}/irb-config && ${MAKE} irb && ${MAKE} irbrc && ${MAKE} pryrc && cd ${OLDPWD}
