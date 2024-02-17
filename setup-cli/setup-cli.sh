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

return_to_main_menu() {
    echo -ne "Return to main menu? ${Y_N}"
    read return

    if [ $return == 'y' -o $return == 'Y' ]
    then
    echo -e "\nReturning to main menu..."
    setup_menu
    fi
}

get_continue() {
    echo -ne "\nContinue? ${Y_N}"
    read continue
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

    # check if omb is installed
    echo -n "Is oh-my-bash installed? ${Y_N}"
    read is_omb_installed

    if [ $is_omb_installed == 'Y' -o $is_omb_installed == 'y' ]
    then
    # migrate file?
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
        fi
    # replace the line with the theme with theme name
    else
        echo "Please install oh-my-bash"
    fi
    return_to_main_menu
}


# global .gitignore setup functions
get_gitignore_filename() {
    echo -ne "\nUse '.gitignore' as global gitignore filename? ${Y_N}"
    read use_default

    if [ $use_default == 'y' -o $use_default == "Y" ]
    then
        gitignore_file=".gitignore"

    else
        echo -ne "\nEnter global gitignore filename. Include any leading '.': "
        read ignore_filename_response
        gitignore_file=$ignore_filename_response
    fi
}

get_directory () {
    echo -ne "\nWhere do you want to store the global gitignore file? "
    read gitignore_directory

    if [ $gitignore_directory == 'root' -o $gitignore_directory == 'Root' -o $gitignore_directory == "~" ]
    then
    gitignore_directory=$HOME
    fi

    if [ $gitignore_directory == '.' ]
    then
    gitignore_directory=$PWD
    fi
}

get_gitignore_path_and_filename() {
    gitignore_path_and_filename=$gitignore_directory/$gitignore_file
}

verify_gitignore_file() {
    echo -e "\nThis is the gitignore file that will be created:"
    echo $gitignore_path_and_filename

    get_continue

    if [ $continue == 'n' -o $continue == 'N' ]
    then
    return_to_main_menu
    gitignore_setup
    fi
}

create_gitignore_file() {
    touch $gitignore_path_and_filename
}

create_gitignore_string() {
    echo -ne "\nEnter the filename suffix for globally ignored files: "
    read suffix

    echo -ne "\nEnter the file extension that you want to be globally gitignored: "
    read extension

    gitignore_string="**/*.${suffix}.${extension}"
}

verify_gitignore_string() {
    echo -e "\nThis is the gitignore string that will be appended to your global gitignore file:"
    echo $gitignore_string

    get_continue

    if [ $continue == 'n' -o $continue == 'N' ]
    then
    return_to_main_menu
    gitignore_setup
    fi
}

write_gitignore_string_to_file() {
    echo  $gitignore_string >> $gitignore_path_and_filename

    git config --global core.excludesFile $gitignore_path_and_filename

    echo -e "\nAppended ${gitignore_string} to the global gitignore file, ${gitignore_path_and_filename}. Verify that your global git configs are set up correctly by executing git config --global -e"
}

gitignore_setup() {
    echo -e "\n${GLOBAL_GITIGNORE} selected"

    get_gitignore_filename

    get_directory

    get_gitignore_path_and_filename

    verify_gitignore_file

    create_gitignore_file

    create_gitignore_string

    verify_gitignore_string

    write_gitignore_string_to_file
}

# append python functions
append_python_setup() {
    # get the file - bashrc? zprofile?
    # verify the file
    # continue
    # verify the string
    # continue
    # append to the file
    echo "hello"
}


setup_menu () {
    echo -e "\nLet's finish setting up your developer environment. Here are your options:"

    PS3="Select your setup choice: "
    options=("${OH_MY_BASH_THEME}" "${GLOBAL_GITIGNORE}" "${PYTHON}" "${EXIT}")
    select choice in "${options[@]}"; do
        case $choice in
            $OH_MY_BASH_THEME)
                # oh_my_bash_setup
                echo -e "\ncoming soon"
                setup_menu
                ;;

            $GLOBAL_GITIGNORE)
                gitignore_setup
                setup_menu
                ;;

            $PYTHON)
                echo -e "\nhissSSSS\n"
                echo "coming soon!"
                setup_menu
                ;;

            $EXIT)
                exit_function
                ;;

            *)
                echo -e "\nInvalid option '${REPLY}'. Please reselect:"
        esac
    done
}

setup_menu
