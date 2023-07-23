### prompt customization
echo "welcome"
PS1="\[$(tput setaf 250)\]\u \[$(tput sgr0)on \[$(tput setaf 250)\]\h \[$(tput sgr0)\]on \[$(tput setaf 250)\]\W\[$(tput sgr0)\] \[$(tput setaf 166)\]->\[$(tput sgr0)\]  "
export PS1


### my first functions ever
 hi () { echo "hi there"; }
 
 somme () { expr $1 + $2; }
 
 trait () { echo "###########################################------------------------------------------------------######################################################"; }

export EDITOR=nano

alias psql='/opt/homebrew/bin/psql'

### my aliases : file system
alias dt='cd ~/desktop/'
alias ba='cd ..'
alias t='touch'
alias mk='mkdir'
alias printwd='pwd'
alias list='ls -la'
alias docs='cd Documents'
alias goto='search_and_cd'



### my aliases : git
alias gad='git add -A'
alias gtus='git status'
alias gcom='git commit -m'
alias glog='git log'
alias giff='git diff'
alias gpul='git pull -u origin main'
alias gpu='git push -u origin main'


### my aliases : data science
alias jupjup='jupyter notebook'

alias these='cd desktop && cd opeThese && cd dataCovid && jupyter notebook'
alias algo='cd desktop && cd ressources && cd customNotebooks && jupyter notebook'

### my aliases : network
alias ip='dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com'


### my aliases : utilities
alias quant='cd desktop && cd comte && cd futureOrientedWork && cd occupations && cd quant && ls'
alias ghk='cd desktop && cd comte && cd futureOrientedWork && cd occupations && cd githubKing'



### my aliases : financial markets
alias news='python fintimes_news.py'
alias indic='python indicators.py'
alias indic2='python indicators2.py'
alias indic3='python incicators3.py'


### alias for a decent quote api : try it yourself!
alias sto='curl -X GET https://api.themotivate365.com/stoic-quote'

alias pysiclop_env='source pysiclop_env/bin/activate'


alias go-auto='cd Auto-GPT && source Auto-GPT_env/bin/activate && ./run.sh'


### functions

function supressor() {
    # Ask the user for the directory name
    echo "Enter the directory name: "
    read dir_name

    # Check if the directory exists
    if [ -d "$dir_name" ]
    then
        # Use 'rm' command to recursively force delete the directory and its contents
        rm -rf "$dir_name"
        echo "Directory and its contents have been deleted."

    else
        echo "Directory does not exist."
    fi
}



venvon() {
    VENV_DIR=$(find . -type d -name '*venv' -print -quit)
    if [[ -z "$VENV_DIR" ]]; then
        echo "No 'venv' directory found in the current directory."
    else
        source "${VENV_DIR}/bin/activate"
    fi
}



search_and_cd() {
    read -p "Enter directory name: " dir_name
    
    # Using find command to search for the directory recursively
    result=$(find / -type d -name "$dir_name" 2>/dev/null)
    
    if [ -z "$result" ]; then
        echo "Directory not found."
    else
        # Navigating to the found directory
        cd "$result"
        echo "Navigated to: $(pwd)"
    fi
}


createDirectories() {
    # Ask the user for the name of the parent directory
    echo "Please enter the name of the parent directory:"
    read parent_dir

    # Create the parent directory
    mkdir -p "${parent_dir}"

    # Navigate into the parent directory
    cd "${parent_dir}"

    # Loop for creating subdirectories
    while true
    do
        # Ask the user for the name of the subdirectory
        echo "Please enter the name of a subdirectory or just press enter to finish:"
        read sub_dir

        # Check if the user input is empty (i.e., they just pressed enter)
        if [[ -z "${sub_dir}" ]]; then
            echo "All desired directories have been created."
            break
        fi

        # Create the subdirectory
        mkdir -p "${sub_dir}"
    done
}
