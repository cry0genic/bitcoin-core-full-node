#!/bin/sh

if [ $# -ne 2 ]; then
    echo 'Please enter username and password as the arguments to the script!'
    exit 1
fi

echo "Creating RPC Credentials..."

username=$1
password=$2

argument=""$1" "$2""

rpc_uri=$(python3 ./rpcauth.py $argument)

echo $rpc_uri

sed -i "/^\[regtest]$/a rpcuser=$username\nrpcpassword=$password" ./bitcoin.conf
sed -i "/^\[regtest]$/a $rpc_uri" ./bitcoin.conf