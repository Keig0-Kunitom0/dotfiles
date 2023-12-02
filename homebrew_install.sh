#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/kunitomo/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

formulas=(
    git
    wget
    curl
    tree
    openssl
    colordiff
    cask
    peco
    hub
    node
    neovim
    tmux
    gh
    bat
    nodebrew
    tree
    ripgrep
    lazygit
    yarn
    sqlite
    sqlite
    composer
    markdown
    ctags
    nodebrew
)

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    brave-browser
    notion
    raycast
    zoom
    dbeaver-community
    google-chrome
    slack
    iterm2
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew install --cask $cask
done

brew cleanup
brew cask cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
