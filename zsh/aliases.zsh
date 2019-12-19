alias grep="grep --color=auto"
alias less="less -r"

alias ls='ls -lhGF'
alias run-all-apps='sudo spctl --master-disable'
alias run-all-apps-revert='sudo spctl --master-enable'
alias utm="youtube-dl --download-archive ~/Documents/appdata/videoarchive.txt -f 'best[height<=480]'"
alias uth="youtube-dl --download-archive ~/Documents/appdata/videoarchive.txt -f 'best[height<=720]'"
alias ut='youtube-dl --download-archive ~/Documents/appdata/videoarchive.txt'
alias eggt='youtube-dl -o "%(playlist_index)s-%(title)s.%(ext)s"'
alias egglist='youtube-dl -o "%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s" --batch-file '
alias docker_clear='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias gittmpignore='git update-index --assume-unchanged '
alias gitlstmpignores='git ls-files -v | grep '"'"'^[[:lower:]]'"'"''
alias gitunignoretmp='git update-index --no-assume-unchanged '
