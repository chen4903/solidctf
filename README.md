# eth-challenge-base

xinetd docker for building ethereum contract challenge in capture the flag (CTF).

## Getting Started

### Quick Demo

```bash
docker run -it -p 20000:20000 -e WEB3_PROVIDER_URI=uri chainflag/eth-challenge-base
nc 127.0.0.1 20000
```

### Build Challenge

Create challenge project based on [example](https://github.com/chainflag/eth-challenge-base/tree/main/example)
* `contracts` is the challenge contract directory, and you should code [isSolved()](https://github.com/chainflag/eth-challenge-base/blob/main/example/contracts/Example.sol#L18) function for the contract to check if it is solved
* `chall.env` is used to set environment variables of docker container, including web3 provider, token secret and token expiration seconds
* `info.yaml` is the config for specifying challenge description, flag, contract name, constructor etc. See more details in this file comments

**Environment variable defaults**

| Name              | Default Value
| ----------------- | ----------------------------------
| TOKEN_SECRET      | random by `secrets.token_hex(32)`      
| TOKEN_EXP_SECONDS | None(non-expiring)
| WEB3_PROVIDER_URI | http://localhost:8545

Start serving your contract challenge
```bash
docker run -d -p 20000:20000 --env-file chall.env -v `pwd`/contracts:/home/ctf/contracts -v `pwd`/info.yaml:/home/ctf/info.yaml chainflag/eth-challenge-base
```

## License

Distributed under the MIT License. See LICENSE for more information.

## Acknowledgements

* https://github.com/eth-brownie/brownie
* https://github.com/hitcxy/blockchain_template
* https://github.com/paradigm-operations/paradigm-ctf-2021
