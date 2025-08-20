#!/bin/bash

# Agent Evolution Script
# Continuously improves agents through iterative creation and comparison

set -e  # Exit on any error

AGENTS_DIR="../.claude/agents"
INSTRUCTIONS_DIR="../.claude/instructions"

# Function to create agent-creator agent
createAgentCreator() {
    echo "Creating new agent-creator..."
    claude --dangerously-skip-permissions -p "/create-agent <agent-creator>agent-creator</agent-creator><agent-name>agent-creator-2</agent-name><task>Do not use Opus model. Create an agent to perform a specific task. Write it considering the guidelines in @.claude/instructions/agent-creation-guidelines.md</task>" # and the updated official documentation via WebFetch tool: https://docs.anthropic.com/en/docs/claude-code/sub-agents</task>"
    return $?
}

# Function to create document-learner agent
createAgentLearner() {
    echo "Creating new document-learner..."
    claude --dangerously-skip-permissions -p "/create-agent <agent-creator>agent-creator-2</agent-creator><agent-name>document-learner-2</agent-name><task>Do not use Opus model. Read a set of documents and learn from them. Write it considering the guidelines in @.claude/instructions/agent-creation-guidelines.md</task>" # and the updated official documentation via WebFetch tool: https://docs.anthropic.com/en/docs/claude-code/sub-agents</task>"
    return $?
}

# Function to create agent-comparer agent
createAgentComparer() {
    echo "Creating new agent-comparer..."
    claude --dangerously-skip-permissions -p "/create-agent <agent-creator>agent-creator-2</agent-creator><agent-name>agent-comparer-2</agent-name><task>Do not use Opus model. Read 2 or more agent documents with the same task, but written in different ways, and judge which would perform the task better. think hard on which are the pros and cons of each, i.e., the strengths and the weaknesses of each. Consider aspects such as quality, efficiency, accuracy, and cost (tokens usage). The cost should be considered almost as important as the overall quality, at a 40-60 ratio. Do all needed printing in your thinking output, the response should be only the name of the best agent. The agent-comparer-2 agent should first read the document @.claude/instructions/agent-creation-guidelines-2.md</task>" # and the updated official documentation via WebFetch tool: https://docs.anthropic.com/en/docs/claude-code/sub-agents</task>"
    return $?
}

# Function to update documentation
readDocs() {
    echo "Updating documentation..."
    claude -p "/learn <document-learner>document-learner-2</document-learner><document-name>agent-creation-guidelines-2</document-name><urls>
  * [Claude Code Sub-Agents](https://docs.anthropic.com/en/docs/claude-code/sub-agents)
  * [ClaudeLog Claude Code Custom Agents](https://claudelog.com/mechanics/custom-agents/)
  * [ClaudeLog Claude Code Agent Engineering](https://claudelog.com/mechanics/agent-engineering/)
  * [Revolutionizing AI Development: How Claude Code's Sub-Agents Transform Task Management](https://htdocs.dev/posts/revolutionizing-ai-development-how-claude-codes-sub-agents-transform-task-management/)
</urls>"
    return $?
}

# Function to pick best agent between two using the custom slash command
pickBestAgent() {
    local agent1="$1"
    local agent2="$2"

    echo "Comparing $agent1 vs $agent2..."

    # Use the custom pick-best-agent slash command
    result=$(claude -p "/pick-best-agent <agent-names>[$agent1, $agent2]</agent-names>" 2>&1)

    if [ $? -ne 0 ]; then
        echo "Error comparing $agent1 and $agent2: $result" >&2
        return 1
    fi

    # Extract winner from result - assuming the command returns the winner name
    # This may need adjustment based on the actual output format of your custom command
    winner=$(echo "$result" | grep -oE "(agent-creator|agent-comparer|document-learner)(-2)?" | head -1)

    if [ -z "$winner" ]; then
        echo "Error: Could not determine winner from comparison output" >&2
        echo "Output was: $result" >&2
        return 1
    fi

    echo "$winner"
    return 0
}

# Function to safely delete files
deleteFiles() {
    local files=("$@")
    for file in "${files[@]}"; do
        if [ -f "$AGENTS_DIR/$file.md" ]; then
            echo "Deleting $AGENTS_DIR/$file.md"
            rm "$AGENTS_DIR/$file.md"
        fi
    done
}

# Function to delete guidelines file
deleteGuidelines() {
    # Delete guidelines file
    if [ -f "$INSTRUCTIONS_DIR/agent-creation-guidelines.md" ]; then
        echo "Deleting $INSTRUCTIONS_DIR/agent-creation-guidelines.md"
        rm "$INSTRUCTIONS_DIR/agent-creation-guidelines.md"
    fi
}

# Function to rename files
renameFiles() {
    local renames=("$@")
    for rename in "${renames[@]}"; do
        local from=$(echo "$rename" | cut -d: -f1)
        local to=$(echo "$rename" | cut -d: -f2)

        if [ -f "$AGENTS_DIR/$from.md" ]; then
            echo "Renaming $from.md to $to.md"
            claude --dangerously-skip-permissions -p "Rename the sub-agent in $AGENTS_DIR/$from.md to $AGENTS_DIR/$to.md. Remember to update the name in the YAML frontmatter."
        fi
    done
}

renameGuidelines() {
    # Rename guidelines file
    if [ -f "$INSTRUCTIONS_DIR/agent-creation-guidelines-2.md" ]; then
        echo "Renaming agent-creation-guidelines-2.md to agent-creation-guidelines.md"
        mv "$INSTRUCTIONS_DIR/agent-creation-guidelines-2.md" "$INSTRUCTIONS_DIR/agent-creation-guidelines.md"
    fi
}

# Function to create backup of original agents and guidelines
createBackup() {
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local backup_dir="backup_${timestamp}"

    echo "Creating backup in $backup_dir..."
    mkdir -p "$backup_dir"

    # Backup original agents
    local agents=("agent-creator" "agent-comparer" "document-learner")
    for agent in "${agents[@]}"; do
        if [ -f "$AGENTS_DIR/$agent.md" ]; then
            echo "Backing up $agent.md"
            cp "$AGENTS_DIR/$agent.md" "$backup_dir/"
        else
            echo "Warning: $agent.md not found, skipping backup"
        fi
    done

    # Backup original guidelines
    if [ -f "$INSTRUCTIONS_DIR/agent-creation-guidelines.md" ]; then
        echo "Backing up agent-creation-guidelines.md"
        cp "$INSTRUCTIONS_DIR/agent-creation-guidelines.md" "$backup_dir/"
    else
        echo "Warning: agent-creation-guidelines.md not found, skipping backup"
    fi

    echo "Backup completed in $backup_dir"
}

# Main evolution loop
main() {
    echo "Starting agent evolution process..."

    # Create backup before starting evolution
    createBackup

    local iteration=0
    local max_iterations=10  # Safety limit

    while [ $iteration -lt $max_iterations ]; do
        iteration=$((iteration + 1))
        echo "=== Iteration $iteration ==="

        # Create new versions of agents
        if ! createAgentCreator; then
            echo "Error creating agent-creator, stopping evolution"
            exit 1
        fi

        if ! createAgentLearner; then
            echo "Error creating document-learner, stopping evolution"
            exit 1
        fi

        if ! readDocs; then
            echo "Error updating documentation, stopping evolution"
            exit 1
        fi

        if ! createAgentComparer; then
            echo "Error creating agent-comparer, stopping evolution"
            exit 1
        fi

        # Compare agents and determine winners
        topCreator=$(pickBestAgent "agent-creator-2" "agent-creator")
        if [ $? -ne 0 ]; then
            echo "Error comparing agent creators, stopping evolution"
            exit 1
        fi

        topComparer=$(pickBestAgent "agent-comparer-2" "agent-comparer")
        if [ $? -ne 0 ]; then
            echo "Error comparing agent comparers, stopping evolution"
            exit 1
        fi

        topLearner=$(pickBestAgent "document-learner-2" "document-learner")
        if [ $? -ne 0 ]; then
            echo "Error comparing agent learners, stopping evolution"
            exit 1
        fi

        echo "Winners: Creator=$topCreator, Comparer=$topComparer, Learner=$topLearner"

        # Check if evolution has converged (no improvements)
        if [[ "$topCreator" == "agent-creator" ]] && [[ "$topComparer" == "agent-comparer" ]] && [[ "$topLearner" == "document-learner" ]]; then
            echo "Evolution converged - no improvements found"
            break
        fi


        # Clean up and promote new versions
        echo "Promoting new versions..."
        if [[ "$topCreator" == "agent-creator-2" ]]; then
            deleteFiles "agent-creator"
            renameFiles "agent-creator-2:agent-creator"
        fi

        if [[ "$topComparer" == "agent-comparer-2" ]]; then
            deleteFiles "agent-comparer"
            renameFiles "agent-comparer-2:agent-comparer"
        fi

        if [[ "$topLearner" == "document-learner-2" ]]; then
            deleteFiles "document-learner"
            renameFiles "document-learner-2:document-learner"
            deleteGuidelines
            renameGuidelines
        fi

        echo "Iteration $iteration complete"
        echo ""
    done

    if [ $iteration -eq $max_iterations ]; then
        echo "Maximum iterations reached, stopping evolution"
    fi

    echo "Agent evolution process completed after $iteration iterations"
}

# Run main function
main "$@"
