alias grep="grep --color=auto"
alias less="less -r"

alias ls='ls -lhGF'
alias run-all-apps='sudo spctl --master-disable'
alias run-all-apps-revert='sudo spctl --master-enable'
alias utm="youtube-dl --download-archive ~/Documents/appdata/videoarchive.txt -f 'best[height<=480]'"
alias uth="youtube-dl --download-archive ~/Documents/appdata/videoarchive.txt"
alias ut='youtube-dl --download-archive ~/Documents/appdata/videoarchive.txt'
alias docker_clear='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
