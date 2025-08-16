---
allowed-tools: Read, Task, TodoWrite, Write, LS, Grep, Glob, Edit
description: Downloads a document from a URL or a list of URLs
argument-hint: output-path: <output-folder> file-existing-mode: <file-existing-mode> url: <url> filename: <output-filename>
---

## Context

- Arguments: <arguments>$ARGUMENTS</arguments>
- Purpose: <purpose>Download documents from URLs and save them to a specified folder.</purpose>
- Parameters Schema: <schema>@.claude/shared/schemas/commands/docs/download.yml</schema>
- Default Paremeters Values: <defaults>@.claude/shared/schemas/commands/docs/download.defaults.yml</defaults>
- Template Prompt for sub-agent: <batch-download-template>@.claude/shared/templates/commands/docs/download/batch.md</batch-download-template>
- sub-agents: <sub-agent>@docs:batch-download-manager</sub-agent>

## Usage

```yaml
/docs:download
  <<: *download-arguments-defaults
  output-path: <output-folder>
  file-existing-mode: <file-existing-mode>
  urls:
    - url: <url-1>
      filename: <output-filename-1>
    - url: <url-2>
      filename: <output-filename-2>
    ...
    - url: <url-n>
      filename: <output-filename-n>
```

OR

```yaml
/docs:download
  <<: *download-arguments-defaults
  output-path: <output-folder>
  file-existing-mode: <file-existing-mode>
  url: <url>
  filename: <output-filename>
```

## Execution

1. Parse arguments considering it as a yaml object and assign its values to variables of the same names
2. Organize the urls: Group the urls by domain and assign them to the variable `$urls-by-domain`
3. <foreach $domain, $urls in $urls-by-domain>	
  1. Fill the template <batch-download-template> replacing the placeholders:
    - {{urls}} with the values of the variables `$urls` or `[(url: $url, filename: $filename, notes: $notes)]`
    - {{output-path}} with the value of the variable `$output-path`
    - {{file-existing-mode}} with the value of the variable `$file-existing-mode`
  2. Launch an async Task using the filled template as a prompt to the sub-agent <sub-agent>@docs:batch-downloader</sub-agent>
4. </foreach>
5. Wait for all Tasks to complete
