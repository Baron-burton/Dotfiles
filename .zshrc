################################################################################
# init
################################################################################

[[ $( brew list | grep zplug ) ]] || return

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

if [ ! -f ~/.zshrc.zwc -o ~/.zshrc -nt ~/.zshrc.zwc ]; then
    zcompile ~/.zshrc
fi

################################################################################
# zplug
################################################################################

zplug 'arzzen/calc.plugin.zsh'
zplug 'supercrabtree/k'
zplug 'zsh-users/zsh-syntax-highlighting', nice:10
zplug 'felixr/docker-zsh-completion'

# prezto modules
zplug 'modules/utility', from:prezto
zplug 'modules/completion', from:prezto
zplug 'modules/history-substring-search', from:prezto
zplug 'modules/history', from:prezto
zplug 'modules/ruby', from:prezto
zplug 'modules/spectrum', from:prezto
# zplug 'modules/autosuggestions', from:prezto

# powerlevel9k prompt
zplug 'bhilburn/powerlevel9k'

zplug 'hlissner/zsh-autopair', nice:10

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf 'Install? [y/N]: '
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

################################################################################
# completion
################################################################################

zstyle ':prezto:module:autosuggestions' color 'yes'

################################################################################
# other
################################################################################

POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time docker_machine)

# contxt user
 DEFAULT_USER=brandonburton

 # directory truncation
 POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
 POWERLEVEL9K_SHORTEN_DELIMITER=''
 POWERLEVEL9K_SHORTEN_STRATEGY='truncate_from_right'


 ############
 # docker
 if command -v docker-machine > /dev/null 2>&1; then
	 if [ $(docker-machine status) = "Running" ]; then
		 eval $(docker-machine env default)
	 else
		 unset DOCKER_CERT_PATH
		 unset DOCKER_HOST
		 unset DOCKER_MACHINE_NAME
		 unset DOCKER_TLS_VERIFY
	 fi
 fi

 alias denv='eval $(docker-machine env default)'
 alias dp='docker ps'
 alias dr='docker-machine restart default'
 alias dup='docker-compose up'
 alias dk='docker-compose kill'
 alias dstop='docker-machine stop default'
 alias dstart='docker-machine start default'
 alias demr='docker exec -it myrewards_myrewards.app_1 /bin/bash'
 alias dere='docker exec -it redstone_redstone.app_1 /bin/bash'
 alias demg='docker exec -it mygames_mygames.app_1 /bin/bash'


 ####################################
 # git
 alias gb='git branch'
 alias gc='git checkout'
 alias gs='git status'
 alias ga='git add'
 alias gp='git push'
 alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
 alias gco='git commit'
 alias gl='git log'

 ###################################
 # ENV Variables
 export EDITOR=vim
