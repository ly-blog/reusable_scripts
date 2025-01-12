#!/bin/sh

addKey(){ #file
mkdir ~/.ssh
cd ~/.ssh
echo "Host $HOST
  AddKeysToAgent yes
  IdentityFile ~/.ssh/$NAME
" >>config
echo "$SSHKEY" >$NAME
chmod 600 $NAME
}

push(){
git remote add o "$REMOTE"
git push o main -f
}

eval $(ssh-agent)
(NAME=codeberg HOST=codeberg.org SSHKEY="$SSHKEY_CODEBERG" addKey)
cat ~/.ssh/config
ls ~/.ssh -lah
REMOTE="$REMOTE_CODEBERG" HOST=codeberg.org push
