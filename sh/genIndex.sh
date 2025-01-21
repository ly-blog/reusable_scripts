#!/bin/sh -e

OF=./list.md

run(){
cd blog
for d in */;do
	echo "### $d"
	(cd "$d"&& ls|sed -E "s|(.*).md$|* [\1](<blog/$d\1.html>)  ([md](<blog/$d\1.md>))|g")
	echo ---
done
}

echo '## List'>$OF
(run)>>$OF
