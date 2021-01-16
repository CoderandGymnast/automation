#!/bin/bash

# [NOTES]: Environment setup for Elephas 1.0.0
# 1. Run with Bash Shell.
# 2. Use "chmod +x elephas-environment-setup.sh" to be able to run this script.

# [STEPS]: 


# I. Install "pyenv":
# * Reference: https://github.com/pyenv/pyenv#basic-github-checkout.

# 1. Clone "pyenv" src:
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# 2. Define "pyenv" as environment variable:
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc

# 3. Add "pyenv init" to your shell to enable shims and autocompletion:
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

# 4. Restart the shell:
exec "$SHELL"


# II. Install Python 3.7.9:
# * To install tensorflow<2.2, must use Python 3.7.x.

# 1. Install all Python dependencies:
# * Reference: https://github.com/pyenv/pyenv/wiki#suggested-build-environment.
sudo apt-get update
sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# 2. Install Python 3.7.9:
pyenv install 3.7.9

# 3. Switch to Python 3.7.9:
pyenv global 3.7.9

