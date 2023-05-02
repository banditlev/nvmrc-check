function nvmrc-check() {
  if [ -f .nvmrc ]; then
    local nvmrc_version=$(cat .nvmrc)
    local current_version=$(node -v)

    if [ "v$nvmrc_version" != "$current_version" ]; then
      echo -e "🚨 \033[31mWarning: .nvmrc requires Node.js version (\033[36m$nvmrc_version\033[31m), but you're using \033[36m$current_version\033[0m."

      echo -e "👉 \033[33mDo you want to install Node.js version \033[36m$nvmrc_version\033[33m using NVM? (y/N)\033[0m"
      read -r user_input
      if [[ $user_input =~ ^([yY][eE][sS]|[yY])$ ]]; then
        nvm install "$nvmrc_version"
      else
        echo "🏃‍♂️ Skipping Node.js installation. You can install it later with 'nvm install $nvmrc_version'."
      fi
    else
      echo -e "✅ \033[32mNode.js version (\033[36m$current_version\033[32m) matches .nvmrc.\033[0m"
    fi
  fi
}

function chpwd_nvmrc_check() {
  nvmrc-check
}

autoload -U add-zsh-hook
add-zsh-hook chpwd chpwd_nvmrc_check
