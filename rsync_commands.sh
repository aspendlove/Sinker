#!/bin/bash
rsyncDELETE()
{
#this is the command that will run if delete is set to on ($1 will be replaced with the source and $2 will be replaced with the destination)
sudo rsync -ah --delete --progress --info=progress2 "$1" "$2"
}
rsyncNODELETE()
{
#this is the command that will run if delete is set to off ($1 will be replaced with the source and $2 will be replaced with the destination)
sudo rsync -ah --progress --info=progress2 "$1" "$2"
}
