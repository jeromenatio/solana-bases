# SOLANA BASES

Boilerplate files and scripts to install and configure a solana rpc node. \
The script is for a `ubuntu` based linux distribution.\
Order of installation, first as root, `tn-user`, `tn-disk`, `tn-perf` then `reboot`. \
Then connect as solanauser then `tn-solana`, `tn-start`. \ 
The commands `tn-start`, `tn-stop`, `tn-log`, `tn-status`, `tn-catch`, exists to give feedback start, stop and examine the solana daemon. \
Version of solana and yellowston : `v1.17.31` and `v1.14.1+solana.1.17.31`

## INSTALLATION

##### Create install directory
```bash
sudo mkdir /tn-scripts
```

##### Download tn-install.sh
```bash
sudo wget -q https://raw.githubusercontent.com/jeromenatio/solana-bases/main/tn-install.sh -O /tn-scripts/tn-install.sh
```

##### Make it executable
```bash
sudo chmod +x /tn-scripts/tn-install.sh
```

##### Execute and follow instructions
```bash
sudo /tn-scripts/tn-install.sh
```

##### All in a single command
```bash
sudo mkdir /tn-scripts && sudo wget -q https://raw.githubusercontent.com/jeromenatio/solana-bases/main/tn-install.sh -O /tn-scripts/tn-install.sh && sudo chmod +x /tn-scripts/tn-install.sh && sudo /tn-scripts/tn-install.sh
```