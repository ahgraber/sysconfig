#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

usage() {
  echo "Usage: $0 [-s SRC] [-d DEST]" 1>&2
  exit 1
}

SRC=""
DEST=""
while getopts ":s:d:" opt; do
  case "${opt}" in
    s)
      SRC=${OPTARG}
      ;;
    d)
      DEST=${OPTARG}
      ;;
    *)
      usage
      ;;
  esac
done

if [[ -z "${SRC}" || -z "${DEST}" ]]; then
  usage
fi

if [ ! -d "${DEST}" ]; then
  echo "Destination path does not exist. Cloning repository..."
  mkdir -p "${DEST}"
  git clone "${SRC}" "${DEST}"
elif [ ! -d "${DEST}/.git" ]; then
  echo "Destination path is not a repository. Aborting..."
  exit 1
else
  echo "Destination path is a repository. Updating repository..."
  git -C "${DEST}" pull
fi
