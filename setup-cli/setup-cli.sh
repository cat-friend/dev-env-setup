#!/bin/bash

# options
OH_MY_BASH_THEME="oh-my-bash theme"
GLOBAL_GITIGNORE="Global .gitignore"
EXIT="Exit"

# select oh-my-bash, global gitignore both
PS3="Select your setup choice: "
options=("${OH_MY_BASH_THEME}" "${GLOBAL_GITIGNORE}" "${EXIT}")
select choice in "${options[@]}"; do
    case $choice in
        $OH_MY_BASH_THEME)
            echo "${OH_MY_BASH_THEME}"
            exit
            ;;
        $GLOBAL_GITIGNORE)
            echo "${GLOBAL_GITIGNORE} selected"
            touch ~/.gitignore
            echo -n "Enter the filename suffix for globally ignored files:"
            read suffix
            suffix_to_add="**/*.${suffix}.*"
            echo "Adding suffix '${suffix}' to the global gitignore file: ${suffix_to_add}"
            echo  $suffix_to_add >> ~/.gitignore
            git config --global core.excludesFile '~/.gitignore'
            exit
            ;;
        $EXIT)
            echo "exiting. goodbye!"
            exit
            ;;
        *)
            echo "invalid option $REPLY"
    esac
done
