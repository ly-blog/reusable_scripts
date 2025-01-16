#!/bin/sh -e

OF=./list.md

run(){
cd blog
for d in */;do
	echo "### $d"
	(cd "$d"&& ls|sed -E "s|(.*)|* [\1](<blog/$d\1>)|g")
	echo ---
done
}

echo '## List'>$OF
(run)>>$OF
