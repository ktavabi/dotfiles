# Login-shell PATH: Homebrew must precede pyenv when pyenv is installed via Brew.
# See https://github.com/pyenv/pyenv/#installation
if [[ "$OSTYPE" == darwin* ]]; then
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

export PYENV_ROOT="${HOME}/.pyenv"
# Official installer places the pyenv script here; optional if you only use Brew.
[[ -d "${PYENV_ROOT}/bin" ]] && export PATH="${PYENV_ROOT}/bin:${PATH}"

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi
