# Kambiz’s dotfiles

All credit goes to [Denys Dovhan](https://github.com/denysdovhan/dotfiles) who created the Zsh spaceship prompt and wrapped up the following features into a dotfiles repo:

- The usefulness of [Oh My ZSH!](http://ohmyz.sh/) is already built–in.
- [Spaceship](https://github.com/spaceship-prompt/spaceship-prompt) as a prompt.
- [Fish](https://fishshell.com/)-like autosuggestion in Zsh.
- Syntax highlighting of commands while they are typed.
- Automatically closing and deleting of quotes and brackets when you type them.
- Browser-like substring search for history.
- [zgen](https://github.com/tarjoilija/zgen) for dependency management.
- Lots of useful [aliases](./lib/aliases.zsh).
- Modern CLI tools like `eza` (smarter `ls`), `bat` (smarter `cat`), `zoxide` (smarter `cd`).
- Git config, global `.gitignore` file and aliases.
- Homebrew bundle for bootstrapping a macOS workstation.
- A lot of useful [bins](https://github.com/denysdovhan/dotfiles/tree/master/bin).
- `update` script for updating dotfiles, Zsh plugins, brew, and apt packages.

Missing feature? 🍴 Fork [Deny's repo](https://github.com/denysdovhan/dotfiles) and make it better!

## Installation

Dotfiles are installed by running one of the following commands in your terminal, just copy one of the following commands and execute in the terminal:

Tell Git who you are using these commands:

```sh
git config -f ~/.gitlocal user.email "email@yoursite.com"
git config -f ~/.gitlocal user.name "Name Lastname"
```

Clone dotfiles repo:

```sh
# Clone dotfiles repo
git clone https://github.com/denysdovhan/dotfiles.git $HOME/.dotfiles

# Go to the dotfiles directory
cd $HOME/.dotfiles

# Install dotfiles
./install
```

`./install` also links [`agents/AGENTS.md`](./agents/AGENTS.md) into supported agent config directories when those directories already exist (`~/.codex`, `~/.cursor`, `~/.config/agents`, `~/.config/github-copilot`, and `~/.config/opencode`).

## Updating

Use single command to get the latest updates:

```sh
update
```

This command refreshes `sudo`, pulls the latest dotfiles, reruns `./install --except shell`, updates `zgen` and Zsh plugins, and updates `brew` when available.

## Under the hood

> **Note:** You may put your custom settings into `$DOTFILES/custom`.

### Projects tree

I suggest you to organize project folder as follows:

```txt
~/Projects
├── Forks       # for GitHub fork
├── Job         # for job projects
├── Playground  # for short-term experiments
└── Repos       # for long-term projects
```

### Aliases

Aliases are going to make your work fast and enjoyable. See code in `$DOTFILES/lib/aliases.zsh`. Here is what's included:

- Aliases from Oh-My-Zsh. See [Oh-My-Zsh Cheatsheet](https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet#commands) for more.
- Easier navigation
  - **`..`** → `cd ..`
  - **`...`** → `cd ../..`
  - **`....`** → `cd ../../..`
  - **`.....`** → `cd ../../../..`
  - **`~`** → `cd ~`
  - **`-`** → `cd -`
- Folders shortcuts
  - **`dl`** → `cd ~/Downloads`
  - **`dt`** → `cd ~/Desktop`
  - **`pj`** → `cd ~/Projects`
  - **`pjr`** → `cd ~/Projects/Repos`
  - **`pjf`** → `cd ~/Projects/Forks`
  - **`pjj`** → `cd ~/Projects/Job`
  - **`pjl`** → `cd ~/Projects/Playground`
- Commands Shortcuts
  - **`e`** → `$EDITOR`
  - **`+x`** → `chmod +x`
  - **`x+`** → `chmod +x`
  - **`reload`** → reload `~/.zshrc`
  - **`clr`** → `clear`
- Open
  - **`open <FILE>`** — open file from terminal.
  - **`o <FILE>`** — open file from terminal.
  - **`oo`** — open current folder.
  - **`term`** — open iTerm.
- Misc
  - **`update`** — get updates (Runs `$DOTFILES/scripts/update.sh`).
  - **`bootstrap`** — run machine bootstrap (Runs `$DOTFILES/scripts/bootstrap.sh`).
  - **`dotfiles`** — jump quickly into dotfiles folder.
  - **`myip`** — my local IP address.
  - **`password`** — generate random password, copies it into clipboard and outputs it to terminal.
  - **`path`** — print $PATH in readable view.
  - **`getpage`** — download web page with all assets.
  - **`get`** — download file with original filename.
  - **`git-root`** — jump to the current repo root.
  - **`help`** — use `tldr` when available.
  - **`lg`** — open `lazygit` when available.

Depending on installed tools, `ls` uses `eza`, `cat` uses `bat`, `cd` uses `zoxide`, and `rm` uses `trash`.

### Oh-My-Zsh plugins

These OMZ plugins are included:

- [`brew`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew) — Homebrew completions and helpers.
- [`git`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git) — git aliases and functions.
- [`history-substring-search`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/history-substring-search) — browser-like history search.
- [`npm`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/npm) — provides completion as well as adding many useful aliases.
- [`yarn`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/yarn) — the same as for `npm`, but for `yarn`
- [`nvm`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/nvm) — auto-sourcing `nvm`.
- [`fnm`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fnm) — `fnm` integration.
- [`pyenv`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/pyenv) — `pyenv` integration.
- [`gh`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gh) — GitHub CLI aliases and completions.
- [`sudo`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/sudo) — `[Esc] [Esc]` to re-run previous command with sudo.
- [`ssh-agent`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/ssh-agent) — automatically starts ssh-agent to set up and load whichever credentials you want for ssh connections.
- [`gpg-agent`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/gpg-agent) — enables `gpg-agent` if it is not running.
- [`docker`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker) and [`docker-compose`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose) — Docker helpers.
- [`fzf`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf), [`direnv`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/direnv), [`bun`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/bun), [`deno`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/deno), and more.
- More are listed in `.zshrc` (it's hard to keep the list updated).

### Bin

Dotfiles also include some functions that will make your life easier. See code in [`bin/`](./bin).

- [`emptytrash`](./bin/emptytrash) — empty the Trash on all mounted volumes and the main HDD.
- [`git-cleanup`](./bin/git-cleanup) — removes old Git branches and does other cleanup.
- [`git-fork`](./bin/git-fork) — add remote upstream.
- [`git-upstream`](./bin/git-upstream) — sync branch with upstream.
- [`gz`](./bin/gz) — get gzipped file size
- [`n`](./bin/n) — runs given command using binary in `node_modules/.bin` of the current project.
- [`nyan`](./bin/nyan) — print [nyan cat](https://www.youtube.com/watch?v=QH2-TGUlwu4).
- [`password`](./bin/password) — generate a random password and copy it to the clipboard.

### Git

> **Note:** Add your git user data and custom settings to `~/.gitlocal`.

#### Configuration

- UI color is `auto`.
- Default branch is `main`.
- Diff colors are:
  - `white bold` for meta information;
  - `cyan bold` for frag;
  - `red bold` for old lines;
  - `green bold` for new lines.
- Default editor is [Vim](http://www.vim.org/) instead of [Vi](http://www.tutorialspoint.com/unix/unix-vi-editor.htm).
- `push.default` set as `current`.
- `pull.rebase` set to `true`.
- `push.autoSetupRemote` set to `true`.
- `rerere` enabled for conflict resolution reuse.
- Automatic replacement `git://github.com/`, `gh:`, `github:` addresses as `git@github.com:` for GitHub.
- Automatic replacement `git://gist.github.com/`, `gst:`, `gist:` addresses as `git@gist.github.com:` for Gists.
- User custom settings gets from a `~/.gitlocal` file.

#### Git Aliases

- **`git a`** → `git add` — patch mode for specified files.
- **`git ua`** → `git reset HEAD` — unstage files.
- **`git b`** → `git branch` — list, create, or delete branches.
- **`git c`** → `git commit` — record changes to the repository.
- **`git m`** → `git merge` — merge branches.
- **`git mc`** → `git merge --continue` — continue merge after resolving conflicts.
- **`git co`** → `git checkout` — checkout a branch or paths to the working tree.
- **`git cb`** → `git checkout -b` — create and checkout branch.
- **`git sw`** → `git switch` — switch branches.
- **`git swc`** → `git switch -c` — create and switch branch.
- **`git ap`** → `git add -p` — add file contents to the index.
- **`git ca`** → `git commit -a` — commit with automatically stage files that have been modified and deleted.
- **`git cm`** → `git commit -m` — commit with commit message.
- **`git cam`** → `git commit -am` — add all files and commit with message.
- **`git s`** → `git status -sb` — short status with current branch.
- **`git main`** — go to `main` branch and pull from remote.
- **`git master`** — go to `master` branch and pull from remote.
- **`git develop`** — go to `develop` branch and pull from remote.
- **`git remain`** — fetch latest `main` and merge it into the current branch.
- **`git remaster`** — fetch latest `master` and merge it into the current branch.
- **`git git`** — do not complain about `git git`.
- **`git l`** — commits log with pretty single line format.
- **`git ll`** — log with list of changed files for each commit.
- **`git ignore`** — ignore files: append file to `.gitignore`.
- **`git this`** — initialize, add all files and commit.
- **`git amend`** — amend last commit.
- **`git redo`** — amend last commit with its original message.
- **`git undo`** → `reset --mixed HEAD^` — reset index changes, but not the working tree.
- **`git discard`** → `checkout --` — discard changes.
- **`git contrib`** — list of contributors and how many commits each person has.
- **`git today`** — see how many lines of code you have written today.
- **`git sync`** — pull and push changes from/to remote.
- **`git lazy`** — open `lazygit`.
- **`git-root`** — go to repo root.
- **`git-cleanup [--force]`** — removes old Git branches.
- **`git-fork <original-author>`** — add remote upstream.
- **`git-upstream [branch]`** — sync branch with upstream (defaults to `master`).

## Resources

Resources to make dotfiles:

- [GitHub ❤ ~/](http://dotfiles.github.com/)
- [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)

## License

MIT © Kambiz Tavabi
