# Please choose the package for your distro here (under Assets):
# https://github.com/kasmtech/KasmVNC/releases
wget https://github.com/kasmtech/KasmVNC/releases/download/v1.3.3/kasmvncserver_noble_1.3.3_amd64.deb

sudo apt-get install ./kasmvncserver_*.deb

# Add your user to the ssl-cert group
sudo addgroup $USER ssl-cert

# YOU MUST DISCONNECT AND RECONNECT FOR GROUP MEMBERSHIP CHANGE TO APPLY

# start KasmVNC, you will be prompted to create a KasmVNC user and select a desktop environment
vncserver

# Tail the logs
tail -f ~/.vnc/*.log