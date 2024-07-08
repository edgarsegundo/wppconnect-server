


## https://wppconnect.io/docs/projects/wppserver/installation
https://github.com/edgarsegundo/wppconnect

how to instal nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nano ~/.bashrc
source ~/.bashrc

nvm install <versión>
nvm use <versión>
nvm alias default <versión>

https://chatgpt.com/share/aa253fb9-be76-4e9d-a130-b236a1beb4d1


How to Run an Ubuntu Server VM with VirtualBox (and login via SSH)
https://www.youtube.com/watch?v=wqm_DXh0PlQ


https://github.com/wppconnect-team/wppconnect?tab=readme-ov-file

https://wppconnect.io/docs/projects/wppserver/installation


(Error) gconf-service libasound2 libgconf-2-4 libappindicator1

sudo apt-get install -y libxshmfence-dev  (OK)
sudo apt-get install -y libgbm-dev wget unzip fontconfig
sudo apt-get install -y locales 
sudo apt-get install -y  libatk1.0-0 libc6 
sudo apt-get install -y libcairo2 libcups2 libdbus-1-3 libexpat1
sudo apt-get install -y libfontconfig1 libgcc1 
sudo apt-get install -y  libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 
sudo apt-get install -y libpangocairo-1.0-0 
sudo apt-get install -y libstdc++6 libx11-6 libx11-xcb1 libxcb1
sudo apt-get install -y libxcomposite1 libxcursor1 libxdamage1 libxext6
sudo apt-get install -y libxfixes3 libxi6 libxrandr2 
sudo apt-get install -y libxrender1 libxss1 libxtst6
sudo apt-get install -y ca-certificates 
sudo apt-get install -y fonts-liberation 
sudo apt-get install -y libnss3 lsb-release xdg-utils

sudo apt-get install -y libxshmfence-dev libgbm-dev wget unzip fontconfig locales libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc-s1 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libx




## Install Google Chrome

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt-get update

sudo apt-get install libappindicator3-1    old = sudo apt-get install libappindicator1

Talvez precisa rodar isso antes de rodar a proxima linha : sudo apt-get install -f

sudo dpkg -i google-chrome-stable_current_amd64.deb



# Instalar las dependencias
npm install

# Compilar el proyecto
npm run build

# Ejecutar en modo desarrollo (con hot-reload)
npm run dev

# Ejecutar en modo producción
npm start

nvm install 18.17.0
nvm use 18.17.0
nvm alias default 18.17.0

npm install --include=optional sharp
npm install --os=linux --cpu=x64 sharp

npm run dev

ssh edgar@localhost

  
curl -X POST --location "http://localhost:21465/api/mySession/f2f054f7-19e1-4205-814f-c6c4300d90d1/generate-token"

SECRET_KEY: def35ab5-4b2d-4492-ae8a-2a28cfae9996
SECRET_KEY: f2f054f7-19e1-4205-814f-c6c4300d90d1


{
    "status":"success",
    "session":"mySession",
    "token":"$2b$10$cAwQ2RIpRU6fGakUBJXIhOy4Nb5hcFPOrLtNSeAJPdYziMwLw4ZLa",
    "full":"mySession:$2b$10$cAwQ2RIpRU6fGakUBJXIhOy4Nb5hcFPOrLtNSeAJPdYziMwLw4ZLa"
}


#Starting Session
# /api/:session/start-session

curl -X POST --location "http://localhost:21465/api/mySession/start-session" \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer \$2b\$10\$cAwQ2RIpRU6fGakUBJXIhOy4Nb5hcFPOrLtNSeAJPdYziMwLw4ZLa"
    
  
#Get QrCode
# /api/:session/start-session
# when the session is starting if the method is called again it will return the base64 qrCode

curl -X POST --location "http://localhost:21465/api/mySession/start-session" \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer \$2b\$10\$JcHd97xHN6ErBuiLd7Yu4.r6McvOvEZZDQTQwev2MRK_zQObUZZ9C"


#Send Message
# /api/:session/send-message
curl -X POST --location "http://localhost:21465/api/mySession/send-message" \
    -H "Content-Type: application/json; charset=utf-8" \
    -H "Accept: application/json" \
    -H "Authorization: Bearer \$2b\$10\$cAwQ2RIpRU6fGakUBJXIhOy4Nb5hcFPOrLtNSeAJPdYziMwLw4ZLa" \
    -d "{
          \"phone\": \"5519991113176\",
          \"message\": \"*Viaje 5* Trâmite\"
        }"

## Setting wppconnect-server on supervisor

/etc/supervisor/conf.d/wppconnect.conf

```bash
[program:wppconnect]
command=/bin/bash -c 'source /home/edgar/.nvm/nvm.sh && npm start'
environment=HOME="/home/edgar",USER="edgar",PATH="/home/edgar/.nvm/versions/node/v18.17.0/bin:/usr/local/sbin:/usr/local/bi
n:/usr/sbin:/usr/bin:/sbin:/bin"
directory=/home/edgar/Repos/wppconnect-server
user=edgar
autostart=true
autorestart=true
stderr_logfile=/var/log/wppconnect.err.log
stdout_logfile=/var/log/wppconnect.out.log
```

## Instructions

![WPPConnect Banner](./img/wppconnect-banner.jpeg)

[![npm version](https://img.shields.io/npm/v/@wppconnect-team/wppconnect.svg?color=green)](https://www.npmjs.com/package/@wppconnect-team/wppconnect)
[![Downloads](https://img.shields.io/npm/dm/@wppconnect-team/wppconnect.svg)](https://www.npmjs.com/package/@wppconnect-team/wppconnect)
[![Average time to resolve an issue](https://isitmaintained.com/badge/resolution/wppconnect-team/wppconnect.svg)](https://isitmaintained.com/project/wppconnect-team/wppconnect 'Average time to resolve an issue')
[![Percentage of issues still open](https://isitmaintained.com/badge/open/wppconnect-team/wppconnect.svg)](https://isitmaintained.com/project/wppconnect-team/wppconnect 'Percentage of issues still open')
[![Build Status](https://img.shields.io/github/actions/workflow/status/wppconnect-team/wppconnect/build.yml?branch=master)](https://github.com/wppconnect-team/wppconnect/actions)
[![Lint Status](https://img.shields.io/github/actions/workflow/status/wppconnect-team/wppconnect/lint.yml?branch=master&label=lint)](https://github.com/wppconnect-team/wppconnect/actions)
[![release-it](https://img.shields.io/badge/%F0%9F%93%A6%F0%9F%9A%80-release--it-e10079.svg)](https://github.com/release-it/release-it)

> WPPConnect is an open source project developed by the JavaScript community with the aim of exporting functions from WhatsApp Web to the node, which can be used to support the creation of any interaction, such as customer service, media sending, intelligence recognition based on phrases artificial and many other things, use your imagination... 😀🤔💭

<p align="center">
  <a target="_blank" href="https://wppconnect.io/docs/tutorial/basics/installation">Getting Started</a> •
  <a target="_blank" href="https://wppconnect.io/docs/tutorial/basics/basic-functions">Basic Function</a> •
  <a target="_blank" href="https://wppconnect.io/wppconnect">Documentation</a>
</p>

## Our online channels

[![Discord](https://img.shields.io/discord/844351092758413353?color=blueviolet&label=Discord&logo=discord&style=flat)](https://discord.gg/JU5JGGKGNG)
[![Telegram Group](https://img.shields.io/badge/Telegram-Group-32AFED?logo=telegram)](https://t.me/wppconnect)
[![WhatsApp Group](https://img.shields.io/badge/WhatsApp-Group-25D366?logo=whatsapp)](https://chat.whatsapp.com/LJaQu6ZyNvnBPNAVRbX00K)
[![YouTube](https://img.shields.io/youtube/channel/subscribers/UCD7J9LG08PmGQrF5IS7Yv9A?label=YouTube)](https://www.youtube.com/c/wppconnect)

## Functions

|                                                            |     |
| ---------------------------------------------------------- | --- |
| Automatic QR Refresh                                       | ✔   |
| Send **text, image, video, audio and docs**                | ✔   |
| Get **contacts, chats, groups, group members, Block List** | ✔   |
| Send contacts                                              | ✔   |
| Send stickers                                              | ✔   |
| Send stickers GIF                                          | ✔   |
| Multiple Sessions                                          | ✔   |
| Forward Messages                                           | ✔   |
| Receive message                                            | ✔   |
| insert user section                                        | ✔   |
| Send _location_                                            | ✔   |
| **and much more**                                          | ✔   |

See more at <a target="_blank" href="https://wppconnect.io/wppconnect/classes/Whatsapp.html">WhatsApp methods</a>

## Installation

The first thing that you had to do is install the `npm package` :

```bash
npm i --save @wppconnect-team/wppconnect
```

See more at <a target="_blank" href="https://wppconnect.io/docs/tutorial/basics/installation">Getting Started</a>

## Development

Building WPPConnect is really simple, to build the entire project just run

```bash
> npm run build
```

# Update checking

Whatsapp is in constant change. In order to tackle this issue, we suggest always keeping your Wppconnect package up-to-date.

The method/function names won't change, only their core algorithm. This way you won't have to makes changes in your code at every update.
They will remain the same forever but might experience deprecation.

## Maintainers

Maintainers are needed, I cannot keep with all the updates by myself. If you are
interested please open a Pull Request.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=wppconnect-team/wppconnect,wppconnect-team/wa-js&type=Date)](https://star-history.com/#wppconnect-team/wppconnect&wppconnect-team/wa-js&Date)

## License

This file is part of WPPConnect.

WPPConnect is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

WPPConnect is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with WPPConnect. If not, see <https://www.gnu.org/licenses/>.


## Memory issue

ps aux | grep wppconnect-server
free -h