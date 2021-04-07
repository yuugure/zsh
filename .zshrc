# homebrew
export PATH=/opt/homebrew/bin:$PATH

# Customize to your needs...
# シェル操作をvim互換にする
bindkey -v

# ディレクトリ名をtabを押して補完するときに選択してるやつに色つける
autoload -U compinit
compinit

# ディレクトリ選択時、最後の/を残す。好み。
setopt noautoremoveslash

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧でファイルの種別を識別マーク表示(ls -F の記号)
setopt list_types

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# lsコマンドの補完候補にも色付き表示
zstyle ':completion:*:default' list-colors ${LS_COLORS}
# kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

# ヒストリー機能
# command r でコマンド履歴を辿るのでいっぱいにしとく
HISTFILE=~/.zsh_history      # ヒストリファイルを指定
HISTSIZE=10000               # ヒストリに保存するコマンド数
SAVEHIST=10000               # ヒストリファイルに保存するコマンド数
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを共有する
setopt append_history        # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
zstyle ':completion:*:default' menu select

# command Rでヒストリ検索
bindkey ^R history-incremental-search-backward

local prompt_location="%F{cyan}%B%~%b%f"
local promot_mark="%B%(?,%F{cyan},%F{green})%(!,#,❯)%b"

# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst

# vcsの表示
zstyle ':vcs_info:*' formats '%s][* %F{green}%b%f'
zstyle ':vcs_info:*' actionformats '%s][* %F{green}%b%f(%F{cyan}%a%f)'

# プロンプト表示直前にvcs_info呼び出し
precmd() {
    vcs_info
}

# vcs_info_msg_0_の書式設定
# zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' check-for-changes false
zstyle ':vcs_info:git:*' stagedstr         "%F{yellow}!%f"
zstyle ':vcs_info:git:*' unstagedstr       "%F{red}+%f"
zstyle ':vcs_info:*'     formats           " (%F{green}%b%f%c%u)"
zstyle ':vcs_info:*'     actionformats     ' (%b|%a)'

# プロンプト
PROMPT="${prompt_location}"'$vcs_info_msg_0_'"
${promot_mark} "
