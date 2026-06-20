#!/bin/bash

read -p "Server :" server
read -p "Username :"  user
if [[ -z $server || -z $user ]];then
    echo "Invalid retry"
else
    echo "Success"
    rdp=$(xfreerdp -u:$user -v:$server)
fi