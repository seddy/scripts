if [ $# -lt 2 -o $# -gt 3 ]
then
	echo "Usage: branch source_tag new_branch [source_branch]"
	exit 1
fi

changes=`cvs upd -Pd | grep ^[MAC] | cat`
num_changes=0
for c in $changes
do
	num_changes=`expr $num_changes + 1`
done

if [ $num_changes -gt 0 ]
then
	echo "Changes have been made but not committed - exitting..."
	exit 1
fi

branches=`cvs stat 2> /dev/null | grep 'Sticky Tag' | awk  '{print $3}' | sort | uniq`
num_branches=0
for b in $branches
do
	num_branches=`expr $num_branches + 1`
done

if [ $branches = $2 ]
then
	echo "Already on branch $2 - exitting..."
	exit 1
fi

if [ $# -eq 3 ]
then
	echo "Moving from $branches to branch $3"
	cvs upd -Pd -r $3 2> /dev/null | grep ^[MACUP?]
	branches=$3
else
	if [ $num_branches -ne 1 ]
	then
		echo "ERROR: $num_branches branches are within the subdirectories of this location:"
		for branch in $branches; do
			echo "  $branch"
		done
		exit 1
	fi

	read -p  "Currently on branch $branches, continue (y/n)? " conf

	if [ $conf != "y" -a $conf != "Y" ]
	then
		exit 1
	fi
fi

echo "Tagging $branches with $1"
cvs tag $1 1> /dev/null

echo "Branching $2 from $1"
cvs tag -r $1 -b $2 1> /dev/null

echo "Moving to $2"
cvs upd -Pd -r $2 | grep ^[MACUP?] | sort | cat

echo "Complete!"
