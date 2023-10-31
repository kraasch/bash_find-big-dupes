function main() {
	target_dir="$1"
	min_kb="$2"

	function compareSumStrings() {
		sumstr="$1"
		# TODO: compare if any directories have the same checksum string (print those directories.)
		sort | datamash -s -W groupby 1 collapse 2 | awk '{print $2}' | grep ','
	}

	cd "$target_dir"
	function getSumStrOfDir() {
		# for all big directories, take the 3 first files (by name or size) and get their checksums.
		# add the three checksums togther into one string per directory.
		dir="$1"
		cd "$dir"
		sumstring=''
		find . -maxdepth 1 -mindepth 1 -type f | sort | head -3 | (
			while read filename; do
				sum=$(
					head -c 1000 "$filename" | # only print the first thousand bytes of the file.
						sha256sum |
						sed 's/ .*$//'
					#sed 's/ .*$//' | grep -o '^......' # NOTE: shorten the checksum for readability.
				)
				#sum="$sum " # NOTE: insert a space between checksums for readability.
				sumstring="${sumstring}${sum}"
			done
			echo "$sumstring $dir"
		)
		cd - >/dev/null
	}

	# TODO: in future, improve the checksum part: make this algorithm pick three files independent of their file name (eg the 3 biggest files).
	# find all directories, and check if they are big.
	find . -type d | while read x; do
		cd "$x"
		listed=$(ls . | wc -l)
		if $(test $listed -gt 5); then
			is_big=$(
				# print non-recusive directory size, if bigger than 'min_kb' (all files stored directly in each directory).
				find . -maxdepth 1 -mindepth 1 -type f |
					xargs -I{} du -s -BK "{}" |
					sed 's/K.*$//' |
					awk '{sum += $1} END {print sum}' |
					awk "\$1 > $min_kb"
			)
			if $(test -n "$is_big"); then
				echo "$x"
			fi
		fi
		cd - >/dev/null
	done | while read x; do getSumStrOfDir "$x"; done | compareSumStrings
}

main "$1" "$2"
