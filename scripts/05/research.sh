#!/bin/bash


FOLDERS_NUM=$(find $FILE_PATH -type d | wc -l)
FILES_NUM=$(find $FILE_PATH -type f | wc -l)
CONF_NUM=$(find $FILE_PATH -type f -name "*.conf" | wc -l)
TEXT_NUM=$(find $FILE_PATH -type f -name "*.txt" | wc -l)
EXE_NUM=$(find $FILE_PATH -type f -executable | wc -l)
LOG_NUM=$(find $FILE_PATH -type f -name "*.log" | wc -l)
ARCH_NUM=$(find $FILE_PATH -type f | grep -c -e .zip -e .rar -e .sit -e .7z)
SYNBOLIC_NUM=$(find $FILE_PATH -type l | wc -l)

function research {

echo "Total number of folders (including all nested ones) = $FOLDERS_NUM"

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"

find $FILE_PATH -type d -printf "%p %s \n" | sort -r -h -k 2 | numfmt --to=iec --field=2 | nl | awk '{if(NR <= 5 ) print $1, " - ", $2, $3}'

echo "Total number of files = $FILES_NUM"

echo "Number of: "
echo "Configuration files (with the .conf extension) = $CONF_NUM"
echo "Text files = $TEXT_NUM"
echo "Executable files = $EXE_NUM"
echo "Log files (with the extension .log) = $LOG_NUM"  
echo "Archive files = $ARCH_NUM"
echo "Symbolic links = $SYNBOLIC_NUM" 

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
find $FILE_PATH -type f -printf "%p %s \n" | sort -r -n -k 2 | numfmt --to=iec --field=2 | nl | awk -f get_ext.awk 

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
find $FILE_PATH -type f -executable -exec md5sum -z {} \; -printf "  %s \n" | awk '{if(NR <= 10 ) printf"%d %s %s\n",$3, $1, $2}' | numfmt --to=iec --field=1 | sort -r -h -k 1 | awk -f show_hash_exe.awk

}

