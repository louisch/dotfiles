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
    dotcfg log --pretty=$1
  fi
}

# Warn if the current branch is a WIP
function cfg_work_in_progress() {
  if $(dotcfg log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}

#
# Aliases
# (sorted alphabetically)
#

alias cfg='dotcfg'

alias cfga='dotcfg add'
alias cfgaa='dotcfg add --all'
alias cfgapa='dotcfg add --patch'
alias cfgau='dotcfg add --update'
alias cfgav='dotcfg add --verbose'
alias cfgap='dotcfg apply'

alias cfgb='dotcfg branch'
alias cfgba='dotcfg branch -a'
alias cfgbd='dotcfg branch -d'
alias cfgbda='dotcfg branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 dotcfg branch -d'
alias cfgbD='dotcfg branch -D'
alias cfgbl='dotcfg blame -b -w'
alias cfgbnm='dotcfg branch --no-merged'
alias cfgbr='dotcfg branch --remote'
alias cfgbs='dotcfg bisect'
alias cfgbsb='dotcfg bisect bad'
alias cfgbsg='dotcfg bisect good'
alias cfgbsr='dotcfg bisect reset'
alias cfgbss='dotcfg bisect start'

alias cfgc='dotcfg commit -v'
alias cfgc!='dotcfg commit -v --amend'
alias cfgcn!='dotcfg commit -v --no-edit --amend'
alias cfgca='dotcfg commit -v -a'
alias cfgca!='dotcfg commit -v -a --amend'
alias cfgcan!='dotcfg commit -v -a --no-edit --amend'
alias cfgcans!='dotcfg commit -v -a -s --no-edit --amend'
alias cfgcam='dotcfg commit -a -m'
alias cfgcsm='dotcfg commit -s -m'
alias cfgcb='dotcfg checkout -b'
alias cfgcf='dotcfg dotcfg --list'
alias cfgcl='dotcfg clone --recurse-submodules'
alias cfgclean='dotcfg clean -id'
alias cfgpristine='dotcfg reset --hard && dotcfg clean -dfx'
alias cfgcm='dotcfg checkout master'
alias cfgcd='dotcfg checkout develop'
alias cfgcmsg='dotcfg commit -m'
alias cfgco='dotcfg checkout'
alias cfgcount='dotcfg shortlog -sn'
alias cfgcp='dotcfg cherry-pick'
alias cfgcpa='dotcfg cherry-pick --abort'
alias cfgcpc='dotcfg cherry-pick --continue'
alias cfgcs='dotcfg commit -S'

alias cfgdd='dotcfg diff'
alias cfgdca='dotcfg diff --cached'
alias cfgdcw='dotcfg diff --cached --word-diff'
alias cfgdct='dotcfg describe --tags $(dotcfg rev-list --tags --max-count=1)'
alias cfgds='dotcfg diff --staged'
alias cfgdt='dotcfg diff-tree --no-commit-id --name-only -r'
alias cfgdw='dotcfg diff --word-diff'

function cfgdv() { dotcfg diff -w "$@" | view - }

alias cfgf='dotcfg fetch'
alias cfgfa='dotcfg fetch --all --prune'
alias cfgfo='dotcfg fetch origin'

alias cfgfg='dotcfg ls-files | grep'

alias cfgg='dotcfg gui citool'
alias cfgga='dotcfg gui citool --amend'

function cfggf() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  dotcfg push --force origin "${b:=$1}"
}

function cfggfl() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  dotcfg push --force-with-lease origin "${b:=$1}"
}

function cfggl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    dotcfg pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    dotcfg pull origin "${b:=$1}"
  fi
}

function cfggp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    dotcfg push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    dotcfg push origin "${b:=$1}"
  fi
}

function cfggpnp() {
  if [[ "$#" == 0 ]]; then
    cfggl && cfggp
  else
    cfggl "${*}" && cfggp "${*}"
  fi
}

function cfggu() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  dotcfg pull --rebase origin "${b:=$1}"
}

alias cfggpur='cfggu'
alias cfggpull='dotcfg pull origin "$(git_current_branch)"'
alias cfggpush='dotcfg push origin "$(git_current_branch)"'

alias cfggsup='dotcfg branch --set-upstream-to=origin/$(git_current_branch)'
alias cfgpsup='dotcfg push --set-upstream origin $(git_current_branch)'

alias cfghh='dotcfg help'

alias cfgignore='dotcfg update-index --assume-unchanged'
alias cfgignored='dotcfg ls-files -v | grep "^[[:lower:]]"'
alias cfgit-svn-dcommit-push='dotcfg svn dcommit && dotcfg push github master:svntrunk'

alias cfgk='\gitk --all --branches'
alias cfgke='\gitk --all $(dotcfg log -g --pretty=%h)'

alias cfgl='dotcfg pull'
alias cfglg='dotcfg log --stat'
alias cfglgp='dotcfg log --stat -p'
alias cfglgg='dotcfg log --graph'
alias cfglgga='dotcfg log --graph --decorate --all'
alias cfglgm='dotcfg log --graph --max-count=10'
alias cfglo='dotcfg log --oneline --decorate'
alias cfglol="dotcfg log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias cfglols="dotcfg log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias cfglod="dotcfg log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias cfglods="dotcfg log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias cfglola="dotcfg log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias cfglog='dotcfg log --oneline --decorate --graph'
alias cfgloga='dotcfg log --oneline --decorate --graph --all'
alias cfglp="_cfggit_log_prettily"

alias cfgm='dotcfg merge'
alias cfgmom='dotcfg merge origin/master'
alias cfgmt='dotcfg mergetool --no-prompt'
alias cfgmtvim='dotcfg mergetool --no-prompt --tool=vimdiff'
alias cfgmum='dotcfg merge upstream/master'
alias cfgma='dotcfg merge --abort'

alias cfgp='dotcfg push'
alias cfgpd='dotcfg push --dry-run'
alias cfgpf='dotcfg push --force-with-lease'
alias cfgpf!='dotcfg push --force'
alias cfgpoat='dotcfg push origin --all && dotcfg push origin --tags'
alias cfgpu='dotcfg push upstream'
alias cfgpv='dotcfg push -v'

alias cfgr='dotcfg remote'
alias cfgra='dotcfg remote add'
alias cfgrb='dotcfg rebase'
alias cfgrba='dotcfg rebase --abort'
alias cfgrbc='dotcfg rebase --continue'
alias cfgrbd='dotcfg rebase develop'
alias cfgrbi='dotcfg rebase -i'
alias cfgrbm='dotcfg rebase master'
alias cfgrbs='dotcfg rebase --skip'
alias cfgrev='dotcfg revert'
alias cfgrh='dotcfg reset'
alias cfgrhh='dotcfg reset --hard'
alias cfgroh='dotcfg reset origin/$(git_current_branch) --hard'
alias cfgrm='dotcfg rm'
alias cfgrmc='dotcfg rm --cached'
alias cfgrmv='dotcfg remote rename'
alias cfgrrm='dotcfg remote remove'
alias cfgrs='dotcfg restore'
alias cfgrset='dotcfg remote set-url'
alias cfgrss='dotcfg restore --source'
alias grt='cd "$(dotcfg rev-parse --show-toplevel || echo .)"'
alias cfgru='dotcfg reset --'
alias cfgrup='dotcfg remote update'
alias cfgrv='dotcfg remote -v'

alias cfgsb='dotcfg status -sb'
alias cfgsd='dotcfg svn dcommit'
alias cfgsh='dotcfg show'
alias cfgsi='dotcfg submodule init'
alias cfgsps='dotcfg show --pretty=short --show-signature'
alias cfgsr='dotcfg svn rebase'
alias cfgss='dotcfg status -s'
alias cfgst='dotcfg status'

# use the default stash push on git 2.13 and newer
autoload -Uz is-at-least
is-at-least 2.13 "$(dotcfg --version 2>/dev/null | awk '{print $3}')" \
  && alias cfgsta='dotcfg stash push' \
  || alias cfgsta='dotcfg stash save'

alias cfgstaa='dotcfg stash apply'
alias cfgstc='dotcfg stash clear'
alias cfgstd='dotcfg stash drop'
alias cfgstl='dotcfg stash list'
alias cfgstp='dotcfg stash pop'
alias cfgsts='dotcfg stash show --text'
alias cfgstall='dotcfg stash --all'
alias cfgsu='dotcfg submodule update'
alias cfgsw='dotcfg switch'
alias cfgswc='dotcfg switch -c'

alias cfgts='dotcfg tag -s'
alias cfgtv='dotcfg tag | sort -V'
alias gtl='gtl(){ dotcfg tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'

alias cfgunignore='dotcfg update-index --no-assume-unchanged'
alias cfgunwip='dotcfg log -n 1 | grep -q -c "\-\-wip\-\-" && dotcfg reset HEAD~1'
alias cfgup='dotcfg pull --rebase'
alias cfgupv='dotcfg pull --rebase -v'
alias cfgupa='dotcfg pull --rebase --autostash'
alias cfgupav='dotcfg pull --rebase --autostash -v'
alias cfglum='dotcfg pull upstream master'

alias cfgwch='dotcfg whatchanged -p --abbrev-commit --pretty=medium'
alias cfgwip='dotcfg add -A; dotcfg rm $(dotcfg ls-files --deleted) 2> /dev/null; dotcfg commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
