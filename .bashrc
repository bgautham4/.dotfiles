#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

exec fish
#replace bash with fish using exec while still being able to use bash when needed using bash --norc
#if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} && ${SHLVL} == 1 ]]
#then
#	shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
#	exec fish $LOGIN_OPTION
#fi
