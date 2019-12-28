#!/usr/bin/env bash

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;36m"
NORMAL="\033[0m"

HAMMERSPOON_REPO_HTTPS="https://github.com/luismayta/hammerspoon.git"
HAMMERSPOON_ROOT_PATH=~/.hammerspoon

message_error() {
    printf "${RED}%s${NORMAL}\n" "[ERROR]: ${1}"
    exit 1
}

message_info() {
  printf "${BLUE}%s${NORMAL}\n" "[INFO]: ${1}"
}

message_warning() {
    printf "${YELLOW}%s${NORMAL}\n" "[WARNING]: ${1}"
}

message_success() {
  printf "${GREEN}%s${NORMAL}\n" "🍺️ [SUCCESS]: ${1}"
}

hammerspoon::install::dependences() {
    if ! type -p brew > /dev/null; then
        message_error "Install brew for next also use github.com/luismayta/zsh-brew"
    fi

    hash git >/dev/null 2>&1 || {
        brew install git
    }

    hash curl >/dev/null 2>&1 || {
        brew install curl
    }

    hash wget >/dev/null 2>&1 || {
        brew install wget
    }

}

# hammerspoon::install - install hammerspoon app
hammerspoon::install() {
    if type -p brew > /dev/null; then
        message_info "Install Hammerspoon"
        brew cask install hammerspoon
        hammerspoon::post_install
        message_success "Installed Hammerspoon"
    fi
}

hammerspoon::post_install() {
  if [ -d "${HAMMERSPOON_ROOT_PATH}" ]; then
    message_warning "You already have ${HAMMERSPOON_ROOT_PATH} directory."
    message_warning "You have to remove ${HAMMERSPOON_ROOT_PATH} if you want to re-install."
    exit 0
  fi

  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  message_info "Cloning hammerspoon from ${HAMMERSPOON_REPO_HTTPS}"

  env git clone --depth=1 "$HAMMERSPOON_REPO_HTTPS" --branch master "${HAMMERSPOON_ROOT_PATH}" || {
    message_error "git clone of hammerspoon repo failed."
  }

  message_info "Looking for an existing hammerspoon config..."
  if [ -d "${HAMMERSPOON_ROOT_PATH}" ]; then
    message_warning "Found ${HAMMERSPOON_ROOT_PATH}"
    message_info "You will see your old ${HAMMERSPOON_ROOT_PATH} as ${HAMMERSPOON_ROOT_PATH}/hammerspoon.bak"
    mv "${HAMMERSPOON_ROOT_PATH}" "${HAMMERSPOON_ROOT_PATH}/hammerspoon.bak"
  fi

  message_info "Keep calm and use Hammerspoon!"

}

if [ ! -d "/Applications/Hammerspoon.app" ]; then
    hammerspoon::install
fi
