## Run a **Dockerized Bitcoin Core Full Node**
This repository holds the dockerized version of Bitcoin core full node running in the REGTEST mode.

Follow the instructions below to run a local instance of the same.

#### Steps:
1. ```git clone https://github.com/cry0genic/bitcoin-core-full-node.git ``` <br>
Clone the repository
2. ```sudo chmod +x rpc.sh``` <br>
Make rpc.sh executable.
3. ```./rpc.sh <username> <password>``` <br>
Run rpc.sh with username and password as the two arguments to the script.
4. ```docker-compose up --build -d``` <br>
Build docker container and volumes.

### JSON-RPC Interface

```sh
$ docker ps
$ docker exec -it <container_id> bitcoin-cli -regtest -rpcuser=<username> -rpcpassword=<password> createwallet <name>
$ curl --request POST \
  --url http://<RPC_USERNAME>:<RPC_PASSWORD>@localhost:18443/ \
  --header 'content-type: application/json' \
  --data '{"jsonrpc": "2.0","id": "sample-id","method": "getblockchaininfo","params": []}'
```