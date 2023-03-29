#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

usage() {
  echo "Usage: $0 -n <env_name> [-p <python_version>] [-l <package list>] [-r <environment_yaml>] [-h]"
  echo "Create a new conda environment with optional Python version and packages."
  echo "Options:"
  echo "  -n <env_name>         Name of the new conda environment (required)."
  echo "  -p <python_version>   Python version to install (optional, default 3.10)."
  echo "  -l <package_list>     List of packages to install (optional)."
  echo "                        Use quotes with spaces '-l "pandas numpy"' or commas '-l pandas,numpy'"
  echo "  -e <environment_yaml> Path to environment.yaml to install packages (optional)."
  echo "  -h                    Show this help message."
  echo ""
  echo "Example: $0 -n myenv -p 3.10.* -l 'numpy pandas' "
}

PYTHON_VERSION="3.10.*"
PKGS=()
ENV_FILE=""

# Parse arguments
while getopts ":n:e:p:l:h" opt; do
  case ${opt} in
    n )
      ENV_NAME="$OPTARG"
      ;;
    e )
      ENV_FILE="$OPTARG"
      ;;
    p )
      PYTHON_VERSION="$OPTARG"
      ;;
    l )
      IFS=', ' read -r -a PKGS <<< "$OPTARG"
      ;;
    h )
      usage
      ;;
    \? )
      printf "Invalid option: %s" "$OPTARG" 1>&2
      usage
      ;;
    : )
      printf "Invalid option: %s requires an argument" "$OPTARG" 1>&2
      usage
      ;;
  esac
done
shift $((OPTIND -1)) # for any additional params

if [[ -n "${PKGS[*]}" && -n "$ENV_FILE" ]]; then
  printf "Error: Only one of -l (packages) or -e (environment.yaml) can be provided. " 1>&2
  return 1
fi

# Check if conda is installed
if [[ -z $(command -v conda) || ! -f "$(conda info --base)/bin/activate" ]]; then
  printf "conda not found. Please install conda before running this script.\n"
  return 1
fi

# use mamba if it exists
if [[ -n $(command -v mamba) ]]; then
    conda() {
      mamba "$@"
    }
fi
# # use mamba if it exists
# if [[ -n $(command -v mamba) ]]; then
#     snake() {
#       mamba "$@"
#     }
# else
#     snake() {
#       conda "$@"
#     }
# fi

# enable "conda activate" in non-interactive shell environment (i.e., this script)
activate () {
  # shellcheck disable=SC1091  # allow non-included paths
  source "$(conda info --base)/bin/activate" && conda activate "$@"
}



# Prep architecture-based env
CONDA_SUBDIR=""
if [[ "$(sysctl -a | grep machdep.cpu.brand_string)" == *Apple* ]]; then
  archcheck=$(/usr/bin/arch)
  case "$archcheck" in
    arm64)
      CONDA_SUBDIR="osx-arm64"
    ;;
    i386|x86_64)
      CONDA_SUBDIR="osx-64"
      printf "--- NOTE: Prepending 'x86_' to environment name ---\n"
      ENV_NAME="x86_$ENV_NAME"
    ;;
    *)
      printf "Unexpected architecture %s detected" "$archcheck"
      return 1
    ;;
  esac
fi

# initialize environment
printf "Creating environment %s with python version %s ...\n" "$ENV_NAME" "$PYTHON_VERSION"
CONDA_SUBDIR="$CONDA_SUBDIR" conda create --name "$ENV_NAME" --quiet --yes python="$PYTHON_VERSION" \
&& activate "$ENV_NAME"  # reactivate env to load changes

# configure with specified conda_subdir
{
  activate "$ENV_NAME"  # ensure correct environment
  conda env config vars set CONDA_SUBDIR="$CONDA_SUBDIR" --name "$ENV_NAME" > /dev/null
  activate "$ENV_NAME"  # reactivate env to load changes
}

# Install from environment.yaml if provided
if [[ -n "$ENV_FILE" ]]; then
  printf "Attempting to recreate from environment file at %s\n" "$ENV_FILE"
  {
    activate "$ENV_NAME"  # ensure correct environment
    conda env update --name "$ENV_NAME" --file "$ENV_FILE" --quiet  # no "--yes " for "env update"
    activate "$ENV_NAME"  # reactivate env to load changes
  }
else
  printf "Pinning python version %s...\n" "$PYTHON_VERSION"
  {
    activate "$ENV_NAME"  # ensure correct environment
    conda config --env --append pinned_packages "python=$PYTHON_VERSION"
    activate "$ENV_NAME"  # reactivate env to load changes
  }
fi

if [[ -n "${PKGS[*]}" ]]; then
  printf "Installing packages: %s\n" "${PKGS[@]}"
  {
    activate "$ENV_NAME"  # ensure correct environment
    conda install --name "$ENV_NAME" --quiet --yes "${PKGS[@]}"
    activate "$ENV_NAME"  # reactivate env to load changes
  }
fi
