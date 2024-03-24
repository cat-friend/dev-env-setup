# Developer Environment Setup - WIP <!-- omit from toc -->
Instructions and tools for setting up a new developer environment on Windows OS

## Table of Contents <!-- omit from toc -->
- [WSL](#wsl)
- [Node.js](#nodejs)
- [Git and GitHub](#git-and-github)
- [Python](#python)
- [IDE](#ide)
- [Terminal customization](#terminal-customization)
- [Setup CLI](#setup-cli)


## WSL
1. [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install#manual-installation-steps)
2. [Setup Linux username and password](https://learn.microsoft.com/en-us/windows/wsl/setup/environment#set-up-your-linux-username-and-password)
3. Update dependencies
  ```sh
  sudo apt update && sudo apt upgrade
  ```

## Node.js
1. Install [nvm](https://github.com/nvm-sh/nvm)
2. Install node
```sh
nvm install <Node version number>
```
  1. To verify that node was installed, use `node --verison` or `which node`

## Git and GitHub
1. Install Git
   ```sh
   sudo apt install git-all
   ```
2. [Set up SSH credentials](https://hackmd.io/@AgDXdHgSSPKsJIhCxlaTuA/BJtNu88fF)

## Python
1. Install dependencies
    ```sh
    sudo apt update && sudo apt install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    ```
2. Update your `.bashrc`.
   1. When you install Python, the PATH isn't automatically added to your startup files, unlike when you install Node. You can follow the prompts to add the PATH info to your `.bashrc`, or you can use the Setup CLI.

## IDE
1. [Install Visual Studio Code](https://code.visualstudio.com/)

## Terminal customization
1. Install oh-my-bash

## Setup CLI
The Setup CLI tool automates a few things that are otherwise annoying/tedious/hard to remember how to do because you did it once a long time ago.

See the [Setup CLI README](setup-cli/README.md) for more details.
