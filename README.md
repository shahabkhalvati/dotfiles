1. rename `~/dotfiles` to `~/.dotfiles`
2. add following to '~/.zsh_plugins.sh'

```
export PATH="/Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-ports:$PATH"
export PATH="/Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-zsh-git-fetch-merge:$PATH"
export PATH="/Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-zsh-git-sync:$PATH"
source /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-zsh-mkc/mkc.plugin.zsh
fpath+=( /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-zsh-mkc )
export PATH="/Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-caarlos0-SLASH-zsh-open-pr:$PATH"
source /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-mafredri-SLASH-zsh-async/async.plugin.zsh
fpath+=( /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-mafredri-SLASH-zsh-async )
source /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-rupa-SLASH-z/z.sh
fpath+=( /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-rupa-SLASH-z )
source /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions/zsh-completions.plugin.zsh
fpath+=( /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions )
source /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
fpath+=( /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-autosuggestions )
source /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure/pure.plugin.zsh
fpath+=( /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-sindresorhus-SLASH-pure )
source /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zdharma-SLASH-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fpath+=( /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zdharma-SLASH-fast-syntax-highlighting )
source /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
fpath+=( /Users/shahabkhalvati/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-history-substring-search )

```

3. add following to `~/.zshrc`

```
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
```
