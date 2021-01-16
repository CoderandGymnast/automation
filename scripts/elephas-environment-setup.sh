#!/bin/bash

# Check the status:
if [ "$ELEPHAS_ENVIRONMENT_SETUP_STATUS" == "1" ]; then
    exit
fi

# [NOTES]: Environment setup for Elephas 1.0.0
# 1. Run with Bash Shell.
# 2. Use "chmod +x elephas-environment-setup.sh" to be able to run this script.
# 3. Use "sudo rm -rf .pyenv" to remove the ".pyenv" directory.

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

# 4. Load the latest .bashrc:
# * "exec "$SHELL"": Open new shell process.
# * "." = "source".
. ~/.bashrc


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


# III. Install Java:
# * Elephas needs Java to work.

sudo apt-get update 
sudo apt-get install default-jre
export 'JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"' >> ~/.bashrc
. ~/.bashrc

# IV. Create a Python 3.7.9 virtual environment:

# 1. Create & activate Python 3.7.9 virtual environment:

# python -m venv venv
# . venv/bin/activate

# 2. Install all dependencies to run Elephas script:
# pip install -r requirements.txt

# V. Update Status: 
# * "unset ELEPHAS_ENVIRONMENT_SETUP_STATUS": Remove the specified environment variable. 

export ELEPHAS_ENVIRONMENT_SETUP_STATUS=1

# [TODO]: 
# 1. IV.
# 2. "export".

