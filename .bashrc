export CLICOLOR=1
export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
export EDITOR='vim'
export VISUAL='vim'
set -o vi
eval "$(fzf --bash)"

# export HTTP_PROXY=http://192.168.139.1:7897
# export HTTPS_PROXY=http://192.168.139.1:7897
# export http_proxy=http://192.168.139.1:7897
# export https_proxy=http://192.168.139.1:7897

shopt -s checkwinsize histappend

alias trans='trans -e bing'
alias memcheck='valgrind --tool=memcheck --leak-check=full --show-reachable=yes'

export PATH="$PATH:/home/sorcerer/.local/bin"
export PAGER='less'
export LESS='-FR'
export COLORTERM=truecolor
