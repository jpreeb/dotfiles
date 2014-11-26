# git completion
export PATH=/usr/local/git/bin:$PATH/usr/local/git/contrib/completion/git-completion.bash
source /usr/local/git/contrib/completion/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
  || complete -o default -o nospace -F _git g

# Style bash prompt
PS1='$(pwd) $(__git_ps1 "(%s) ")⚡  '

# terminal colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# terminal history
export HISTCONTROL=erasedups
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
shopt -s histappend

# aliases
alias chrome="open -a /Applications/Google\ Chrome.app"
alias ffxp="/Applications/Firefox.app/Contents/MacOS/firefox-bin -p"
alias g="git"
alias gitx="open -a /Applications/GitX.app/"
alias gpush="git push -f origin --all"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias hosts="sudo vim /etc/hosts"
alias ll="ls -la -G"
alias lol="say -v Hysterical ahahahahahahahahahaha"
alias showFiles="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias sub="open -a Sublime\ Text.app"

# rebase all branches onto master until a conflict occurs
function grebase () {
  git checkout master;
  git branch | grep '^ ' | while read line;
  do git checkout $line && git rebase master;
  git checkout master;
  done;
}

# show all files in a git project
function show() {
  git files | while read line; do open $line; done;
}