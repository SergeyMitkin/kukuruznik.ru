for file in `find /etc -type f -name "*.conf"`
do
	sed -e '/^M/d' $file;
done
