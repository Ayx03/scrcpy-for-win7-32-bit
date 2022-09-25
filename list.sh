#!/system/bin/sh
function getdir() {
    for element in `ls $1`
    do  
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]; then 
            getdir $dir_or_file
		else
			if [ "${dir_or_file##*.}" = "apk" ]; then 
				echo $dir_or_file >>/data/local/tmp/a2.list
			fi
        fi  
    done
}

# first to clear a2.list
rm -f /data/local/tmp/a2.list
root_dir="/sdcard/"
getdir $root_dir
