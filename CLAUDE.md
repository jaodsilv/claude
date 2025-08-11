# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

> The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL
> NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and
> "OPTIONAL" in this document are to be interpreted as described in
> [RFC 2119](/doc/html/rfc2119).

## Repository Overview

This is a personal configuration repository for Claude Code custom base configs, sub agents, custom slash commands and workflows. The repository is currently minimal with only basic documentation.

## Current Structure

- `README.md` - Basic project description
- `LICENSE` - MIT license file
- `.claude` - Personal configuration for Claude Code
- `CLAUDE.base.md` - Base configuration for Claude Code to copy to other projects
- `external-resources` - External resources for Claude Code.
- `scripts` - Scripts for Claude Code, including agent-evolution.sh.

### External Resources

- `super-claude` - Super Claude, a collection of Claude Code agents and prompts.
- `awesome-claude-prompts` - Awesome Claude Prompts, a collection of Claude Code prompts.
- `awesome-claude-code-agents` - Awesome Claude Code Agents, a collection of Claude Code agents.
- `awesome-claude-code-subagents` - Awesome Claude Code Subagents, a collection of Claude Code agents.
- `awesome-claude-code` - Awesome Claude Code, a collection of Claude Code resources.

### .claude

- `agents` - Personal agents for Claude Code.
- `commands` - Personal commands for Claude Code.
- `hooks` - Personal hooks for Claude Code.
- `instructions` - Personal instructions for Claude Code.
- `scripts` - Scripts for Claude Code.
- `shared` - Shared resources for Claude Code of documents there were not created here nor are they part of the submodules.

#### .claude/scripts

- `agent-evolution.sh` - Script to evolve agents by looping agent evaluation and improvements.

## Output Formatting Preferences

- Always use numbered lists instead of bullet points when listing items
- Use markdown extended formatting for lists and enumerations (see https://www.markdownguide.org/extended-syntax/ if needed)
- Use numbers (1., 2., 3.) for all lists and enumerations
- Use tree structure for nested lists and enumerations

## Application Purpose

This repository is a personal configuration repository for Claude Code custom base configs, sub agents, custom slash commands and workflows.

## Frequently Used Commands

### Development

<!-- TODO: Add development commands -->

### Git

<!-- TODO: Add git commands -->

### Github

<!-- TODO: Add gh commands -->

### Custom Slash Commands

<!-- TODO: Add custom slash commands -->

- `/create-agent <agent-name>{{agent-name}}</agent-name><task>{{task}}</task>`


## Development Notes

This repository appears to be in early stages and will contain:
- Custom slash command configurations
- Sub agent definitions
- Personal workflow configurations for Claude Code
- Scripts for Claude Code

### Git Guidelines

#### Branch Naming

Read @.claude/shared/docs/conventional-branch.md for more details.

#### Commit Conventions

- **Basics**: Read @.claude/shared/docs/conventional-commits.md for more details.
- **Focused Commits**: Only commit files directly related to your current task or change
- **Staging Discipline**: Use `git add` selectively to stage only relevant files, not `git add .`
- **Unrelated Changes**: Keep unrelated changes (one-time testing files, config updates, etc.) in separate commits
- **Clean History**: If you accidentally stage unrelated files, use `git restore --staged <file>` to unstage them. Do not use `git restore --staged .` to unstage all files.
- **Commit Scope**: Each commit should represent a single, cohesive change that can be reviewed independently. Do not commit changes that are not related to the current task.
- **Authoring**: Do NOT add "Co-authors", "Co-Authored-By: Claude <noreply@anthropic.com>" or "🤖 Generated with [Claude Code](https://claude.ai/code)" to the commit message.

### Versioning

- **Basics**: Read @.claude/shared/docs/semver.md for more details.
- **Versioning Strategy**: Use semantic versioning (SemVer) for all new releases.
- **Version Management**: Use the `version` command to manage the version of the project.
- **Version File**: The version is stored in the `version.txt` file.
- **Version Tag**: The version is tagged with the `v` prefix.
- **Version History**: The version history is stored in the `version-history.md` file.

