#!/usr/bin/env bash


# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found."
    echo "Please install Homebrew following instruction!"
    open -a /Applications/Safari.app https://brew.sh
    exit 1
else
    brew update
fi


if ! brew list pyenv &> /dev/null; then
    echo "pyenv not found. Installing pyenv..."
    brew install pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    source ~/.zshrc
else
    echo "pyenv already installed."
fi

# Install Python 3.12.2 with pyenv if it's not already installed
if ! pyenv versions | grep -q "3.12.2"; then
    echo "Python 3.12.2 not found. Installing Python 3.12.2 with pyenv..."
    pyenv install 3.12.2
else
    echo "Python 3.12.2 is already installed."
fi

# Set global Python version to 3.12.2
pyenv global 3.12.2

~/.pyenv/versions/3.12.2/bin/python -V
