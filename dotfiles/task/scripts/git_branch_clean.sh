#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# set "safe" default to not force-delete
DEL_FLAG=${1:-"-d"}

# removes local branches that are deleted on (remote) origin
git fetch --prune;

git branch -vv |                # list local branches : remote branches & tracking status
grep ': gone]' |                # filter to show only local branches that have been deleted on remote
grep -v "\*" |                  # exclude branches that have "*", indicating incomplete merge
awk '{ print $1 }' |            # extract the branch name
xargs git branch "$DEL_FLAG"    # delete branch with -d (or -D if specified in call
