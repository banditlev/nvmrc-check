# Readme for nvmrc-check script

The `nvmrc-check()` function is a shell script that checks if the Node.js version specified in the `.nvmrc` file of a project matches the currently installed version on your system. If the versions do not match, the script prompts you to install the required version using NVM.

## Usage

To use `nvmrc-check()`, add the script to your `.zshrc` or `.bashrc` file. You can do this by copying the script and pasting it into the appropriate file or by sourcing the script file.

If you use zsh and zplug, you can install `nvmrc-check()` as a plugin using the following command in your  `.zshrc` file:

```shell
zplug "banditlev/nvmrc-check", as:plugin, use:"nvmrc-check.plugin.zsh"
```

After installation, the script will automatically run every time you change your current working directory. The script will check for the `.nvmrc` file in the current directory and its parent directories, up to the root directory.
