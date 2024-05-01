# SOLANA BASES

Boilerplate files and scripts to install and configure a solana rpc node. \
The script is for a `ubuntu` based linux distribution \
For each following steps please replace `/path/to/file/install.sh` with the path of the output file on your system.

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
sudo mkdir /tn-scripts \
&& sudo wget -q https://raw.githubusercontent.com/jeromenatio/solana-bases/main/tn-install.sh -O /tn-scripts/tn-install.sh \
&& sudo chmod +x /tn-scripts/tn-install.sh \
&& sudo /tn-scripts/tn-install.sh
```