#!/bin/bash

# messages
Y_N="[y/n] "
FILE_NOT_FOUND="\nFile does not exist. Try again? ${Y_N}"
EXIT_MESSAGE="\nExiting. Goodbye!"

# options
OH_MY_BASH_THEME="oh-my-bash theme setup"
GLOBAL_GITIGNORE="Global .gitignore setup"
PYTHON="Append Python path to startup files"
EXIT="Exit"

# helper functions
exit_function() {
    echo -e "\n${EXIT} selected"
    echo -e $EXIT_MESSAGE
    exit
}

# oh-my-bash setup functions

get_theme_file_name() {
    echo -n "Theme name: "
    read theme_name
    theme_file="${theme_name}.theme.sh"
}

migrate_file() {
    mkdir ~/.oh-my-bash/themes/$theme_name
    cp ./$theme_file ~/.oh-my-bash/themes/$theme_name
}

retry_migrate() {
    echo -e "${FILE_NOT_FOUND}"
    read response
    if [ $response == 'y' -o $response == 'Y' ]
    then
        migrate_file
    else
        setup_menu
    fi
}

oh_my_bash_setup() {
    echo -e "\n${OH_MY_BASH_THEME} selected"

    echo -n "Is oh-my-bash installed? ${Y_N}"
    read is_omb_installed

    if [ $is_omb_installed == 'Y' -o $is_omb_installed == 'y' ]
    then
        echo -n "Migrate theme file to oh-my-bash directory? ${Y_N}"
        read migrate

        if [ $migrate == 'y' -o $migrate == 'Y' ]
        then
            get_theme_file_name
            if [ -e "${theme_file}" ]
            then
                migrate_file
            else
                retry_migrate
            fi
        else
            setup_menu
        fi
    else
        echo "Please install oh-my-bash"
        exit_function
    fi
}


# global .gitignore setup functions
get_gitignore_filename() {
    echo -ne "\Use '.gitignore' as global gitignore filename? ${Y_N}"
    read use_default

    if [ $use_default == 'y' -o $use_default == "Y" ]
    then
        gitignore_file=".gitignore"

    else
        echo -ne "\nEnter global gitignore filename. Include any leading '.'.: "
        read ignore_filename_response
        gitignore_file=ignore_filename_response
    fi
}

get_directory () {
    echo -ne "\nWhere do you want to store the global gitignore file? "
    read gitignore_directory
}

create_gitignore_string() {
    echo -ne "\nEnter the filename suffix for globally ignored files: "
    read suffix

    echo -ne "\nEnter the file extension that you want to be globally gitignored: "
    read extension

    gitignore_string="**/*.${suffix}.${extension}"
}

create_gitignore_file() {
    gitignore_path_and_filename=$gitignore_directory/$gitignore_file
    touch $gitignore_path_and_filename
}

write_gitignore_string_to_file() {
    echo -e "\nAdding this ignore string to the global gitignore file: ${gitignore_string}"

    echo  $gitignore_string >> $gitignore_path_and_filename

    git config --global core.excludesFile "${gitignore_path_and_filename}"
}

gitignore_setup() {
    echo -e "\n${GLOBAL_GITIGNORE} selected"

    get_gitignore_filename

    create_gitignore_file

    create_gitignore_string

    write_gitignore_string_to_file
}

# append python functions


setup_menu () {
    PS3="Select your setup choice: "
    options=("${OH_MY_BASH_THEME}" "${GLOBAL_GITIGNORE}" "${PYTHON}" "${EXIT}")
    select choice in "${options[@]}"; do
        case $choice in
            $OH_MY_BASH_THEME)
                oh_my_bash_setup
                exit
                ;;

            $GLOBAL_GITIGNORE)
                gitignore_setup
                exit
                ;;

            $PYTHON)
                echo -e "\nhissSSSS\n"
                exit
                ;;

            $EXIT)
                exit_function
                ;;
                
            *)
                echo -e "\nInvalid option '${REPLY}'. Please reselect:"
        esac
    done
}

echo -e "\nHELLO. Let's finish setting up your developer environment. Here are your options:"
setup_menu
