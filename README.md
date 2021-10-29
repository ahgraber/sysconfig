# Dotfile Repository

## Quickstart

The following script will autoinstall the default configuration by:

* cloning this repo to `~/.zshconfig`
* installing [prerequisites](./scripts/prerequisites.sh) and required fonts
* symlinking [dotfiles](./dotfiles/) to home directory

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ahgraber/zshconfig/HEAD/install.sh)"
```

Set up your `.gitconfig`

```sh
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"
# git config --global credential.helper osxkeychain
```

## Manual Configuration

### Modifying your setup

* `.zshrc` relies on [`zcomet`](https://github.com/agkozak/zcomet) for plugin management
* Other options are set in [`lib/*.zsh`](./lib/) files

### References

* [zcomet](https://github.com/agkozak/zcomet)
* [Benchmarks & conclusions](https://github.com/romkatv/zsh-bench)
  * [diy++ from benchmark](https://github.com/romkatv/zsh-bench/blob/master/configs/diy%2B%2B/skel/.zshrc)
  * [zcomet from benchmark](https://github.com/romkatv/zsh-bench/blob/master/configs/zcomet/skel/.zshrc)
* [zsh configuration](https://vermaden.wordpress.com/2021/09/19/ghost-in-the-shell-part-7-zsh-setup/)
* [completion configuration](https://github.com/Phantas0s/.dotfiles/blob/master/zsh/completion.zsh) and [blog](https://thevaluable.dev/zsh-completion-guide-examples/)

### Adding completions

Add completions to the watched completions folder:

```sh
# bat
curl -L https://raw.githubusercontent.com/sharkdp/bat/master/assets/completions/bat.zsh.in \
   -o $ZSHCONFIG/completions/_bat

# docker
curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker \
   -o $ZSHCONFIG/completions/_docker

# docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose \
   -o $ZSH_CONFIG/completions/_docker-compose

# exa
curl -L https://raw.githubusercontent.com/ogham/exa/master/completions/zsh/_exa \
   -o $ZSHCONFIG/completions/_exa

# fd
curl -L https://github.com/sharkdp/fd/blob/master/contrib/completion/_fd \
   -o $ZSH_CONFIG/completions/_fd

# flux
flux completion zsh > _flux
mv _flux $ZSH_CONFIG/completions/

# helm
helm completion zsh > _helm
mv _helm $ZSH_CONFIG/completions/

# kubectl
kubectl completion zsh > _kubectl
mv _kubectl $ZSH_CONFIG/completions/
```

### direnv

[direnv](https://direnv.net/) allows un/loading a unique set of environmental variables depending on the current directory.

#### [Session-based direnv use](https://direnv.net/man/direnv.1.html)

1. Navigate to working directory where `.envrc` exists that you would like to load
2. To allow access (both read and modify) to `.envrc`, run

   ```sh
   direnv allow .
   ```

#### [Whitelist directories for automatic `direnv` loading](https://direnv.net/man/direnv.toml.1.html)

"Specifying whitelist directives marks specific directory hierarchies or specific directories as “trusted” – direnv will evaluate any matching .envrc files regardless of whether they have been specifically allowed. This feature should be used with great care, as anyone with the ability to write files to that directory (including collaborators on VCS repositories) will be able to execute arbitrary code on your computer."

```toml
# $HOME/config/direnv/direnv.toml
[whitelist]
prefix = [ "$HOME/GitHub" ])
```
