#!/usr/bin/env zsh

conda_env_create () {

  [[ "$1" = "-h" || "$1" = "--help" ]] && echo "
    Usage: 
    '$(basename "$0") <env_name> [OPTIONAL: list of packages to install]'

    -h, --help                      Display help
  " && return

  env_name="$1"
  shift
  package_list="$*"
  package_list="${package_list:=python>3.7}"

  if [[ "$(uname -p)" = "i386" ]]; then
    echo "Running x86/Rosetta install"
    conda_arch="osx-64"

    # ensure env starts with "x86"
    if [[ ! "$env_name" =~ "^x86_" ]]; then 
      env_name="x86_$env_name"
      echo "Prepending 'x86_'"
    fi
  fi

  echo "Creating new conda env: '$env_name'"
  echo "Installing packages: $package_list"

  if [[ "$(uname -p)" = "i386" ]]; then
    CONDA_SUBDIR="$conda_arch" conda create -n "$env_name" "$package_list" --quiet --yes && conda activate "$env_name"
    conda env config vars set CONDA_SUBDIR="$conda_arch" --name "$env_name"
    conda deactivate && conda activate "$env_name"  # not technically needed, but can prevent env overwrites
    unset conda_arch
  else
    conda create -n "$env_name" "$package_list" --quiet --yes && conda activate "$env_name"
  fi
  
  conda config --prepend channels conda-forge > /dev/null 2>&1
  echo "Environment $env_name created for $(conda config --env --show | grep 'subdir:') architecture"
  unset env_name

}
