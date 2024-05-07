#!/bin/bash
PATH="/home/solanauser/.local/share/solana/install/active_release/bin:/home/solanauser/.cargo/bin:$PATH"
exec solana-validator \
--identity /home/solanauser/.config/solana/id.json \
--dynamic-port-range 8000-10000 \
--no-voting \
--ledger /home/solanauser/ledger \
--accounts /home/solanauser/accounts \
--log /home/solanauser/logs/solana-validator.log \
--log-messages-bytes-limit 10485760 \
--limit-ledger-size 50000000 \
--private-rpc \
--rpc-port 8899 \
--rpc-threads 10 \
--enable-rpc-transaction-history \
--account-index program-id \
--geyser-plugin-config /home/solanauser/plugins/yellowstone-grpc/yellowstone-grpc-geyser/config.json \
--use-snapshot-archives-at-startup always \
--entrypoint entrypoint.mainnet-beta.solana.com:8001 \
--entrypoint entrypoint2.mainnet-beta.solana.com:8001 \
--entrypoint entrypoint3.mainnet-beta.solana.com:8001 \
--entrypoint entrypoint4.mainnet-beta.solana.com:8001 \
--entrypoint entrypoint5.mainnet-beta.solana.com:8001 \
--maximum-snapshot-download-abort 5 \
--minimal-snapshot-download-speed 10000000
#--only-known-rpc \
#--known-validator 7knvB4bbqHCKuNp3ef2hJWdwqoH6WAUi55NQt6LdRfkx \
#--known-validator 2hUq3Ma9FCLm9jtkHbd5V4QdeYLvwEGubHZ1JwfSe49J \
#--known-validator 5NMUFJ3gJxGw7tqJToRUghX8VAp75KKN2QdECZXbQoT7 \
#--known-validator GcJxg78aTQGeErjv2b4kcd1NVRYuB31rfhuJ2zXgrPac \
#--known-validator 2nhGaJvR17TeytzJVajPfABHQcAwinKoCG8F69gRdQot \
#--known-validator 9Hzxq2BnACf7AJbLUBpuyRgtZtuJwFvNYAeah1x6iYcS

#--use-snapshot-archives-at-startup always => #always, never when-newest
#--account-index program-id => program-id spl-token-owner spl-token-mint
#--full-snapshot-interval-slots 25000 \
#--incremental-snapshot-interval-slots 0 \
#--maximum-snapshot-download-abort 5 \
#--minimal-snapshot-download-speed 10000000 \