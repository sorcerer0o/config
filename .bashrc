export CLICOLOR=1
export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
export EDITOR='vim'
export VISUAL='vim'
set -o vi

shopt -s checkwinsize histappend

alias trans='trans -e bing'
alias memcheck='valgrind --tool=memcheck --leak-check=full --show-reachable=yes'

export PATH="$PATH:/home/sorcerer/.local/bin"
export PAGER='less'
export LESS='-FR'
export COLORTERM=truecolor
