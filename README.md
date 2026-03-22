# Kambiz’s dotfiles

macOS-focused Zsh environment managed with [Dotbot](https://github.com/anishathalye/dotbot), [zgen](https://github.com/tarjoilija/zgen), and Homebrew. Layout and many ideas come from [Denys Dovhan’s dotfiles](https://github.com/denysdovhan/dotfiles) (this repo tracks that project as `upstream`).

## What’s included

- **Shell:** Oh My Zsh (via zgen), [Spaceship](https://github.com/spaceship-prompt/spaceship-prompt) prompt (remote plugin or local checkout via `SPACESHIP_PROJECT` in `.zshrc`), Fish-like autosuggestions, syntax highlighting, autopair, `fzf-tab`, history substring search, [alias-tips](https://github.com/djui/alias-tips), [base16-shell](https://github.com/chriskempson/base16-shell).
- **Tooling:** pyenv (`.zprofile` + `.zshrc`), nvm, optional direnv / zoxide hooks when installed.
- **Dotfiles:** `home/` is symlinked into `~` by `./install` (see `install.conf.yaml`).
- **Shared Zsh:** [`lib/aliases.zsh`](./lib/aliases.zsh), [`lib/lscolors.zsh`](./lib/lscolors.zsh), [`lib/smartdots.zsh`](./lib/smartdots.zsh) (loaded through zgen).
- **Scripts:** [`scripts/bootstrap.sh`](./scripts/bootstrap.sh), [`scripts/update.sh`](./scripts/update.sh), [`scripts/projects.sh`](./scripts/projects.sh), [`scripts/zgen.sh`](./scripts/zgen.sh).
- **CLI helpers:** [`bin/`](./bin) on `PATH` (see below).
- **Packages:** [`Brewfile`](./Brewfile) for Homebrew. [`scripts/update.sh`](./scripts/update.sh) refreshes Homebrew when `brew` exists; an `apt` updater is defined but **not** run from `main()` today.

## Repository layout

| Path | Role |
| --- | --- |
| [`home/`](./home/) | Source files symlinked to `~` (e.g. `.zshrc`, `.zprofile`, `.gitconfig`, `.config/…`). |
| [`lib/`](./lib/) | Zsh fragments sourced from `.zshrc` / zgen. |
| [`bin/`](./bin/) | Small executables on `PATH`. |
| [`scripts/`](./scripts/) | Install/update/bootstrap helpers. |
| [`custom/`](./custom/) | Optional per-machine snippets (`zgen load` when present). |
| [`dotbot/`](./dotbot/) | Vendored Dotbot submodule. |
| [`install.conf.yaml`](./install.conf.yaml) | Dotbot link and post-install shell steps. |

## Secrets and local overrides

- **Git identity:** `git config -f ~/.gitlocal user.email "…"` and `user.name "…"`. [`home/.gitconfig`](./home/.gitconfig) includes `~/.gitlocal`.
- **Shell:** optional `~/.zshlocal` is sourced at the end of `.zshrc`.

## Installation

```sh
git clone https://github.com/ktavabi/dotfiles.git "$HOME/.dotfiles"
cd "$HOME/.dotfiles"
./install
```

`./install` updates Git submodules, links `home/.*` into `~`, runs [`scripts/zgen.sh`](./scripts/zgen.sh), [`scripts/projects.sh`](./scripts/projects.sh), and [`scripts/agents.sh`](./scripts/agents.sh) (AGENTS instructions into agent config dirs when those paths already exist).

## Updating

```sh
update
```

(`update` → [`scripts/update.sh`](./scripts/update.sh).) The script refreshes `sudo`, **`git pull upstream master`**, `./install --except shell`, then `zgen selfupdate` and `zgen update`, then Homebrew upgrade when `brew` is available. Ensure remotes exist, for example:

- `origin` → your fork
- `upstream` → <https://github.com/denysdovhan/dotfiles.git> (or another source you track)

If your default branch is `main`, adjust the pull line in `scripts/update.sh` to match.

## Shell and zgen

- **Login shells** load [`home/.zprofile`](./home/.zprofile): Homebrew `PATH` (`brew shellenv`), then `PYENV_ROOT`, optional `~/.pyenv/bin`, then `eval "$(pyenv init --path)"` when `pyenv` is on `PATH` (needed when pyenv is installed via Homebrew).
- **Interactive shells** load [`home/.zshrc`](./home/.zshrc): `DOTFILES`, `PATH` helpers, `brew shellenv`, zgen + saved `~/.zgen/init.zsh`, direnv, pyenv, nvm, zoxide, etc.

If `~/.zgen/init.zsh` looks corrupted (syntax errors or “permission denied” under `~/.zgen`), delete it and open **one** terminal so a single `zgen save` runs. Parallel saves can garble that file.

### Oh My Zsh plugins (via zgen)

Loaded from [`home/.zshrc`](./home/.zshrc): `brew`, `git`, `history-substring-search`, `sudo`, `command-not-found`, `npm`, `yarn`, `nvm`, `fnm`, `pyenv`, `extract`, `ssh-agent`, `gpg-agent`, `macos`, `vscode`, `gh`, `common-aliases`, `direnv`, `docker`, `docker-compose`, `node`, `deno`, `bun`, `tldr`, `fzf`, plus **`zoxide`** and a second **`direnv`** load when those commands exist.

### Other Zsh bundles (zgen)

`chriskempson/base16-shell`, `djui/alias-tips`, `hlissner/zsh-autopair`, `zsh-users/zsh-syntax-highlighting`, `zsh-users/zsh-autosuggestions`, `Aloxaf/fzf-tab`, `$DOTFILES/lib`, optional `$DOTFILES/custom`, `spaceship-prompt/spaceship-prompt` (unless `SPACESHIP_PROJECT` points at a local clone), `zsh-users/zsh-completions` (`src`).

### Linked config outside the shell

Examples under [`home/.config/`](./home/.config/): Ghostty, `lsd`, GitHub CLI, Husky; plus editor/tool configs like [`.vimrc`](./home/.vimrc), [`.editorconfig`](./home/.editorconfig), [`.prettierrc`](./home/.prettierrc), [`.czrc`](./home/.czrc), [`.pylintrc`](./home/.pylintrc), [`.Rprofile`](./home/.Rprofile), RStudio prefs.

## Projects layout

[`scripts/projects.sh`](./scripts/projects.sh) creates on macOS:

```txt
~/Projects
├── Forks
├── Job
├── Playground
└── Repos
```

## Aliases

See [`lib/aliases.zsh`](./lib/aliases.zsh). Highlights:

- **Dirs:** `..` … `.....`, `dl`, `dt`, `pj`, `pjr`, `pjf`, `pjj`, `pjl` (when those folders exist).
- **Shell:** `e` → `$EDITOR`, `reload` → `source ~/.zshrc`, `clr`, `path`, `dotfiles`, `update`, `bootstrap`.
- **Open:** `open` / `o` / `oo` (via `open_command` from OMZ), `term` → iTerm.
- **Git:** `git-root`, `cdgr`.
- **Tools (when installed):** `help` → `tldr`, `lg` → `lazygit`; `ls` → `eza`, `cat` → `bat`, `cd` → `zoxide` (`z`), `rm` → `trash`.

## `bin/`

| Script | Purpose |
| --- | --- |
| [`emptytrash`](./bin/emptytrash) | Empty Trash on mounted volumes. |
| [`git-cleanup`](./bin/git-cleanup) | Prune merged Git branches and related cleanup. |
| [`git-fork`](./bin/git-fork) | Add `upstream` remote. |
| [`git-upstream`](./bin/git-upstream) | Fetch `upstream` and merge into current branch (default branch name argument: `master`). |
| [`gz`](./bin/gz) | Show gzipped size of a file. |
| [`n`](./bin/n) | Run a command with `node_modules/.bin` on `PATH`. |
| [`nyan`](./bin/nyan) | Nyan cat. |
| [`password`](./bin/password) | Random password to clipboard. |

## Git

[`home/.gitconfig`](./home/.gitconfig): `main` as default branch, color UI, `pull.rebase`, `push.current` + `autoSetupRemote`, `rerere` enabled, Git LFS filters, URL shortcuts (`gh:`, `github:`, `gst:`, `gist:` → SSH), `core.editor` = `nano -w`, includes `~/.gitlocal`.

### Aliases (short list)

| Alias | Meaning |
| --- | --- |
| `git a` | add |
| `git ua` | reset HEAD (unstage) |
| `git b` / `c` / `m` / `mc` | branch / commit / merge / merge --continue |
| `git co` / `cb` / `sw` / `swc` | checkout / checkout -b / switch / switch -c |
| `git ap` / `ca` / `cm` / `cam` | add -p / commit -a / commit -m / commit -am |
| `git s` | status -sb |
| `git main` / `master` / `develop` | checkout branch and `pull --prune` |
| `git memain` / `memaster` | fetch `origin` and merge `origin/main` or `origin/master` into current branch |
| `git remain` / `remaster` | fetch `origin` and `rebase --autostash` onto `origin/main` or `origin/master` |
| `git l` / `ll` | compact graph log / log with stats |
| `git ignore` | append to `.gitignore` |
| `git this` | init, add all, initial commit |
| `git amend` / `redo` | amend / amend keeping message |
| `git undo` / `discard` | mixed reset to parent / checkout -- |
| `git contrib` / `today` / `sync` / `lazy` | shortlog / today’s diff stat / pull && push / lazygit |

## Resources

- [dotfiles.github.com](http://dotfiles.github.com/)
- [Denys Dovhan’s dotfiles](https://github.com/denysdovhan/dotfiles)

## License

MIT © Kambiz Tavabi
