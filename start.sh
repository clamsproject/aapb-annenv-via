#! /bin/bash 

if [ $# -lt 3 ]; then 
    echo "Specify a project name and a directory with media files" 
    exit 1
fi
conf_dir="$(dirname $0)/configs/$(basename $1)"
data_dir="$2"
media_dir="$3"
if [ ! -d $conf_dif ]; then 
    echo "Cannot find a configuration for the project [ $1 ]."
    exit 1
fi

# # downloaded from https://gitlab.com/vgg/vps/-/blob/master/scripts/create_bucket_folders.sh
# # For VIA project server, create all the required folders
# current=0
# end=255

# for i in $(seq 0 255);
# do
#   x=$(printf "%.2x\n" $i)
#   echo $2"/"$x
#   mkdir $2"/"$x
# done
# ######################

set -x
cp "$conf_dir"/*.json "$data_dir"

docker run \
    -it \
    --rm \
    --name clams-via \
    -p 9669:9669 \
    -p 9779:9779 \
    -v $data_dir:/data/ \
    -v $media_dir:/media/:ro \
    clams-via \
    $4