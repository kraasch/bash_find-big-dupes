#!/bin/bash

mkdir -p ./temp/
mkdir -p ./temp/a/
mkdir -p ./temp/b/
mkdir -p ./temp/b/x/
mkdir -p ./temp/b/y1/
mkdir -p ./temp/b/y1/y2/
mkdir -p ./temp/b/z/
mkdir -p ./temp/b/z/trash/
mkdir -p ./temp/c/
mkdir -p ./temp/c/d/
mkdir -p ./temp/c/d/e/
mkdir -p ./temp/c/d/e/trash/
mkdir -p ./temp/c/d/f/
mkdir -p ./temp/c/d/g/
mkdir -p ./temp/c/d/h/

cp ./data/* ./temp/a/
cp ./data/* ./temp/b/x/
cp ./data/* ./temp/b/y1/
cp ./data/* ./temp/b/y1/y2/
cp ./data/* ./temp/b/z/
echo MyTrash >./temp/b/z/trash/trash.txt
cp ./data/* ./temp/c/d/e/
cp ./data/* ./temp/c/d/f/
cp ./data/* ./temp/c/d/g/
cp ./data/* ./temp/c/d/h/
cp ./data/0.jpg ./temp/c/d/e/trash/

rm ./temp/b/x/0.jpg
rm ./temp/b/x/9.jpg

rm ./temp/b/z/0.jpg
rm ./temp/b/z/9.jpg

rm ./temp/c/d/f/0.jpg
rm ./temp/c/d/f/1.jpg
rm ./temp/c/d/f/2.jpg

rm ./temp/c/d/g/0.jpg
rm ./temp/c/d/g/1.jpg
rm ./temp/c/d/g/2.jpg

rm ./temp/c/d/h/0.jpg
rm ./temp/c/d/h/1.jpg

### END OF FILE.
