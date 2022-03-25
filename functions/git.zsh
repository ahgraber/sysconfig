#!/usr/bin/env zsh

git_branch_clean () {
  local -r deleteflag=${1:-"-d"}
  # remove link to nonexistent upstream branch
  git remote prune origin;
  # removes LOCAL branches that are deleted on (remote) origin
  git fetch -p;
  git branch -vv | grep ': gone]' | grep -v "\*" | awk '{ print $1 }' | xargs git branch ${deleteflag}
}
