 #!/usr/bin/env bash

 # Execute this file to install the foxdcoin cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%Foxdcoin-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/Foxdcoin-Qt.app/Contents/MacOS/foxdcoind /usr/local/bin/foxdcoind
 sudo ln -s ${LOCATION}/Foxdcoin-Qt.app/Contents/MacOS/foxdcoin-cli /usr/local/bin/foxdcoin-cli
