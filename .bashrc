# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# alias
# repos
# sacha repos
alias downloads='cd /mnt/d/DATA/Downloads'
alias client='cd /mnt/d/repos/client/'
alias ortelius='cd /mnt/d/repos/ortelius'
alias kubernetessw='cd /mnt/d/repos/kubernetes'
alias pcloud='cd /mnt/p'
# allianz repos
# allianz
alias 2dfa='adp-2fa cookie --global'
alias azt='cd /mnt/d/repos-allianz/'
alias azttools='cd /mnt/d/repos-allianz/01-tools/'
# gsi
alias gsi='cd /mnt/d/repos-allianz/gsi/'
alias apcp='cd /mnt/d/repos-allianz/gsi/apcp/'
alias stout='cd /mnt/d/repos-allianz/gsi/aristote'
alias bios='cd /mnt/d/repos-allianz/gsi/bios/'
alias elrond='cd /mnt/d/repos-allianz/gsi/elrond/'
alias emagin='cd /mnt/d/repos-allianz/gsi/emagin/'
alias gnp3='cd /mnt/d/repos-allianz/gsi/gnp3/'
alias hexalite='cd /mnt/d/repos-allianz/gsi/hexalite'
alias pt='cd /mnt/d/repos-allianz/gsi/proactive-claims'
# kubevisor
alias argokube='cd /mnt/d/repos-allianz/kubevisor/gsi/argocdapps-kubevisor'
alias cicd='cd /mnt/d/repos-allianz/cicd/'
alias kubernetes='cd /mnt/d/repos-allianz/kubernetes'
alias kube='cd /mnt/d/repos-allianz/kubevisor'
alias kubebench='cd /mnt/d/repos-allianz/kubevisor/gsi/kubevisor-benchmark-aurora-postgres-chart'
alias kubeoc='cd /mnt/d/repos-allianz/kubevisor/gsi/kubevisor-oracle-chart'
alias kubeor='cd /mnt/d/repos-allianz/kubevisor/gsi/kubevisor-oracle-rest-services'
alias kubeorc='cd /mnt/d/repos-allianz/kubevisor/gsi/kubevisor-oracle-rest-services-chart'
alias kubeubu='cd /mnt/d/repos-allianz/kubevisor/gsi/kubevisor-ubuntu-developer'
alias kubeubuc='cd /mnt/d/repos-allianz/kubevisor/gsi/kubevisor-ubuntu-developer-chart'
alias kubewiki='cd /mnt/d/repos-allianz/kubevisor/gsi/kubevisor.wiki'
# tad
alias tad='cd /mnt/d/repos-allianz/tad/'
alias opusapp='cd /mnt/d/repos-allianz/tad/opus/app'
alias opustf='cd /mnt/d/repos-allianz/tad/opus/tf'
alias pcapp='cd /mnt/d/repos-allianz/tad/pc/app'
alias pctf='cd /mnt/d/repos-allianz/tad/pc/tf'
alias tsapp='cd /mnt/d/repos-allianz/tad/ts/app'
alias tstf='cd /mnt/d/repos-allianz/tad/ts/tf'
# platform
alias pf='cd /mnt/d/repos-allianz/platform'
alias pfgsi='cd /mnt/d/repos-allianz/platform/gsi'
alias pftad='cd /mnt/d/repos-allianz/platform/tad'
# xlr release
alias xl='cd /mnt/d/repos-allianz/xl/'
# aws
# awsbe
alias awsbe='source awsbe'
# code build
alias ccp='aws codebuild create-project --cli-input-json'
alias csb='aws codebuild start-build --project-name'
# bastion
alias basinfra='aws-bastion -i i-087943f8ce6109802 -p gsiinfra'
alias basinfrak8s='aws-bastion -i i-087943f8ce6109802 -p gsiinfrak8s'
alias basnonprod='aws-bastion -i i-087943f8ce6109802 -p gsinonprod'
alias basnonprodk8s='aws-bastion -i i-087943f8ce6109802 -p gsinonprodk8s'
# awsume
alias awsume=". awsume"
alias awsumer='awsume -refresh'
alias awsumek='awsume --kill-refresher'
# gsi
#alias acm='awsume acm --auto-refresh'
alias gsi='awsume gsi --auto-refresh'
alias gsiinfra='awsume infra'
alias gsiinfrak8s='awsume gsiinfrak8s'
alias gsinonprod='awsume gsinonprod'
alias gsinonprodk8s='awsume gsinonprodk8s'
# tad
alias tad='awsume tad --auto-refresh'
alias tadshared='awsume tadshared'
alias tadsharedk8s='awsume tadsharedk8s'
# auth
alias azinf='aws-az-admin-infra.sh'
alias azeksinf='aws-az-eks-infra.sh'
alias aznon='aws-az-admin-nonprod.sh'
alias azeksnon='aws-az-eks-nonprod.sh'
alias azcom='aws-az-admin-common.sh'
# apply
alias keubinfra='k apply -f /mnt/d/repos-allianz/kubevisor/kubevisor/ubuntu/ubuntu-developer-infra.yaml'
alias keubnon='k apply -f /mnt/d/repos-allianz/kubevisor/kubevisor/ubuntu/ubuntu-developer-nonprod.yaml'
# dpkg
alias dpkginstall='sudo dpkg -i'
# eks
alias awseks='aws eks --profile gsi update-kubeconfig --name adpk8s-infra-blue --region eu-central-1'
# rds
alias rdsreboot='aws rds reboot-db-instance --db-instance-identifier'
# kubernetes
alias k='kubecolor'
alias kubectl='kubecolor'
# debug
alias kvs='kubectl version –short'
alias kci='kubectl cluster-info'
alias kgcs='kubectl get componentstatus'
alias kapi='kubectl api-resources -o wide -–sort-by name'
alias kge='kubectl get events -A'
alias kgnw='kubectl get nodes -o wide'
alias kgpaw='kubectl get pods -A -o wide'
# how big is the db?
alias kgmeoc='kubectl get --raw /metrics | grep etcd_object_counts'
# how long is it taking the apiserver to interact with it?
alias kgmer='kubectl get --raw /metrics | grep etcd_request'
# tail
alias ktail='k tail'
# apply
alias kaf='k apply -f'
alias kak='k apply -k'
# context
alias kctxinf='kubectx arn:aws:eks:eu-central-1:054819306458:cluster/adpk8s-infra-blue'
alias kctxnon='kubectx arn:aws:eks:eu-central-1:359426635176:cluster/adpk8s-nonprod-blue'
# deployment
alias kgd='k get deployment'
alias kdd='k delete deployment'
alias kdesd='k describe deployment'
# explain
alias kepr='k explain pod --recursive'
# pods
alias kgp='k get pods'
alias kdp='k delete pods'
alias kdesp='k describe pods'
alias kgpw='k get pods -o wide'
alias kgpc='k get pods --no-headers | wc -l'
# namespaces
alias kgns='k get ns'
alias kgnsc='k get ns --no-headers | wc -l'
# port forward
alias kpf='sudo HOME=/home/sacha kubectl/ port-forward -n adp-istio-system svc/istio-ingressgateway 443:443'
# replicasets
alias kdr='k delete replicaset'
# secrets
alias kreg='k create secret docker-registry regcred --docker-server=container-registry.oracle.com --docker-username=sacha.wharton@kubevisor.com --docker-password=YumMYtoOtH^784 --docker-email=sacha.wharton@kubevisor.com'
# services
alias kgs='k get svc'
alias kgsc='k get svc --no-headers | wc -l'
alias kds='k describe svc'
alias kdels='k delete svc'
# logs
alias klg='k logs'
# exec
alias keub='k exec -it ubuntu-developer -c ubuntu-developer  -- bash'
alias kede='k exec -it debian-developer -c debian-developer -- bash'
alias kejen='k exec -it jenkins-builder -c jenkins-builder -- bash'
alias keora='k exec -it oracle-db -c oracle-db -- bash'
# copy
alias kcp='k cp'
alias kcptools='k cp "install-tools.sh" ubuntu-developer:/root/install-tools.sh'
# service accounts
alias kgsa='k get sa'
# kustomize
alias kzcf='kustomize cfg fmt'
alias kzb='kustomize build'
# kpt
alias kptpt='kpt pkg tree'
alias kptfn='kpt fn'
alias kptfnren='kpt fn render'
alias kptli='kpt live init'
alias kptlapp='kpt live apply --reconcile-timeout=15m'
alias kptldest='kpt live destroy'
alias kptcf='kpt cfg fmt'
# krew
alias krewin='k install'
# linux
alias lwd='cd -'
# version & codename
alias version='lsb_release -a'
# grep
# find if there are files containing a particular text
alias gpri='grep -Pri'
# slack
alias slack='slack-term-linux-amd64'
# ssh
alias server01='ssh sacha@server01'
alias server02='ssh sacha@server02'
alias pi01='ssh sacha@pi01'
alias pi02='ssh sacha@pi02'
alias pi03='ssh sacha@pi03'
# git
# status
alias gs='git status'
# push
alias gph='git push'
alias gphf='git push -f'
alias gpsu='git push --set-upstream origin'
# pull
alias gpl='git pull'
alias gplauh='git pull --allow-unrelated-histories'
# add
alias gadd='git add .'
# checkout
alias gcmr='git checkout master'
alias gcmn='git checkout main'
alias gcob='git checkout -b'
alias gco='git checkout'
# log
alias gl1='git log --oneline'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# diff
alias gdf='git diff'
# take out the garbage
alias gtgc='git gc'
# prune
alias gfrp='git fetch --all && git remote prune'
# commit
alias gcom='git commit'
alias gcomm='git commit -m'
alias gcoma='commitsubmodule.sh'
# fetch
alias gfa='git fetch --all'
alias gfu='git fetch upstream'
# branch
alias gb='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
# clone
alias gc='git clone'
alias gcm='git clone --mirror '
alias mc='multi-git-clone.sh *.list'
alias mc2='xargs -n1 git clone < gh-repos.txt'
alias gremaup='git remote add upstream'
alias gphom='git push origin master'
alias gremv='git remote -v'
alias gremsuosshazt='git remote set-url origin git@github.developer.allianz.io:azt-grl/'
alias gremsuosslazt='git remote set-url origin https://github.developer.allianz.io/azt-grl/'
alias gremsuosshtad='git remote set-url origin git@github.developer.allianz.io/tad-azp/'
alias gremsuossltad='git remote set-url origin https://github.developer.allianz.io/tad-azp/'
alias gremsuogit='git remote set-url origin git@github.com:sachajw/'
# remove
alias grestore='git restore .'
alias grm='git rm'
alias grmf='git rm -f '
alias greset='git reset -- '
# git tools
# pre-commit
alias pcinstall='pre-commit install'
alias pcall='pre-commit run --all-files'
# yadm dotfiles manager
alias yadmhome='cd /home/sacha/.local/share/yadm/'
alias yadms='yadm status'
alias yadmadd='yadm add .'
alias yadmcomm='yadm commit -m'
alias yadmcom='yadm commit'
alias yadmph='yadm push'
alias yadmpl='yadm pull'
alias yadmc='yadm git clone'
alias yadmfsck='yadm fsck'
alias yadmpsu='git push --set-upstream origin'
# gitrp
alias gitrs='gitr.sh status'
alias gitrpl='gitr.sh pull'
alias gitrps='gitr.sh push'
alias gitrall='gitr.sh add . && gitr.sh commit -m "initial commit" && gitr.sh push'
alias gitrf='gitr.sh fetch --all'
alias gitra='gitr.sh add . --all'
alias gitrcmr='gitr.sh checkout master'
alias gitrcmn='gitr.sh checkout main'
alias gitrcom='gitr.sh commit -m'
# clustergit
export ALL="git add . && git commit -t && git push"
alias cg='clustergit'
alias cgexec='clustergit --execute'
alias cgall='clustergit --execute "git add ." && "git commit -t" && "git push"'
alias cgcap='clustergit --execute "git cap"'
alias cgnew='clustergit --execute "git new"'
alias cgimp='clustergit --execute "git imp"'
alias cgfix='clustergit --execute "git fix"'
alias cgrlz='clustergit --execute "git rlz"'
alias cgdoc='clustergit --execute "git doc"'
alias cgtst='clustergit --execute "git tst"'
alias cgbrk='clustergit --execute "git brk"'
alias cgmain='clustergit --execute "git checkout main"'
alias cgmaster='clustergit --execute "git checkout master"'
alias cgadd='clustergit --execute "git add ."'
alias cgcom='clustergit --execute "git commit -m"'
alias cgph='clustergit --push'
alias cgpl='clustergit --pull'
alias cgplhist='clustergit --execute "git pull --allow-unrelated-histories"'
alias cgfetch='clustergit --fetch'
alias cgfsck='clustergit && fsck'
# podman
# switch to podman
#alias docker='podman'
# search
alias psapp='podman search {app_name}'
alias psregimagename='podman search registry_name/{image_to_name}'
alias pscurl='podman search curl'
# Limit search for the number of results (default is 25)
alias pslimit='podman search --limit 5 php8'
# Only search for docker.io registry curl image
alias psdocker='podman search docker.io/curl'
# List the available tags in the repository for the specified image
alias pslisttags='podman search --list-tags curlimages/curl'
# Only search for the official nginx image
alias psfilteroofficial='podman search --filter=is-official'
# git quick stats
alias gqs='git-quick-stats'
# -r suggest code reviewers
alias gqsr='git-quick-stats -r'
# -T detailed list of git stats
alias gqsT='git-quick-stats -T'
# -R detailed list of git stats by branch
alias gqsR='git-quick-stats -R'
# -d displays a list of commits per day
alias gqsd='git-quick-stats -d'
# -m displays a list of commits per month
alias gqsm='git-quick-stats -m'
# -w displays a list of commits per weekday
alias gqsw='git-quick-stats -w'
# -o displays a list of commits per hour
alias gqso='git-quick-stats -o'
# -A displays a list of commits per hour by author
alias gqsA='git-quick-stats -A'
# -a displays a list of commits per author
alias gqsa='git-quick-stats -a'
# -S see your current daily stats
alias gqsS='git-quick-stats -S'
# -C see a list of everyone who contributed to the repo
alias gqsC='git-quick-stats -C'
# -b show an ASCII graph of the git repo branch history
alias gqsb='git-quick-stats -b'
# -D show branches by date
alias gqsD='git-quick-stats -D'
# -c see changelogs
alias gqsc='git-quick-stats -c'
# -L see changelogs by author
alias gqsL='git-quick-stats -L'
# -j save git log as a JSON formatted file to a specified area
alias gqsj='git-quick-stats -j'
# -h display this help text in the terminal
alias gqsh='git-quick-stats -h'
# find
alias findfile='find . -type f -name'
# tar
alias untar='tar -xvzf'
alias listtar='tar -tzf'
alias dirtar='tar -xvzf -C'
alias createtar='tar -cvzf'
alias multitar='tar -cvf'
alias extracttar='tar -xvf'
# networking
# speedtest-cli
alias speed='speedtest-cli --server 2406 --simple'
# local IP
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
# public ip
alias ipi='ipconfig getifaddr en0'
# edit hostfile
alias hostfile="sudo nano /etc/hosts"
# sha
# test the checksum
alias sha='shasum -a 256 '
# home
alias sw='cd ~/'
# repos personal
alias repos='cd /mnt/d/repos/'
alias script='cd /mnt/d/repos/scripts'
# ls
# Colorize the ls output
alias ls='ls --color=auto'
# long listing format
alias ll='ls -lrta'
# Show hidden files
alias l.='ls -d .* --color=auto'
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# lsd
alias ls='lsd'
alias tree='lsd --tree'
# package management
alias upug='sudo apt update -y && sudo apt upgrade -y'
alias autoclean='sudo apt autoclean'
alias autoremove='sudo apt autoremove'
# clear screen
alias c='clear'
# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
# Colorize the grep command output for ease of use (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='colordiff'
# handy short cuts
alias sbrc='source ~/.bashrc'
alias brc='sudo vi ~/.bashrc'
alias hs='history'
alias hsg='history grep -i'
alias j='jobs -l'
# create parent directories on demand
alias mkdir='mkdir -pv'
# show open ports
alias ports='netstat -tulanp'
# networking ping
# Stop after sending count ECHO_REQUEST packets
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast
alias fastping='ping -c 100 -s.2'
# firewall ip tables
# shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'
# display all rules
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall='iptlist'
# curl
# get web server headers
alias header='curl -I'
# public IP
alias pub='curl ipinfo.io/ip'
alias digpub='dig myip.opendns.com @resolver1.opendns.com'
# find out if remote server supports gzip / mod_deflate or not
alias headerc='curl -I --compress'
# no safety nets
alias cpover='\cp'
alias mvover='\mv'
alias lnover='\ln'
# safety nets
# do not delete / or prompt if deleting more than 3 files at a time
alias rm='rm -I --preserve-root'
# confirmation
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
# Parenting changing perms on /
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
# become root
alias root='sudo -i'
alias su='sudo -i'
# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
# web server control
# also pass it via sudo so whoever is admin can reload it without calling you
alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'
alias lightyload='sudo /etc/init.d/lighttpd reload'
alias lightytest='sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t'
alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
alias httpdtest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'
# set default interfaces for sys admin related commands
# vnstat is console based network traffic monitor
# dnstop is console tool to analyse DNS traffic
# tcptrack and iftop commmands display infor about tcp/ip
# All of our servers eth1 is connected to the Internets via vlan / router etc
alias dnstop='dnstop -l 5  eth1'
alias vnstat='vnstat -i eth1'
alias iftop='iftop -i eth1'
alias tcpdump='tcpdump -i eth1'
alias ethtool='ethtool eth1'
# work on wlan0 by default
# Only useful for laptop as all servers are without wireless interface
alias iwconfig='iwconfig wlan0'
# system memory, cpu usage and gpu memory info
# pass options to free
alias meminfo='free -m -l -t'
# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
# get server cpu info
alias cpuinfo='lscpu'
# older system use /proc/cpuinfo
alias cpuinfo='less /proc/cpuinfo'
# get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
# resume wget by default
alias wget='wget -c'
# other defaults
alias df='df -H'
alias du='du -ch'
# top is atop, just like vi is vim
alias top='atop'
# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# train
alias sl='sl'
alias sla='sl -a'
alias sll='sl -l'
alias slf='sl -F'
alias sle='sl -e'
# matrix
alias matrix='cmatrix'
# fire
alias fire='aafire'
# fortune
alias fortune='fortune'
# oneko
alias oneko='oneko'
alias onekog='oneko -dog'
# toilet
alias toilet='toilet'
# ? cow say
alias cowsay='cowsay'
# fake identity
alias rig='rig'
# asciiquarium
alias fish='asciiquarium'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# variables
source <(k completion bash)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#. "$HOME/.cargo/env"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# deno is a simple, modern and secure runtime for JavaScript and TypeScript that uses V8 and is built in Rust
 export DENO_INSTALL="/home/sacha/.deno"
 export PATH="$DENO_INSTALL/bin:$PATH"

# git & github
# git credential manager core
export GCM_CREDENTIAL_STORE="cache"
export GCM_TRACE="$HOME/gcm.log"
export GCM_TRACE_SECRETS="0"
export GCM_TRACE="$HOME/gcm.log"
export GCM_TRACE_MSAUTH="0"
export GCM_DEBUG="0"
export GCM_INTERACTIVE="auto"
export GCM_PROVIDER="github"
export GCM_ALLOW_WINDOWSAUTH="0"
export GCM_CREDENTIAL_CACHE_OPTIONS="--timeout 36000"
export GCM_MSAUTH_FLOW="auto"

# gh-cli
export GH_HOST="github.developer.allianz.io"
export GH_ENTERPRISE_TOKEN="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"
export GITHUB_ENTERPRISE_TOKEN="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"
#export=GH_BROWSER="firefox"
#export=BROWSER="firefox"
export=DEBUG="trace"
# gh-search
#export GITHUB_TOKEN=""
#export GITHUB_API_URL="https://github.developer.allianz.io/api/v3"

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# starship
eval "$(starship init bash)"

# add Pulumi to the PATH
export PATH="$PATH:$HOME/.pulumi/bin"

# aws-sso-util
_AWS_SSO_UTIL_COMPLETE_SCRIPT_DIR=~/.local/share/aws-sso-util
_AWS_SSO_UTIL_COMPLETE_SCRIPT=$_AWS_SSO_UTIL_COMPLETE_SCRIPT_DIR/complete.sh
if which aws-sso-util > /dev/null; then
  mkdir -p $_AWS_SSO_UTIL_COMPLETE_SCRIPT_DIR
  ({ _AWS_SSO_UTIL_COMPLETE=source_bash aws-sso-util > $_AWS_SSO_UTIL_COMPLETE_SCRIPT.tmp ;
    mv $_AWS_SSO_UTIL_COMPLETE_SCRIPT.tmp $_AWS_SSO_UTIL_COMPLETE_SCRIPT; } &)
  if [ -f $_AWS_SSO_UTIL_COMPLETE_SCRIPT ]; then
    source $_AWS_SSO_UTIL_COMPLETE_SCRIPT
  fi
fi

# awsume auto complete
_awsume() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(awsume-autocomplete)
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _awsume awsume


[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh


# Created by `pipx` on 2022-03-30 14:05:57
export PATH="$PATH:/home/sacha/.local/bin"
alias awsbe='source awsbe'
