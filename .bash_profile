export PATH=$PATH:$HOME/bin/:/usr/local/git/contrib/completion/git-completion.bash

# git completion
source /usr/local/git/contrib/completion/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
  || complete -o default -o nospace -F _git g

# Style bash prompt
PS1='\W $(__git_ps1 "(%s) ")~ '

# terminal colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# terminal history
export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
shopt -s histappend
# to remove duplicates already created
# tac ~/.bash_history | awk '!x[$0]++' | tac

rvm use 2.3.1

alias dotfiles="cd ~/dotfiles"

# scribd
alias scribd="cd ~/Documents/scribd/git/scribd/scribd"
alias devbox="cd ~/Documents/scribd/git/scribd/devbox && ssh devbox.lo -t 'cd current;source ~/.bash_profile;bash'"
alias components="cd ~/Documents/scribd/git/scribd/components"

# aliases
alias ll="ls -la -G"
alias hosts="sudo vim /etc/hosts"
alias lol="say -v Hysterical ahahahahahahahahahaha"

alias ffxp="/Applications/Firefox.app/Contents/MacOS/firefox-bin -p"

alias showFiles="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

alias rmjsxjs="scribd && find . -name "*.jsxjs" -type f -delete"
alias rmjsxcss="scribd && find . -name "*.jsxcss" -type f -delete"
alias rmjsx="scribd && rmjsxjs;rmjsxcss"

# git related
alias g="git"
alias gitx="open -a /Applications/GitX.app/"
alias gpull="git checkout master && git pull origin master"
alias gprune="git checkout mater && git fetch --prune"

# see a visual git tree in the command line
alias ggraphsimple="git log --graph --decorate --branches=*jon/* --simplify-by-decoration"
alias ggraph="git log --graph --decorate --branches=*jon/*"

# rebase all branches onto master
function grebase () {
  git checkout master;
  git branch |
    grep -v "master" | # skip master
      grep -e "^\s*jon/" | # only my branches
        while read line;
          do git checkout $line && git rebase master; git checkout master;
        done;
}

# force push to origin
function gfpush () {
  git checkout master;
  git branch |
    grep -v "master" | # skip master
      grep -e "^\s*jon/" | # only my branches
        while read line;
          do git push --force-with-lease origin $line;
        done;
}

# open files in sublime when current with master
function gshow () {
  g diff --name-only master | while read line; do subl $line; done;
}

scribd

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
