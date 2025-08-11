# claude
My custom base config for my personal projects, including a very basic `CLAUDE.md` (named `CLAUDE.base.md`, the `CLAUDE.md` here is actually the `CLAUDE.md` of this repo), sub agents, custom slash commands and workflows

## How I suggest you to use this
1. git clone or fork into your src folder
2. Create a new branch for your own stuff, this will make it easier to merge with whatever I add later
3. Copy everything from your own ~/.claude into the .claude here
4. If needed add whatever file you have with secrets in the .gitignore, this .gitignore already includes .credentials.json
5. Backup your ~/.claude: `mv ~/.claude ~/.claude.bak`
6. Mount or create symlink to .claude into your home:
    1. `export CLAUDE_USER_PATH=/path/to/your/src/folder/claude/.claude`
    2. Mount Alternative 1 (mount with `mount --bind`):
        1. Mount this .claude path into ~/.claude. For Linux, WSL and probably MacOS that would be `sudo mount --bind $CLAUDE_USER_PATH ~/.claude`.
        2. If you liked it and this to mount once you start your system, edit your `.bashrc` or `.zshrc`: `echo "sudo mount --bind $CLAUDE_USER_PATH ~/.claude" >> ~/.bashrc`
    3. Mount Alternative 2 (Create symlink with `ln -s`):
        1. Create a symlink from your home to the .claude path in your src folder: `ln -s $CLAUDE_USER_PATH ~/.claude`
        2. This is the easiest way to mount, and it is persistent, as it creates a symlink in your home.
    4. Mount Alternative 3 (mount with `bindfs`):
        1. `sudo apt-get update && sudo apt-get install bindfs`
        2. `sudo bindfs --no-allow-other $CLAUDE_USER_PATH ~/.claude`
        3. If you liked it and want this path to mount once you start your shell, edit your `.bashrc` or `.zshrc`: `echo "sudo bindfs --no-allow-other $CLAUDE_USER_PATH ~/.claude" >> ~/.bashrc`
    5. Mount Alternative 4 (mount with `/etc/fstab`):
        1. If you liked it and this to mount once you start your system, edit your `/etc/fstab`: `sudo echo "$CLAUDE_USER_PATH /home/$USER/.claude none bind" >> /etc/fstab && sudo systemctl daemon-reload`

## Contributing
If you feel you have anything relevant to share, commit and create a PR, I'll be happy to include anything I find useful ❤