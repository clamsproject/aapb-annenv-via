#! /bin/bash 

if [ $# -ne 2 ]; then 
    echo "Specify a project name and a directory with annotation files saved from via." 
    exit 1
fi
proj_name="$(basename $1)"
data_dir="$2"

git clone git@github.com:clamsproject/clams-aapb-annotations.git repo

cd repo
dest_dir=uploads/$proj_name/annotations
mkdir -p $dest_dir
for ann in $data_dir/*.json; do 
    if [ -s $ann ]; then 
        cp $ann $dest_dir/
    fi
done
git add $dest_dir
if [ "$(git status -s)" ]; then 
    git commit -m "uploading annotation files for $proj_name"
    git push 
fi

cd ..
rm -rf repo

