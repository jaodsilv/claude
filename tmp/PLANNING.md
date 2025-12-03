# PLANNING

## Schemas

```yaml
job_description:
  id:
  title:
  company:
  location:
  pay_range:
  job_type:
  job_duration:
  job_description_summary:
  job_required_skills:
  job_preferred_skills:
  job_benefits:
  job_responsibilities:
  fit_score:
  resume_match:
    matching_skills:
    knowledge_gap:
      score:
      explanation:
ranked_job_descriptions:
  job_descriptions:
  fit_scores:
```

## Activities

- [X] Parse Job Description
- [X] Extract Job Description from conversation history
- [ ] Extract Knowledge Gap between Resume and Job-description
- [ ] Extract matching skills between Resume and Job-description
- [ ] Calculate Fit Score between Resume and Job-description
- [ ] Rank Job Descriptions based on Fit Score
- [ ] Respond to reach-outs, replys, and other messages
- [ ] Follow-up to Recruiters and LinkedIn contacts after an event happens
- [ ] Ping to Recruiters and LinkedIn contacts after sending a message
- [ ] Reach-out to LinkedIn contacts
- [ ] Generate traditional Cover Letter to a job posting
- [ ] Generate shorter Cover Letter for YCombinator applications
- [ ] Tailor Resume to the job I'm applying to

### Process to parse Job Description

**Input**: input and output filepaths
**Output**: Parsed Job Description in YAML format

1. Read Job Description file from input filepath
2. Classify Job Description parts:
   1. Title
   2. Company
   3. Location
   4. Pay Range (Min, Max, Average on Glassdoor)
   5. Job Type (Remote, On-site, Hybrid)
   6. Job Duration (Full-time, Part-time, Contract, Internship)
   7. Job Description summary
   8. Job Required Skills (differentiate between AND and OR conditions)
   9. Job Preferred Skills (differentiate between AND and OR conditions)
   10. Job Benefits
   11. Job Responsibilities
3. Write Output to output filepath file in YAML format

### Extract Knowledge Gap and matching skills between Resume and Job-description

**Input**: resume filepath, job description filepath, and output filepath
**Output**: Knowledge Gap and matching skills between Resume and Job-description in YAML format

- Read Resume file from resume filepath
- Read Job Description file from job description filepath
- Extract Knowledge Gap and matching skills between Resume and Job-description
- Write Output to output filepath file in YAML format


### Process to write a response to a message

1. Parse message content and context
2. If there is a Job Description
   1. Parse Job-description
   2. Calculate Fit Score between Resume and Job-description
   3. Generate response based on Fit Score and received message and extra context
3. Otherwise:
   1. Generate response based on received message and extra context
4. Calculate ideal time to send the response
5. Send the response

### Process to generate a message to reach-out to LinkedIn Contacts

1. Consider Company
2. For each job-description:
   1. Parse Job-description
   2. Calculate Fit Score between Resume and Job-description
3. Rank Job Descriptions based on Fit Score
4. Generate response based on Ranked Job Descriptions, Company name, and extra context
5. Send the message

### Process to generate a message to follow-up to Recruiters and LinkedIn contacts after an event happens and calculate the ideal time to send the message

\* Events = any activity that is not a message on LinkedIn/Email/Text, like call, interview, offer, rejection, etc.

1. Evaluate context and conversation history
2. Think of an ideal follow-up timing for the given context and history
3. Think on a message that would be more appropriate to the context
4. Send the message

### Process to generate a message to ping to Recruiters and LinkedIn contacts after sending a message and calculate the ideal time to send the message

1. Evaluate context and conversation history
2. Think of an ideal follow-up timing for the given context and history
3. Think on a message that would be more appropriate to the context and timing
4. Send the message

### Process to generate a traditional Cover Letter to a job posting

**INPUT**: Job Description filepath and resume filepath
**OUTPUT**: Cover Letter


1. Parse Job description
2. Comapre Parse Resume
2. Compare
2. Generate traditional Cover Letter to a job posting
3. Send the Cover Letter

### Process to generate a shorter Cover Letter for YCombinator applications

### Process to tailor Resume to a job position
### Process to calculate Fit Score between Resume and Job-description
### Process to rank Job Descriptions based on Fit Score

**INPUT**: List of Job Description filepaths

**OUTPUT**: List of Ranked Job Descriptions filepaths with Fit Score

1. For each Job Description filepath:
   1. Parse Job-description
   2. Calculate Fit Score between Resume and Job-description
   3. Rank Job Descriptions based on Fit Score

## Final Product

### Job Huting

#### Menssages

- [X] (P0) Easy create drafts to respond to Recruiters
- [ ] (P0) Easy create drafts to reach-out to Recruiters and LinkedIn contacts
- [ ] (P4) Easy respond to Recruiter Messages, via integrations (Gmail, LinkedIn)
- [X] (P1) Easy manage job hunting conversations, manually
- [ ] (P5) Easy manage job hunting conversations, via integrations (Gmail, LinkedIn)
- [ ] (P4) Easy messages scheduling and sending (Gmail, LinkedIn)
- [ ] (P4) Web Interface for the Job Hunting Messages Features
- [ ] (P4) Alternate between Claude API and Claude Code SDK for the Job Hunting Messages Features

#### Applications

- [ ] (P3) Easy track of all my applications, interviews, offers, rejections, etc.
- [ ] (P2) Easy tailor my resume to the job I'm applying to
- [ ] (P2) Easy tailor my cover letter to the job I'm applying to
- [ ] (P4) Web Interface for the Job Hunting Features

#### Job Hunting Integrations

- [ ] (P0) Claude Code
- [ ] (P4) Gmail Integration (Read, create drafts, send messages)
- [ ] (P4) LinkedIn Integration (Read, create drafts, and send messages)

#### Contact Management

- [ ] (P3) List Contacts by current company

### Life Management

- [ ] (P4) Easy track of all my messages, manually (Gmail, WhatsApp)
- [ ] (P5) Easy track of all my messages, via integrations (Gmail, WhatsApp)
- [ ] (P4) Easy messages scheduling and sending (Gmail, WhatsApp)
- [ ] (P3) Easy add and manage tasks and projects

#### Life Management Integrations

- [ ] (P3) Claude Code
- [ ] (P5) Gmail Integration (Read, create drafts, send messages)
- [ ] (P5) LinkedIn Integration (Read, create drafts, and send messages)
- [ ] (P5) WhatsApp Integration (Read, create drafts, and send messages)

### Carreer and Knowledge Development

- [ ] (P4) Easy create a new knowledge training
- [ ] (P5) Have an AI Carreer Coach

#### Self-Development softwares

- [ ] (P4) Easy develop new features for projects

## TODO

- [X] Create a script to download documents from URLs and save them to a specified folder
- [ ] Create a script to convert documents to markdown format
- [ ] Create a script to verify all conversions completed successfully
- [ ] Create a script to download, convert, and verify documents from URLs and save them to a specified folder
- [ ] Download and convert documents
- [ ] Run knowledge Loop
  - [ ] Create initial a python agent capable of creating agents
  - [ ] Create initial a python agent capable of creating guidelines
  - [ ] Create initial a python agent capable of comparing two versions of an agent
  - [ ] Loop
    - [ ] Read converted documents
    - [ ] Create new guidelines for creating agents
    - [ ] Create initial a python agent capable of creating agents using the new guidelines
    - [ ] Create initial a python agent capable of creating guidelines using the new guidelines
    - [ ] Create initial a python agent capable of comparing two versions of an agent using the new guidelines
    - [ ] Compare the new versions of the agents by vote of the two comparers
    - [ ] If there was an improvement, update the guidelines and agents
    - [ ] If there was no improvement, keep the old agents and guidelines
    - [ ] Repeat until the agents are stable
- [ ] Create guidelines for creating:
  - [ ] Sub-Agents
  - [ ] Custom Slash Commands
  - [ ] Output Styles
  - [ ] Workflows
- [ ] Required Agents
  - [ ] Python Agents
  - [ ] Markdown Agents
- [ ] Required Custom Slash Commands
  - [ ] With python agents
    - [ ] Create Command
    - [ ] Create Python Agent
    - [ ] Create Markdown Agent
    - [ ] Prompt Generator Agent
    - [ ] System Prompt Generator Agent
  - [ ] With markdown agents
- [ ] Design Agentic Development Process
