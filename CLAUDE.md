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
- `.claude` - Project specific configuration for Claude Code
- `dotclaude` - Actual .claude mounted at `~/.claude`. This is where you should put non-project specific configuration.
- `CLAUDE.base.md` - Base configuration for Claude Code to copy to other projects
- `external-resources` - External resources for Claude Code.

### External Resources

- `super-claude` - Super Claude, a collection of Claude Code agents and prompts.
- `awesome-claude-prompts` - Awesome Claude Prompts, a collection of Claude Code prompts.
- `awesome-claude-code-agents` - Awesome Claude Code Agents, a collection of Claude Code agents.
- `awesome-claude-code-subagents` - Awesome Claude Code Subagents, a collection of Claude Code agents.
- `awesome-claude-code` - Awesome Claude Code, a collection of Claude Code resources.

### `dotclaude/`

- `agents` - Personal agents for Claude Code.
- `commands` - Personal commands for Claude Code.
- `hooks` - Personal hooks for Claude Code.
- `scripts` - Scripts for Claude Code, including agent-evolution.sh.
- `shared` - Shared resources for Claude Code of documents there were not created here nor are they part of the submodules.
- `logs` - Logs for Claude Code Agents.

#### `dotclaude/scripts`

- `agent-evolution.sh` - Script to evolve agents by looping agent evaluation and improvements.

### `dotclaude/shared`

- `docs` - Shared documents for Claude Code.
- `downloads` - Shared downloads for Claude Code.

## Output Formatting Preferences

- Always use numbered lists instead of bullet points when listing items
- Use markdown extended formatting for lists and enumerations (see https://www.markdownguide.org/extended-syntax/ if needed)
- Use numbers (1., 2., 3.) for all lists and enumerations
- Use tree structure for nested lists and enumerations

## Custom Slash Commands and Sub-Agents instructions

- Follow the slash command/agent instructions throughfully, do not skip any steps unless explicitly stated.
- Also, do not assume anything without reading the instructions
- Do not add any additional steps unless explicitly stated.

### Parameters, default values and template filling

#### Definitions

- Schemas live within the command and agent files in a YAML format code block in the subsection `Parameters Schema`
- Default values live within the command and agent files in a YAML format code block in the subsection `Default Parameters Values`
- Template prompts live within the command and agent files in a markdown format code block in the subsection `Template Prompt for sub-agent Task tool` or `Template Prompts for sub-agent Task tool`
- Template outputs live within the command and agent files in a markdown format code block in the subsection `Output Template` or `Output Templates`

#### Parsing Arguments

- When Parsing Arguments assign values to variables where:
  - `$<variable-name>` is the name of the variable to assign the value to, e.g., `$urls` is the name of the variable to assign the value to the `urls` parameter
  - `$<variable-name>[<array-index>]` access the value of the array index, e.g., `$urls[0]` is the value of the first url in the `urls` parameter
  - `$<variable-name>.<object-key>` access inner values of the object, e.g., `$urls[0].url` is the value of the first url in the `urls` parameter
- `<foreach $value in $<variable-name>>` blocks loops over the array sequentially and assign the value to the variable `$value`, e.g.,
  ```
  <foreach $url in $urls>
    Launch Task using the Task tool with sub-agent "@docs:batch-downloader"
      Download the urls: <urls>{{urls}}</urls>
  </foreach>
  ```

#### Prompt Templates

- Custom Slash Commands and sub-agents can fill a prompt template with the parsed arguments to fill the command prompt when initializing a sub-agent Task.
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
- `git worktree add -b <branch-name> <path>` - Create a new branch and worktree for a task

### Github

<!-- TODO: Add gh commands -->

### Custom Slash Commands

<!-- TODO: Add custom slash commands -->
- /docs:download - Download documents from URLs and save them to a specified folder. Described in @~/.claude/commands/docs/download.md

### Custom Sub-Agents

<!-- TODO: Add custom sub-agents -->
- @agent-docs:batch-downloader - Batch download documents from URLs and save them to a specified folder. Described in @~/.claude/agents/docs/batch-downloader.md. Called from the `/docs:download` command.
- @agent-docs:downloader - Download a document from a URL and save it to a specified folder. Described in @~/.claude/agents/docs/downloader.md. Called from the `@agent-docs:batch-downloader` sub-agent.
- @agent-docs:converter - Convert a document to a specified format and save it to a specified folder. Described in @~/.claude/agents/docs/converter.md. Called from the `@agent-docs:batch-downloader` sub-agent.
- @agent-docs:conversion-verifier - Verify the conversion of a document to a specified format and save it to a specified folder. Described in @~/.claude/agents/docs/conversion-verifier.md. Called from the `@agent-docs:batch-downloader` sub-agent.

### Custom Workflows

<!-- TODO: Add custom workflows -->

## Development Notes

This repository appears to be in early stages and will contain:
- Custom slash command configurations
- Sub agent definitions
- Personal workflow configurations for Claude Code
- Scripts for Claude Code

### Git Guidelines

#### Branch Naming

Read @~/.claude/shared/docs/conventional-branch.md for more details.

#### Commit Conventions

- **Basics**: Read @~/.claude/shared/docs/conventional-commits.md for more details.
- **Focused Commits**: Only commit files directly related to your current task or change
- **Staging Discipline**: Use `git add` selectively to stage only relevant files, not `git add .`
- **Unrelated Changes**: Keep unrelated changes (one-time testing files, config updates, etc.) in separate commits
- **Clean History**: If you accidentally stage unrelated files, use `git restore --staged <file>` to unstage them. Do not use `git restore --staged .` to unstage all files.
- **Commit Scope**: Each commit should represent a single, cohesive change that can be reviewed independently. Do not commit changes that are not related to the current task.
- **Authoring**: Do NOT add "Co-authors", "Co-Authored-By: Claude <noreply@anthropic.com>" or "🤖 Generated with [Claude Code](https://claude.ai/code)" to the commit message.

### Versioning

- **Basics**: Read @~/.claude/shared/docs/semver.md for more details.
- **Versioning Strategy**: Use semantic versioning (SemVer) for all new releases.
- **Version Management**: Use the `version` command to manage the version of the project.
- **Version File**: The version is stored in the `version.txt` file.
- **Version Tag**: The version is tagged with the `v` prefix.
- **Version History**: The version history is stored in the `version-history.md` file.
