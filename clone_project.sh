#!/bin/bash

[ -d $1 ] || git clone $2 $1

cp _Skeleton/build.sh $1/build.sh
cp _Skeleton/test.sh $1/test.sh
[ -f $1/.gitignore ] || cp _Skeleton/._gitignore $1/.gitignore

chmod +x $1/build.sh
chmod +x $1/test.sh

sed -i "s/\${Project_Name_Exe}/$1/g" $1/test.sh