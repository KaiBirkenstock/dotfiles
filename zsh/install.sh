. script/functions.sh

for file in `find ${CURDIR} -maxdepth 1 -type f -not -name "${SCRIPT_NAME}"`
do
  target=`basename $file`
  link_files $file ${HOME}/.$target
done

cd ${CURDIR}/zprezto && git submodule init && git submodule update && cd ${OLDPWD}
link_files ${CURDIR}/zprezto ${HOME}/.zprezto
