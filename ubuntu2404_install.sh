#!/bin/bash

apt update
apt install curl
apt install libplist-utils
curl -o microsoft.list https://packages.microsoft.com/config/ubuntu/24.04/prod.list
mv ./microsoft.list /etc/apt/sources.list.d/microsoft-prod.list
apt install gpg
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-prod.gpg > /dev/null
chmod o+r /usr/share/keyrings/microsoft-prod.gpg
apt install apt-transport-https
apt update
apt install mdatp
curl -o MicrosoftDefenderATPOnboardingLinuxServer.py https://raw.githubusercontent.com/Bensmilin/Linux_Defender/refs/heads/main/MicrosoftDefenderATPOnboardingLinuxServer.py?token=GHSAT0AAAAAADYYUWAEJBGF3SCKH2AXKSFE2OEMZ4A
mdatp health --field org_id
python3 MicrosoftDefenderATPOnboardingLinuxServer.py
mdatp health --field org_id
mdatp health --field healthy
