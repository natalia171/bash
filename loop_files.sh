#!/bin/bash
for folder in `find "/sasshare/maint/backups/arch_logs" -type d -maxdepth 1`
do
	echo "======Folder $folder"
	
		file_list=$( ls -lha $folder/cas/default | grep log|grep -v gz| grep cas_20 | grep G | grep -v 2022-05 | awk -v col9=9 '{print $col9}')
		for file in $file_list
		do	
			echo "Compressing $folder/cas/default/$file"
			gzip $folder/cas/default/$file
		done		
done 