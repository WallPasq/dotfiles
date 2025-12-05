# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- ZSH Minimal Config ---

# Zinit configs
ZINIT_HOME="${XDG_CACHE_HOME:-$HOME/.cache}/.local/share/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone -q https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Environment variables 
export VISUAL=nvim
export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"
export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
export ZVM_VI_HIGHLIGHT_FOREGROUND=#000000
export ZVM_VI_HIGHLIGHT_BACKGROUND=#ff00d7
export ZVM_SYSTEM_CLIPBOARD_ENABLED=true
export ZVM_COPY_COMMAND='pbcopy'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="
  --height 80% --layout=reverse --border --inline-info
  --preview 'if [ -d {} ]; then ls -F --color=always {}; else bat --style=numbers,changes --color=always --line-range :500 {}; fi'
  --preview-window 'right:60%:wrap'
  --bind 'ctrl-f:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {} | pbcopy)+abort'
"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers,changes --color=always --line-range :500 {}'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind 'ctrl-f:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Add in zsh plugins
zinit light Aloxaf/fzf-tab
zinit light jeffreytse/zsh-vi-mode
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-syntax-highlighting

# Native functionalities
autoload -Uz edit-command-line
autoload -Uz compinit && compinit
zle -N edit-command-line

zinit cdreplay -q

# Load keybindings 
function zvm_after_init() {
  zvm_bindkey viins '^[[A' history-substring-search-up
  zvm_bindkey viins '^[[B' history-substring-search-down
  zvm_bindkey vicmd 'k' history-substring-search-up
  zvm_bindkey vicmd 'j' history-substring-search-down
  zvm_bindkey vicmd 'v' edit-command-line
  zvm_bindkey viins '^R' fzf-history-widget
  zvm_bindkey viins '^?' backward-delete-char
}

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias vi='nvim'
alias vim='nvim'
alias ls='ls --color'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(fnm env --use-on-cd)"
eval "$(zoxide init --cmd cd zsh)"

