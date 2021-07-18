1. rename `~/dotfiles` to `~/.dotfiles`
2. add following to '~/.zsh_plugins.sh'

```
export PATH="~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-ports:$PATH"
export PATH="~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-zsh-git-fetch-merge:$PATH"
export PATH="~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-zsh-git-sync:$PATH"
source ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-zsh-mkc/mkc.plugin.zsh
fpath+=( ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-zsh-mkc )
export PATH="~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-zsh-open-pr:$PATH"
source ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-mafredri-SLASH-zsh-async/async.plugin.zsh
fpath+=( ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-mafredri-SLASH-zsh-async )
source ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-rupa-SLASH-z/z.sh
fpath+=( ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-rupa-SLASH-z )
source ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions/zsh-completions.plugin.zsh
fpath+=( ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions )
source ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
fpath+=( ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions )
source ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure/pure.plugin.zsh
fpath+=( ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure )
source ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zdharma-SLASH-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fpath+=( ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zdharma-SLASH-fast-syntax-highlighting )
source ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
fpath+=( ~/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-history-substring-search )

```

3. run `~/.dotfiles/antibody/install.sh`
4. add following to `~/.zshrc`

```
# ANDROID_REL STUFF
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="/usr/local/sbin:$PATH:$HOME/.rvm/bin"
export DOTFILES="$HOME/.dotfiles"

export EDITOR='vim'
export VEDITOR='code'
export PURE_PROMPT_SYMBOL='$'

typeset -U config_files
config_files=($DOTFILES/*/*.zsh)

for file in ${(M)config_files:#*/path.zsh}; do
  source "$file"
done

source ~/.zsh_plugins.sh

for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do
  source "$file"
done

autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}; do
  source "$file"
done

unset config_files updated_at

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
# shellcheck disable=SC1090
[ -f ~/.localrc ] && . ~/.localrc

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

eval "$(starship init zsh)"

```
