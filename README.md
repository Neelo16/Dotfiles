 ## Dotfiles

This repo contains all my dotfiles. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage them.

To install them, clone this repo to your home directory and run `stow` on the directories you want to install.
For example, to install my `nvim` configuration, run:

```sh
stow nvim
```

To uninstall, run `stow -D` instead:

```sh
stow -D nvim
```

If you want to install all the dotfiles, you can run the following command to only stow directories and avoid stowing this README file:

```sh
stow */
```

To uninstall all the dotfiles, you can run the following command:

```sh
stow -D */
```

If you do not want to clone the repository to your home directory, you can clone it to a different directory and use the `-d` flag to specify the directory:

```sh
# Just nvim
stow -d "$HOME" nvim
stow -d "$HOME" -D nvim

# All dotfiles
stow -d "$HOME" */
stow -d "$HOME" -D */
```


### Requirements

- [GNU Stow](https://www.gnu.org/software/stow/) (for managing the dotfiles)
- [git](https://git-scm.com/) (for the `git` directory, and for cloning this repo in the first place)
- [Neovim](https://neovim.io/) (for the `nvim` directory)
- [vim](https://www.vim.org/) (for the `vim` directory)
- [Zsh](https://www.zsh.org/) (for the `shell` directory)
- [mpv](https://mpv.io/) (for the `mpv` directory)
- [mpd](https://www.musicpd.org/) (for the `mpd` directory)
- [i3](https://i3wm.org/) (for the `i3` directory)
