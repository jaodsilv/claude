# Agent Creation Guidelines for Claude Code

## Executive Summary

Claude Code sub-agents are specialized AI assistants designed to operate in separate context windows with focused responsibilities, custom system prompts, and targeted tool access. This guide provides comprehensive best practices for creating high-quality, efficient agents that transform development workflows through intelligent task delegation and specialized expertise.

## Core Concepts

### 1. Agent Architecture Fundamentals

**Agent Definition**: Specialized AI assistants stored as Markdown files with YAML frontmatter configuration that operate independently with specific purposes and tool permissions.

**Key Characteristics**:
1. **Separate Context Windows** - Each agent maintains independent conversation context, preventing context pollution during task switching
2. **Specialized System Prompts** - Custom instructions tailored to specific domain expertise
3. **Targeted Tool Access** - Granular permissions controlling which tools agents can access
4. **Automatic Task Delegation** - Intelligent routing based on task context and agent descriptions
5. **Reusable Assets** - Can be shared across projects and teams

### 2. Agent Weight Classifications

**Lightweight Agents** (Under 3k tokens):
- Simple, frequent tasks
- Minimal configuration
- Fast initialization
- Ideal for repetitive operations

**Medium-weight Agents** (10-15k tokens):
- Balanced complexity
- Moderate specialization
- Standard development tasks
- Good general-purpose agents

**Heavy Agents** (25k+ tokens):
- Complex analysis and reasoning
- Deep domain expertise
- Comprehensive system prompts
- Resource-intensive but highly capable

### 3. Model Selection Strategy

**Haiku Pairing**:
- Simple, frequent tasks
- Lightweight agents
- Cost-effective for routine operations
- Quick response times

**Sonnet Pairing**:
- Balanced, moderate complexity tasks
- Medium-weight agents
- Most common pairing
- Good performance-to-cost ratio

**Opus Pairing**:
- Complex analysis and deep reasoning
- Heavy agents requiring sophisticated understanding
- High-value, complex decision-making tasks
- Maximum capability when cost is not primary concern

## Best Practices

### 1. Agent Design Principles

**Single Responsibility Principle**:
- Design focused sub-agents with single, clear responsibilities
- Avoid multi-purpose agents that dilute effectiveness
- Create specialized expertise areas

**Minimal Initial Configuration**:
- Start with lightweight configuration
- Gradually expand capabilities based on testing
- Prioritize efficiency over comprehensive capability

**Clear Purpose Definition**:
- Write detailed, specific descriptions
- Include context about when the agent should be invoked
- Use natural language that clearly communicates the agent's role

### 2. System Prompt Engineering

**Structure Requirements**:
1. **Role Definition** - Clear statement of the agent's primary function
2. **Expertise Areas** - Specific domains of knowledge and capability
3. **Operational Guidelines** - How the agent should approach tasks
4. **Quality Standards** - Expected output quality and format
5. **Tool Usage Instructions** - Specific guidance on tool selection and usage
6. **Example Scenarios** - Concrete examples of typical tasks and responses

**Prompt Engineering Techniques**:
1. **Specificity Over Generality** - Provide precise instructions rather than broad guidelines
2. **Include Concrete Examples** - Show desired behavior through specific examples
3. **Define Success Criteria** - Clearly state what constitutes successful task completion
4. **Specify Format Requirements** - Define expected output structure and formatting
5. **Address Edge Cases** - Include guidance for handling unusual or problematic scenarios

### 3. Tool Selection and Optimization

**Permission Strategy**:
1. **Principle of Least Privilege** - Grant only necessary tool access
2. **Task-Specific Tools** - Match tool permissions to agent's primary functions
3. **Security Considerations** - Restrict potentially dangerous tools for specialized agents

**Common Tool Configurations**:
- **Code Review Agents**: Read, Grep, Glob (analysis-focused)
- **Development Agents**: Read, Write, Edit, Bash (implementation-focused)
- **Documentation Agents**: Read, Write, WebFetch (content creation-focused)
- **Testing Agents**: Read, Write, Bash, Glob (testing and validation-focused)

### 4. Configuration File Structure

**YAML Frontmatter Requirements**:
```yaml
---
name: agent-name-kebab-case
description: Natural language description of agent purpose and capabilities
tools: [Read, Write, Edit, Grep, Glob, Bash, WebFetch]  # Optional, defaults to all tools
model: sonnet  # Optional: haiku, sonnet, opus
---
```

**System Prompt Structure**:
```markdown
# Agent Role Title

You are [specific role description], specialized in [domain expertise].

## Primary Responsibilities
1. [Specific responsibility 1]
2. [Specific responsibility 2]
3. [Specific responsibility 3]

## Expertise Areas
- [Domain 1]: [Specific capabilities]
- [Domain 2]: [Specific capabilities]

## Operational Guidelines
### [Guideline Category 1]
- [Specific instruction]
- [Specific instruction]

### [Guideline Category 2]
- [Specific instruction]
- [Specific instruction]

## Quality Standards
- [Standard 1]
- [Standard 2]

## Example Scenarios
### Scenario 1: [Description]
**Input**: [Example input]
**Expected Approach**: [How agent should handle]
**Output Format**: [Expected structure]

### Scenario 2: [Description]
**Input**: [Example input]
**Expected Approach**: [How agent should handle]
**Output Format**: [Expected structure]
```

## Practical Implementation Examples

### 1. Code Review Agent
```yaml
---
name: code-reviewer
description: Expert code review specialist focusing on quality, security, and best practices
tools: [Read, Grep, Glob]
model: sonnet
---

# Senior Code Reviewer

You are a senior software engineer specializing in comprehensive code reviews with expertise in multiple programming languages, security analysis, and best practices enforcement.

## Primary Responsibilities
1. Conduct thorough code quality assessments
2. Identify security vulnerabilities and recommend fixes
3. Ensure adherence to coding standards and best practices
4. Provide constructive, actionable feedback

## Expertise Areas
- **Security Analysis**: SQL injection, XSS, authentication flaws, data exposure
- **Performance Optimization**: Algorithm efficiency, memory usage, database queries
- **Code Quality**: Readability, maintainability, testability, documentation
- **Best Practices**: Design patterns, SOLID principles, language-specific idioms

## Operational Guidelines
### Review Process
- Read and analyze all modified files completely
- Use Grep to identify potential security patterns
- Check for consistent coding style and naming conventions
- Verify error handling and edge case coverage

### Feedback Format
- Categorize issues by severity: Critical, Major, Minor, Suggestion
- Provide specific line references when possible
- Include code examples for recommended fixes
- Explain the reasoning behind each recommendation

## Quality Standards
- All critical security issues must be identified
- Performance implications should be highlighted
- Suggestions must be actionable and specific
- Maintain professional, constructive tone

## Example Scenarios
### Scenario 1: Security Review
**Input**: Pull request with authentication changes
**Expected Approach**: Analyze authentication logic, check for common vulnerabilities, verify input validation
**Output Format**: Categorized list of findings with severity levels and specific recommendations
```

### 2. API Documentation Agent
```yaml
---
name: api-documentation-writer
description: Specialized in creating comprehensive, user-friendly API documentation
tools: [Read, Write, WebFetch, Grep]
model: sonnet
---

# API Documentation Specialist

You are an expert technical writer specializing in creating clear, comprehensive API documentation that serves both developers implementing the API and consumers using it.

## Primary Responsibilities
1. Generate complete API documentation from code analysis
2. Create user-friendly examples and tutorials
3. Ensure documentation accuracy and completeness
4. Maintain consistent documentation standards

## Expertise Areas
- **API Design Patterns**: REST, GraphQL, WebSocket, gRPC
- **Documentation Formats**: OpenAPI/Swagger, Markdown, interactive docs
- **Developer Experience**: Clear examples, error handling, authentication flows
- **Technical Writing**: Clarity, completeness, accessibility

## Operational Guidelines
### Documentation Process
- Analyze source code to understand API structure
- Extract endpoint definitions, parameters, and responses
- Create practical examples for each endpoint
- Include error scenarios and troubleshooting guidance

### Content Structure
1. **Overview** - API purpose and key concepts
2. **Authentication** - How to authenticate requests
3. **Endpoints** - Complete reference with examples
4. **Error Handling** - Common errors and solutions
5. **SDKs and Libraries** - Available tools and integrations

## Quality Standards
- All endpoints must have complete parameter documentation
- Include at least one working example per endpoint
- Error responses must be documented with explanations
- Code examples should be copy-pasteable and functional

## Example Scenarios
### Scenario 1: REST API Documentation
**Input**: Express.js API with authentication endpoints
**Expected Approach**: Extract routes, analyze middleware, create comprehensive endpoint documentation
**Output Format**: Structured markdown with endpoint definitions, examples, and error handling
```

### 3. Database Migration Expert
```yaml
---
name: data-migration-expert
description: Database schema migration and data transformation specialist
tools: [Read, Write, Bash, Grep]
model: opus
---

# Database Migration Specialist

You are a database expert specializing in schema migrations, data transformations, and database optimization with deep knowledge of multiple database systems and migration strategies.

## Primary Responsibilities
1. Design and implement database schema migrations
2. Create safe, reversible migration scripts
3. Handle complex data transformations
4. Ensure data integrity throughout migration process

## Expertise Areas
- **Database Systems**: PostgreSQL, MySQL, SQLite, MongoDB, Redis
- **Migration Strategies**: Blue-green deployments, rolling migrations, zero-downtime updates
- **Data Integrity**: Constraints, validations, consistency checks
- **Performance**: Indexing strategies, query optimization, bulk operations

## Operational Guidelines
### Migration Design Process
- Analyze current schema and identify required changes
- Plan migration steps with rollback considerations
- Create validation scripts to verify data integrity
- Design for minimal downtime and maximum safety

### Safety Protocols
- Always create backup strategies
- Test migrations in staging environments
- Include rollback scripts for every migration
- Validate data consistency after each step

## Quality Standards
- All migrations must be reversible
- Include comprehensive testing instructions
- Document potential risks and mitigation strategies
- Provide performance impact estimates

## Example Scenarios
### Scenario 1: Adding New Column with Data Transformation
**Input**: Need to add user preferences column with default values based on existing data
**Expected Approach**: Create migration with data transformation logic, validation, and rollback plan
**Output Format**: Complete migration script with pre/post validation checks and rollback instructions
```

## Implementation Guide

### 1. Agent Creation Process

**Step 1: Define Agent Purpose**
1. Identify specific problem domain or task type
2. Define clear boundaries and responsibilities
3. Determine required expertise level
4. Assess appropriate agent weight classification

**Step 2: Choose Model and Tools**
1. Select appropriate model based on complexity requirements
2. Determine minimal necessary tool set
3. Consider security implications of tool access
4. Plan for future tool expansion if needed

**Step 3: Engineer System Prompt**
1. Write clear role definition
2. List specific responsibilities and expertise areas
3. Define operational guidelines and quality standards
4. Include concrete examples and scenarios
5. Specify output formats and expectations

**Step 4: Create Configuration File**
1. Choose appropriate file location (project vs user-level)
2. Write YAML frontmatter with required fields
3. Implement comprehensive system prompt
4. Save in appropriate `.claude/agents/` directory

**Step 5: Test and Iterate**
1. Test agent with typical use cases
2. Verify tool access and permissions work correctly
3. Refine system prompt based on performance
4. Optimize for efficiency and effectiveness

### 2. File Organization Structure

**Project-Level Agents** (`.claude/agents/`):
- Project-specific agents
- Shared team resources
- Version controlled with project
- Highest priority in agent selection

**User-Level Agents** (`~/.claude/agents/`):
- Personal agent library
- Reusable across projects
- Individual developer preferences
- Backup when project agents not available

### 3. Agent Invocation Methods

**Automatic Delegation**:
- Claude analyzes task context
- Matches requirements to agent descriptions
- Automatically selects and invokes appropriate agent
- Transparent to user unless explicitly mentioned

**Explicit Invocation**:
- Mention agent name directly in request
- Override automatic selection
- Force specific agent for particular task
- Useful for testing and validation

## Common Pitfalls and How to Avoid Them

### 1. Over-Generalization
**Problem**: Creating agents that try to handle too many different types of tasks
**Solution**: Follow single responsibility principle; create multiple focused agents instead of one general-purpose agent

### 2. Insufficient System Prompts
**Problem**: Vague or generic system prompts that don't provide specific guidance
**Solution**: Include concrete examples, specific quality standards, and detailed operational guidelines

### 3. Tool Over-Provisioning
**Problem**: Granting all tools to every agent for convenience
**Solution**: Apply principle of least privilege; grant only necessary tools for agent's specific function

### 4. Poor Model Selection
**Problem**: Using expensive models for simple tasks or underpowered models for complex tasks
**Solution**: Match model capability to task complexity; start with appropriate weight classification

### 5. Lack of Testing
**Problem**: Deploying agents without thorough testing across typical use cases
**Solution**: Create test scenarios and validate agent behavior before production use

### 6. Inconsistent Naming
**Problem**: Using unclear or inconsistent agent names that make selection difficult
**Solution**: Use kebab-case naming with clear, descriptive identifiers

### 7. Missing Rollback Plans
**Problem**: Creating agents that make irreversible changes without safety mechanisms
**Solution**: Include validation steps and rollback procedures in agent design

### 8. Context Pollution
**Problem**: Agents that maintain too much state or interfere with main conversation context
**Solution**: Design agents to be stateless and focused on specific task completion

## Quality Standards and Validation

### 1. Agent Quality Metrics

**Effectiveness Measures**:
- Task completion rate
- Accuracy of outputs
- Adherence to specified formats
- User satisfaction with results

**Efficiency Measures**:
- Token usage optimization
- Response time performance
- Tool usage efficiency
- Context management effectiveness

**Reliability Measures**:
- Consistent behavior across similar tasks
- Error handling robustness
- Edge case management
- Graceful failure modes

### 2. Validation Checklist

**Pre-Deployment Validation**:
1. **Configuration Syntax**: YAML frontmatter validates correctly
2. **Tool Access**: All specified tools are available and necessary
3. **System Prompt Quality**: Clear, specific, actionable instructions
4. **Example Completeness**: All major use cases covered with examples
5. **Error Handling**: Edge cases and failure modes addressed

**Post-Deployment Monitoring**:
1. **Performance Tracking**: Monitor response times and token usage
2. **Quality Assessment**: Regular review of agent outputs
3. **User Feedback**: Collect and incorporate user experience feedback
4. **Continuous Improvement**: Regular updates based on usage patterns

### 3. Testing Strategies

**Unit Testing**:
- Test individual agent responses to specific inputs
- Validate tool usage patterns
- Verify output format compliance
- Check error handling behavior

**Integration Testing**:
- Test agent interaction with project context
- Validate tool permissions and access
- Check agent selection logic
- Verify context isolation

**User Acceptance Testing**:
- Real-world task completion validation
- User workflow integration testing
- Performance under typical load
- Feedback collection and analysis

## Advanced Configuration Strategies

### 1. Agent Composition Patterns

**Workflow Chains**:
- Design agents to work together in sequences
- Output of one agent becomes input for next
- Maintain clear interfaces between agents
- Enable complex multi-step processes

**Hierarchical Delegation**:
- Create coordinator agents that delegate to specialists
- Implement decision trees for agent selection
- Enable complex task decomposition
- Maintain oversight and quality control

### 2. Dynamic Configuration

**Context-Aware Tool Selection**:
- Modify tool access based on project context
- Implement conditional tool availability
- Enable environment-specific configurations
- Support different security postures

**Adaptive System Prompts**:
- Include project-specific instructions
- Reference external configuration files
- Enable customization without agent duplication
- Support organizational standards injection

### 3. Community Integration

**Agent Sharing**:
- Design agents for community sharing
- Include comprehensive documentation
- Provide usage examples and test cases
- Enable easy customization and extension

**Collaborative Development**:
- Version control agent configurations
- Enable team collaboration on agent development
- Support agent libraries and collections
- Facilitate knowledge sharing and best practices

## Additional Resources

### 1. Official Documentation
- [Claude Code Sub-agents Documentation](https://docs.anthropic.com/en/docs/claude-code/sub-agents)
- Anthropic API Documentation
- Model capability specifications

### 2. Community Resources
- [ClaudeLog Agent Engineering](https://claudelog.com/mechanics/agent-engineering/)
- [ClaudeLog Custom Agents](https://claudelog.com/mechanics/custom-agents/)
- Community agent libraries and examples

### 3. Best Practice References
- Software engineering principles for AI systems
- Prompt engineering methodologies
- AI safety and security considerations
- Performance optimization techniques

### 4. Development Tools
- YAML validation tools
- Markdown formatting guidelines
- Testing frameworks for AI agents
- Performance monitoring solutions

---

This comprehensive guide provides the foundation for creating high-quality Claude Code agents that enhance development workflows through specialized expertise and intelligent task delegation. Follow these guidelines to build effective, efficient, and reliable agents that transform how you approach complex development challenges.
