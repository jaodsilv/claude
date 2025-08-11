# CLAUDE.md

{{project-description}}

## Repository Overview

{{repository-overview}}

## Current Structure

- `README.md` - Basic project description
- `LICENSE` - MIT license file
- `.claude` - Project-specific Claude Code configuration

## Output Formatting Preferences
- Always use numbered lists instead of bullet points when listing items
- Use markdown extended formatting for lists and enumerations (see https://www.markdownguide.org/extended-syntax/ if needed)
- Use numbers (1., 2., 3.) for all lists and enumerations
- Use tree structure for nested lists and enumerations

## Application Purpose

{{application-purpose}}

## Frequently Used Commands

### Development
{{development-commands}}

### Git

<!-- TODO: Add git commands. The below are just examples. -->

- `git add <file>` - Stage a file
- `git commit -m "<commit message>"` - Commit changes
- `git push` - Push changes to remote repository
- `git pull` - Pull changes from remote repository
- `git switch -c <branch-name>` - Create a new branch
- `git switch <branch-name>` - Switch to a branch
- `git branch --show-current` - Show current branch
- `git branch -d <branch-name>` - Delete a branch
- `git status` - List all branches (local and remote)
- `git diff HEAD` - Merge a branch into the current branch

### Github

<!-- TODO: Add gh commands. The below are just examples. -->

- `gh issue view <issue-number>` - View an issue
- `gh issue create --title "<title>" --body "<body>"` - Create an issue
- `gh issue list` - List all issues
- `gh issue comment <issue-number> --body "<body>"` - Comment on an issue
- `gh issue close <issue-number>` - Close an issue
- `gh pr create -a @me -l <labels> -T <template> --title "<title>" --body "<body>"` - Create a pull request
- `gh pr list` - List all pull requests
- `gh pr view <pr-number> -c --json "comments" --jq '.comments | map(select(.author.login == "claude")) | last | { id: .id, author: .author.login, body: .body, isMinimized: .isMinimized }'` - Get the latest PR comment from Claude
- `gh pr merge <pr-number>` - Merge a pull request
- `gh pr close <pr-number>` - Close a pull request
- `gh api --method PATCH /repos/jaodsilv/ai-message-writer-assistant/pulls/comments/<comment-id> -f "minimizedReason=RESOLVED" -f 'isMinimized=true'` - Mark a pull request comment as resolved

### Custom Slash Commands

<!-- TODO: Add custom slash commands. The below are just examples. -->

- `/add-task <Optional [TaskIndex]|[Github Issue Number]> <TaskDescription>` - Add a new task to the @.claude/shared/todo.md file. Described in ~/.claude/commands/add-task.md
- `/address-pr-comment <PRNumber> <CommentID> <action>` - Address a PR comment by trying to fix a problem pointed in a PR comment. Described in ~/.claude/commands/address-pr-comment.md
- `/check-last-pr-comment <PRNumber>` - Parse the last PR comment from Claude and list suggestions for required and/or optional changes. Described in ~/.claude/commands/check-last-pr-comment.md
- `/clean-all-comments` - Scan repo for comments that chould be cleaned up and remove them. Described in ~/.claude/commands/clean-all-comments.md
- `/clean-comments` - Scan and edit local code changes that are not yet committed to git and remove comments that are not needed. Described in ~/.claude/commands/clean-comments.md
- `/commit-push <Optional: Context>` - Commit and push changes to the current branch. Described in ~/.claude/commands/commit-push.md
- `/commit <Optional: Context>` - Commit changes to the current branch. Described in ~/.claude/commands/commit.md
- `/create-pr <Optional: Context>` - Create a pull request. Described in ~/.claude/commands/create-pr.md
- `/execute-plan <TaskIndex>` - Execute the plan for a task. Described in ~/.claude/commands/execute-plan.md
- `/execute-step <StepIndex>` - Execute the next step in the current ongoing plan. Described in ~/.claude/commands/execute-step.md
- `/new-branch <TaskIndex>` - Create a new branch for a task. Described in ~/.claude/commands/new-branch.md
- `/plan` - Plan a task in the .claude/shared/todo.md file. Described in ~/.claude/commands/plan.md
- `/switch-master` - Switch to the master branch and delete previous branch. Described in ~/.claude/commands/switch-master.md
- `/worktree <TaskIndex>` - Create a worktree for a task. Described in ~/.claude/commands/worktree.md

## Environment Setup

{{environment-setup}}

## Project Management

<!-- TODO: Add project management -->
- **Project Board**: [{{project-board-name}}]({{project-board-url}})
- **Development Plan**: See `.claude/shared/todo.md` for high-level roadmap with issue links. Exists only in this branch. Do not attempt to read from other branches or worktrees
- **Issue Creation**: Use GitHub issue templates for consistent reporting
- **Automation**: GitHub Actions automatically add labeled issues/PRs to project board. See `.github/workflows/add-issues-to-project.yml`

## Architecture Overview

### Tech Stack
- **Framework**: {{framework}}
- **Styling**: {{styling}}
- **Build Tool**: {{build-tool}}
{{project-specific-tech-stack}}

### Project Structure
{{project-structure}}

### Key Components and Architecture

{{key-components-and-architecture}}

## Development Notes

{{base-development-notes}}

### Code Style

{{code-style}}

### Security Considerations
- API keys loaded from environment variables only
- No hardcoded credentials in source code
- `.{{env-file-name}}` file excluded from version control
- **API Key Validation**: Verify API key format and test connectivity on startup
- **Error Handling**: Implement graceful handling of API failures and rate limits
- **API Key Rotation**: Update `.{{env-file-name}}` file when rotating keys, restart application to apply changes
{{project-specific-security-considerations}}

### Testing and Linting
- ESLint configured with {{framework}} app presets
- **Testing Framework**: {{testing-framework}}
- **Test Coverage Target**: >{{test-coverage-target}}% coverage for production readiness
- **Testing Strategy**: TDD for any task associated to a GitHub issue. Unit tests for components/hooks, integration tests for workflows, E2E tests for critical paths.
- **Linting**: {{linting}}
- **Typechecking**: {{typechecking}}
{{project-specific-testing-and-linting}}
- **Testing Running**: Prefer running single tests, and not the whole test suite, for performance

### Issue Tracking and Development Plan
- **Issue Tracking**: All features tracked as GitHub issues linked to development phases
- **Project Management**: Automated GitHub Actions workflow for issue/PR management
- **Phase-Based Development**: See issues [{{project-issues-url}}]({{project-issues-url}}) and @.claude/shared/todo.md for detailed implementation plan
- **Priority Levels**: Critical → High → Medium → Low (automatically set via issue labels)
- **Status Automation**: Issues/PRs automatically move through Todo → In Progress → Done states

### Development Workflow
1. Launch the `task-picker` agent to pick a task to work on. Described in ~/.claude/agents/task-picker.md
2. Launch the `task-manager` agent to manage the task and start other agents and start the rest of the workflow. Described in ~/.claude/agents/task-manager.md

### Git Guidelines

#### Branch Naming

Read @.claude/instructions/conventional-branch.md for more details.

#### Commit Conventions

- **Basics**: Read @.claude/instructions/conventional-commits.md for more details.
- **Focused Commits**: Only commit files directly related to your current task or change
- **Staging Discipline**: Use `git add` selectively to stage only relevant files, not `git add .`
- **Unrelated Changes**: Keep unrelated changes (one-time testing files, config updates, etc.) in separate commits
- **Clean History**: If you accidentally stage unrelated files, use `git restore --staged <file>` to unstage them. Do not use `git restore --staged .` to unstage all files.
- **Commit Scope**: Each commit should represent a single, cohesive change that can be reviewed independently. Do not commit changes that are not related to the current task.
- **Authoring**: Do NOT add "Co-authors", "Co-Authored-By: Claude <noreply@anthropic.com>" or "🤖 Generated with [Claude Code](https://claude.ai/code)" to the commit message.
