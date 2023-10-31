
run:
	make search

all:
	make clean
	make start
	make search

search:
	bash ./showdupes.sh ./temp/ 30

clean:
	rm -rf ./temp/

start:
	bash ./mkdirs.sh

