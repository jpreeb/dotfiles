export PATH=$PATH:$HOME/bin/:/usr/local/git/contrib/completion/git-completion.bash

# git completion
source /usr/local/git/contrib/completion/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
  || complete -o default -o nospace -F _git g

export GEM_HOME="$HOME/.gem"

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

alias dotfiles="cd ~/dotfiles"

# scribd
alias api-gateway="cd ~/Documents/scribd/git/scribd/api-gateway"
alias mfe-authors="cd ~/Documents/scribd/git/scribd/mfe-authors"
alias mfe-landing-pages="cd ~/Documents/scribd/git/scribd/mfe-landing-pages"
alias nova-ui-components="cd ~/Documents/scribd/git/scribd/nova-ui-components"
alias npm-packages="cd ~/Documents/scribd/git/scribd/npm-packages"
alias scribd="cd ~/Documents/scribd/git/scribd/scribd"

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
alias gpull="git checkout main && git pull && git fetch --prune"
alias gprune="git checkout main && git fetch --prune"

# see a visual git tree in the command line
alias ggraphsimple="git log --graph --decorate --branches=*jon/* --simplify-by-decoration"
alias ggraph="git log --graph --decorate --branches=*jon/*"
alias graph="git log --graph --oneline --branches"

# devkube init in dev mode
alias dev="ASSETS_MODE=build_dev devkube init"

# devkube frontend bash
alias devfbash="devkube exec frontend bash"
alias devrbash="devkube exec rails bash"

# unlink all linked modules
alias yarnunlink="rm -rf ~/.config/yarn/link/*"

# rebase all branches onto main
function grebase () {
  git checkout main;
  git branch |
    grep -v "main" | # skip main
      grep -e "^\s*jon/" | # only my branches
        while read line;
          do git checkout $line && git rebase main; git checkout main;
        done;
}

# force push to origin
function gfpush () {
  git checkout main;
  git branch |
    grep -v "main" | # skip main
      grep -e "^\s*jon/" | # only my branches
        while read line;
          do git push --force-with-lease origin $line;
        done;
}

# open files in edtior when current with main
function gshow () {
  g diff --name-only main | while read line; do code $line; done;
}

scribd

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
