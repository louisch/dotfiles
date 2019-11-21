#
# Functions
#

# The name of the current branch
# Back-compatibility wrapper for when this function was defined here in
# the plugin, before being pulled in to core lib/git.zsh as git_current_branch()
# to fix the core -> git plugin dependency.
function current_branch() {
  git_current_branch
}

# Pretty log messages
function _cfggit_log_prettily(){
  if ! [ -z $1 ]; then
    config log --pretty=$1
  fi
}

# Warn if the current branch is a WIP
function work_in_progress() {
  if $(config log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}

#
# Aliases
# (sorted alphabetically)
#

alias c='config'

alias ca='config add'
alias caa='config add --all'
alias capa='config add --patch'
alias cau='config add --update'
alias cav='config add --verbose'
alias cap='config apply'

alias cb='config branch'
alias cba='config branch -a'
alias cbd='config branch -d'
alias cbda='config branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 config branch -d'
alias cbD='config branch -D'
alias cbl='config blame -b -w'
alias cbnm='config branch --no-merged'
alias cbr='config branch --remote'
alias cbs='config bisect'
alias cbsb='config bisect bad'
alias cbsg='config bisect good'
alias cbsr='config bisect reset'
alias cbss='config bisect start'

alias cc='config commit -v'
alias cc!='config commit -v --amend'
alias ccn!='config commit -v --no-edit --amend'
alias cca='config commit -v -a'
alias cca!='config commit -v -a --amend'
alias ccan!='config commit -v -a --no-edit --amend'
alias ccans!='config commit -v -a -s --no-edit --amend'
alias ccam='config commit -a -m'
alias ccsm='config commit -s -m'
alias ccb='config checkout -b'
alias ccf='config config --list'
alias ccl='config clone --recurse-submodules'
alias cclean='config clean -id'
alias cpristine='config reset --hard && config clean -dfx'
alias ccm='config checkout master'
alias ccd='config checkout develop'
alias ccmsg='config commit -m'
alias cco='config checkout'
alias ccount='config shortlog -sn'
alias ccp='config cherry-pick'
alias ccpa='config cherry-pick --abort'
alias ccpc='config cherry-pick --continue'
alias ccs='config commit -S'

alias cdd='config diff'
alias cdca='config diff --cached'
alias cdcw='config diff --cached --word-diff'
alias cdct='config describe --tags $(config rev-list --tags --max-count=1)'
alias cds='config diff --staged'
alias cdt='config diff-tree --no-commit-id --name-only -r'
alias cdw='config diff --word-diff'

function cdv() { config diff -w "$@" | view - }

alias cf='config fetch'
alias cfa='config fetch --all --prune'
alias cfo='config fetch origin'

alias cfg='config ls-files | grep'

alias cg='config gui citool'
alias cga='config gui citool --amend'

function cgf() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  config push --force origin "${b:=$1}"
}

function cgfl() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  config push --force-with-lease origin "${b:=$1}"
}

function cgl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    config pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    config pull origin "${b:=$1}"
  fi
}

function cgp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    config push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    config push origin "${b:=$1}"
  fi
}

function cgpnp() {
  if [[ "$#" == 0 ]]; then
    cgl && cgp
  else
    cgl "${*}" && cgp "${*}"
  fi
}

function cgu() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  config pull --rebase origin "${b:=$1}"
}

alias cgpur='cgu'
alias cgpull='config pull origin "$(git_current_branch)"'
alias cgpush='config push origin "$(git_current_branch)"'

alias cgsup='config branch --set-upstream-to=origin/$(git_current_branch)'
alias cpsup='config push --set-upstream origin $(git_current_branch)'

alias chh='config help'

alias cignore='config update-index --assume-unchanged'
alias cignored='config ls-files -v | grep "^[[:lower:]]"'
alias cit-svn-dcommit-push='config svn dcommit && config push github master:svntrunk'

alias ck='\gitk --all --branches'
alias cke='\gitk --all $(config log -g --pretty=%h)'

alias cl='config pull'
alias clg='config log --stat'
alias clgp='config log --stat -p'
alias clgg='config log --graph'
alias clgga='config log --graph --decorate --all'
alias clgm='config log --graph --max-count=10'
alias clo='config log --oneline --decorate'
alias clol="config log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias clols="config log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias clod="config log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias clods="config log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias clola="config log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias clog='config log --oneline --decorate --graph'
alias cloga='config log --oneline --decorate --graph --all'
alias clp="_cfggit_log_prettily"

alias cm='config merge'
alias cmom='config merge origin/master'
alias cmt='config mergetool --no-prompt'
alias cmtvim='config mergetool --no-prompt --tool=vimdiff'
alias cmum='config merge upstream/master'
alias cma='config merge --abort'

alias cp='config push'
alias cpd='config push --dry-run'
alias cpf='config push --force-with-lease'
alias cpf!='config push --force'
alias cpoat='config push origin --all && config push origin --tags'
alias cpu='config push upstream'
alias cpv='config push -v'

alias cr='config remote'
alias cra='config remote add'
alias crb='config rebase'
alias crba='config rebase --abort'
alias crbc='config rebase --continue'
alias crbd='config rebase develop'
alias crbi='config rebase -i'
alias crbm='config rebase master'
alias crbs='config rebase --skip'
alias crev='config revert'
alias crh='config reset'
alias crhh='config reset --hard'
alias croh='config reset origin/$(git_current_branch) --hard'
alias crm='config rm'
alias crmc='config rm --cached'
alias crmv='config remote rename'
alias crrm='config remote remove'
alias crs='config restore'
alias crset='config remote set-url'
alias crss='config restore --source'
alias grt='cd "$(config rev-parse --show-toplevel || echo .)"'
alias cru='config reset --'
alias crup='config remote update'
alias crv='config remote -v'

alias csb='config status -sb'
alias csd='config svn dcommit'
alias csh='config show'
alias csi='config submodule init'
alias csps='config show --pretty=short --show-signature'
alias csr='config svn rebase'
alias css='config status -s'
alias cst='config status'

# use the default stash push on git 2.13 and newer
autoload -Uz is-at-least
is-at-least 2.13 "$(config --version 2>/dev/null | awk '{print $3}')" \
  && alias csta='config stash push' \
  || alias csta='config stash save'

alias cstaa='config stash apply'
alias cstc='config stash clear'
alias cstd='config stash drop'
alias cstl='config stash list'
alias cstp='config stash pop'
alias csts='config stash show --text'
alias cstall='config stash --all'
alias csu='config submodule update'
alias csw='config switch'
alias cswc='config switch -c'

alias cts='config tag -s'
alias ctv='config tag | sort -V'
alias gtl='gtl(){ config tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'

alias cunignore='config update-index --no-assume-unchanged'
alias cunwip='config log -n 1 | grep -q -c "\-\-wip\-\-" && config reset HEAD~1'
alias cup='config pull --rebase'
alias cupv='config pull --rebase -v'
alias cupa='config pull --rebase --autostash'
alias cupav='config pull --rebase --autostash -v'
alias clum='config pull upstream master'

alias cwch='config whatchanged -p --abbrev-commit --pretty=medium'
alias cwip='config add -A; config rm $(config ls-files --deleted) 2> /dev/null; config commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
