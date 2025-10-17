[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/jaodsilv/claude/main.svg)](https://results.pre-commit.ci/latest/github/jaodsilv/claude/main)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
[![Conventional Branch](https://img.shields.io/badge/Conventional%20Branch-1.0.0-blue)](https://github.com/conventional-branch/conventional-branch)
[![Code License](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/jaodsilv/claude?tab=MIT-1-ov-file)

# Claude 🤖

My custom base config for my personal projects, including a very basic `CLAUDE.md` (named `CLAUDE.base.md`, the `CLAUDE.md` here is
actually the `CLAUDE.md` of this repo), sub agents, custom slash commands and workflows

## Repository Structure

This repository is organized into specialized Claude Code configuration directories:

### dotclaude/

General-purpose Claude Code configurations mounted as `~/.claude`.

### job-hunting.claude/

Job hunting specific configurations including:

1. Cover letter evaluation agents
2. Resume tailoring tools
3. Job search automation commands
4. Interview preparation workflows

### personal-projects.claude/

Placeholder for personal project configurations.

### learning.claude/

Placeholder for learning project configurations.

### external-resources/

Git submodules containing community resources:

1. super-claude
2. awesome-claude-prompts
3. awesome-claude-code-agents
4. awesome-claude-code-subagents
5. awesome-claude-code
6. dynamic-sub-agents

## Motivation for Restructuring

The monolithic `dotclaude/` directory was causing:

1. Slow Claude Code startup
2. Missing slash commands in some sessions
3. Missing agents in some sessions

Splitting into specialized directories:

1. Improves startup performance
2. Reduces context loading
3. Makes configurations more maintainable
4. Allows for workflow-specific customization

<!-- TODO: Add instructions for Windows and MacOS -->
## How I suggest you to use this

1. git clone or fork into your src folder
2. Create a new branch for your own stuff, this will make it easier to merge with whatever I add later
3. Copy everything from your own ~/.claude into the .claude here
4. If needed add whatever file you have with secrets in the .gitignore, this .gitignore already includes .credentials.json
5. Further instructions for Linux and WSL users are below:
    1. Backup your *~/.claude*: `mv ~/.claude ~/.claude.bak`
    2. Mount or create symlink to *.claude* into your home:
        1. `export CLAUDE_USER_PATH=/path/to/your/src/folder/claude/.claude`
        2. Mount Alternative 1 (mount with `mount --bind`):
            1. Mount this *.claude* path into *~/.claude*: `sudo mount --bind $CLAUDE_USER_PATH ~/.claude`
            2. If you liked it and this to mount once you start your system, edit your *.bashrc* or *.zshrc*:
               `echo "sudo mount --bind \$CLAUDE_USER_PATH ~/.claude" >> ~/.bashrc`
        3. Mount Alternative 2 (Create symlink with `ln -s`):
            1. Create a symlink from your home to the .claude path in your src folder: `ln -s $CLAUDE_USER_PATH ~/.claude`
            2. This is the easiest way to mount, and it is persistent, as it creates a symlink in your home.
        4. Mount Alternative 3 (mount with `bindfs`):
            1. `sudo apt-get update && sudo apt-get install bindfs`
            2. `sudo bindfs --no-allow-other $CLAUDE_USER_PATH ~/.claude`
            3. If you liked it and want this path to mount once you start your shell, edit your *.bashrc* or *.zshrc*:
               `echo "sudo bindfs --no-allow-other \$CLAUDE_USER_PATH ~/.claude" >> ~/.bashrc`
        5. Mount Alternative 4 (mount with `/etc/fstab`):
            1. If you liked it and this to mount once you start your system, edit your `/etc/fstab`:
               `sudo echo "\$CLAUDE_USER_PATH /home/\$USER/.claude none bind" >> /etc/fstab && sudo systemctl daemon-reload`

## Contributing

If you feel you have anything relevant to share, commit and create a PR, I'll be happy to include anything I find useful ❤
