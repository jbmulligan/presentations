cat *.htm 					\
	| awk -F "<img src=" '{print $2}'	\
	| awk -F '"' '{print $2}'		\
	| sort					\
	| uniq					\
	> image_files

files=(`cat image_files`)

for file in ${files[@]}; do
	if [[ ! -e $file ]]; then
		echo "File $file does not exist"
	fi
done

