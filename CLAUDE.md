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

## Custom Slash Command Parameters and template filling

### Parameter Schemas

- Schemas live in the `.claude/shared/schemas` directory, but with .yml extension instead of `.md`
- The schemas directory is organized in a similar way to the `.claude/commands` directory

#### Default Values

- Default values live in the `.claude/shared/schemas` directory in the same paths as schemas, but with `.defaults.yml` extension instead of just `.yml`

#### Parsing Arguments

- When Parsing Arguments assign values to variables where:
  - `$<variable-name>` is the name of the variable to assign the value to, e.g., `$urls` is the name of the variable to assign the value to the `urls` parameter
  - `$<variable-name>[<array-index>]` access the value of the array index, e.g., `$urls[0]` is the value of the first url in the `urls` parameter
  - `$<variable-name>.<object-key>` access inner values of the object, e.g., `$urls[0].url` is the value of the first url in the `urls` parameter
- `<foreach $value in $<variable-name>>` blocks loops over the array sequentially and assign the value to the variable `$value`, e.g.,
  ```
  <foreach $url in $urls>
    <task agent="@docs:downloader">
      Download the url: <url>{{url}}</url>
    </task>
  </foreach>
  ```

### Prompt Templates

- Custom Slash Commands and sub-agents can fill a prompt template with the parsed arguments to fill the command prompt when initializing a sub-agent Task.
- Prompt templates live in the `.claude/shared/templates` directory
- The templates directory is organized in a similar way to the `.claude` directory, but with only the commands and agents directories
- The path to a template is a path with the same name as the command or agent without the file extension and with filename the step name appended by the extension `.md`, not the path to the agent where it will be used, e.g., if the command `/docs:download` fills a template in its `<fill>` block to sent to the `@docs:downloader` agent, then the template path is `@.claude/shared/templates/commands/docs/download/fill.md`
- In the template, the placeholder "{{<variable-name>}}" or "{{ <variable-name> }}" should be replaced with the value of the variable `$<variable-name>`.
- Similarly, the placeholder "{{<variable-name>.<object-key>}}" or "{{ <variable-name>.<object-key> }}" should be replaced with the value of the variable `$<variable-name>.<object-key>`.
- Within a template, placeholders surrounded by backquotes are treated as code blocks and are not replaced with the value of the variable, e.g., "`{{<variable-name>}}`" or "`{{ <variable-name> }}`" should NOT be replaced with the value of the variable `$<variable-name>`.

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

