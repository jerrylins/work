#!/bin/bash 
rm -f file_base.temp
rm -f file_base_b.temp
rm -f cr_temp 
rm -rf a/
rm -rf b/

if [ $# != 1 ] ; then 
  echo  "you should input a git hash parameters"	
  exit
fi 
git show $1 > cr_temp
if [ $? -eq 0 ];
then
	echo "git hash exit continue..."
else
	echo "git hash not exit"
	exit
fi
# get files
# like "a/kernel/arch/arm/mach-rk3026/board-rk3028a-86v.c"
git  diff $1 | grep ^diff | cut -d\  -f3 > file_base.temp

# 1 mkdir fist
# like "a/kernel/arch/arm/mach-rk3026/"
cat file_base.temp | while read line   #filename 为需要读取的文件名
do
	 dirname $line |xargs -i mkdir -p -v {} 
done

# 2 cp files
# do "cp kernel/arch/arm/mach-rk3026/board-rk3028a-86v.c a/kernel/arch/arm/mach-rk3026/board-rk3028a-86v.c"
cat file_base.temp | while read line   #filename 为需要读取的文件名
do
	cp ${line:2}  $line
done

# get old files
# like "b/kernel/arch/arm/mach-rk3026/board-rk3028a-86v.c"
git  diff $1 | grep ^diff | cut -d\  -f4 > file_base_b.temp

# mkdir fist
# like "b/kernel/arch/arm/mach-rk3026/"
cat file_base_b.temp | while read line   #filename 为需要读取的文件名
do
	 dirname $line |xargs -i mkdir -p -v {} 
done

git branch  cr_sh_bak
git checkout -b cr_sh
if [ $? -eq 0 ];
then
	git reset --hard $1

	# 2 cp files
	# do "cp kernel/arch/arm/mach-rk3026/board-rk3028a-86v.c b/kernel/arch/arm/mach-rk3026/board-rk3028a-86v.c"
	cat file_base_b.temp | while read line   #filename 为需要读取的文件名
	do
		cp ${line:2}  $line
	done
	echo "cr scuccess"

else
	echo "cr_sh: branch checkout fail!"
fi
exit


