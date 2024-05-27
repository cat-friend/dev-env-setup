# Developer Environment Setup - WIP <!-- omit from toc -->
Instructions and tools for setting up a new developer environment on Windows OS

## Table of Contents <!-- omit from toc -->
- [1. WSL](#1-wsl)
- [2. Git and GitHub](#2-git-and-github)
- [3. Terminal customization](#3-terminal-customization)
- [4. Node.js](#4-nodejs)
- [5. Python](#5-python)
- [6. IDE](#6-ide)
- [7. React-Native development](#7-react-native-development)
  - [7.1. Android](#71-android)
  - [7.2. iOS](#72-ios)
- [8. Setup CLI](#8-setup-cli)


## 1. WSL
1. [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install#manual-installation-steps)
2. [Setup Linux username and password](https://learn.microsoft.com/en-us/windows/wsl/setup/environment#set-up-your-linux-username-and-password)
3. Update dependencies
  ```sh
  sudo apt update && sudo apt upgrade
  ```

## 2. Git and GitHub
1. Install Git
   ```sh
   sudo apt install git-all
   ```
2. [Set up SSH credentials](https://hackmd.io/@AgDXdHgSSPKsJIhCxlaTuA/BJtNu88fF)

### Global `.gitignore`
1. Create a `.gitignore` file and point your git config to the `.gitignore` file
  ```bash
  touch ~/.gitignore && git config --global core.excludesFile '~/.gitignore'
  ```

1. Add to the file directly or using shell commands:
  ```bash
  echo "<<pattern to ignore>>" >> ~/.gitignore
  ```

  Example:
  ```bash
  echo "*__notes.*" >> ~/.gitignore
  ```

## 3. Terminal customization
1. Install oh-my-bash

## 4. Node.js
1. Install [nvm](https://github.com/nvm-sh/nvm)
2. Install node
```sh
nvm install <Node version number>
```
  1. To verify that node was installed, use `node --verison` or `which node`


## 5. Python
1. Install dependencies
    ```sh
    sudo apt update && sudo apt install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    ```
2. Update your `.bashrc`.
   1. When you install Python, the PATH isn't automatically added to your startup files, unlike when you install Node. You can follow the prompts to add the PATH info to your `.bashrc`, or you can use the Setup CLI.

## 6. IDE
1. [Install Visual Studio Code](https://code.visualstudio.com/)

## 7. React-Native development
### 7.1. Android
1. Install Android Studio and the latest Android SDK.
2. In your .bashrc, add these lines and replace `<user>` with your username
    ```bash
    export ANDROID_HOME=/mnt/c/Users/<user>/AppData/Local/Android/Sdk
    export WSLENV=ANDROID_HOME/p

    ```
1. Find your Ubuntu (or other Linux distro) executable path and copy it (Somewhere in C:\Program Files\WindowsApps)
2. In Android Studio, go to Setting > Tools > Terminal > Applications Settings > Shell Path and paste the Ubuntu path here, make sure that the `.exe` suffix is present. Press 'Ok'.
3. Launch your android emulator of choice.
4. Start your app and you'll be able to see it emulated.


### 7.2. iOS
lol

## 8. Setup CLI
The Setup CLI tool automates a few things that are otherwise annoying/tedious/hard to remember how to do because you did it once a long time ago.

See the [Setup CLI README](setup-cli/README.md) for more details.
