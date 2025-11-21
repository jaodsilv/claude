# Plugin Inventory

This directory contains the results of plugin discovery from all sources.

## Files

- **raw-inventory.json** - Initial automated discovery output
- **categorized-inventory.json** - Plugins organized into functional categories
- **final-inventory.json** - Curated list after deduplication and filtering

## Inventory Process

1. Run curator agent on all 6 marketplaces
2. Run curator agent on all 6 external-resources submodules
3. Merge results into `raw-inventory.json`
4. Categorize plugins by functionality
5. Apply quality filters and deduplicate
6. Generate `final-inventory.json`
