# Sticker Album Generator

An interactive HTML-based sticker album layout generator for creating printable reward charts and behavior tracking albums.

## Overview

This tool generates customizable sticker album pages with dynamic layouts, milestone trackers, and decorative emojis. Perfect for parents, teachers, or anyone looking to create engaging reward systems for children.

## Features

1. **Two Page Sizes**
   - Letter Size (11" × 8.5")
   - Tabloid Size (17" × 11")

2. **Dynamic Sticker Placement**
   - Bell curve distribution for varied sticker sizes (36px - 180px)
   - Intelligent collision detection
   - Automatic spacing optimization
   - Random number placement in corners

3. **Milestone Tracker**
   - Automatic milestone generation (every 10 stickers)
   - Dynamic sizing based on sticker count
   - Visual progress indicators
   - Celebration emojis

4. **Customizable Decorations**
   - 19 emoji categories (Nature, Animals, Food, Activities, etc.)
   - Adjustable emoji count and size
   - Quadrant-based distribution for balanced layouts
   - Configurable distribution intensity (Balanced/Strong/Weak)

5. **Interactive Features**
   - Click stickers to mark as collected
   - Print-friendly design
   - Real-time regeneration
   - Customizable page numbers and starting numbers

## Technology Stack

- Pure HTML5
- CSS3 (with animations and gradients)
- Vanilla JavaScript (no dependencies)

## Setup & Installation

No installation required! This is a standalone HTML file.

### Option 1: Direct Browser Opening
1. Download `sticker_album_generator.html`
2. Open it in any modern web browser (Chrome, Firefox, Safari, Edge)

### Option 2: Local Web Server
If you prefer running a local server:

```bash
# Using Python 3
python -m http.server 8000

# Using Node.js (with http-server)
npx http-server
```

Then navigate to `http://localhost:8000/sticker_album_generator.html`

## Usage Instructions

### Basic Usage

1. Open the HTML file in your web browser
2. Adjust settings using the control panel:
   - **Page Number**: Current page identifier (for multi-page albums)
   - **Start Number**: First sticker number on this page
   - **Emoji Count**: Number of decorative emojis (0-50)
   - **Emoji Size**: Size range in pixels (e.g., "16-28")
   - **Emoji Categories**: Select which emoji types to include
   - **Max Retries**: Layout generation attempts (higher = more stickers)
   - **Distribution Intensity**: How evenly emojis spread across quadrants
3. Click **Generate** to create a new layout
4. Switch between Letter and Tabloid sizes as needed
5. Print using your browser's print function (Ctrl+P / Cmd+P)

### Advanced Customization

#### Emoji Categories
Choose from 19 categories:
- Nature: Sun, moon, stars, plants
- Animals: Wide variety of creatures
- Food: Snacks and meals
- Activities: Sports, hobbies, celebrations
- Transportation: Vehicles and travel
- People: Various characters and professions
- Objects: Everyday items
- Symbols: Hearts, stars, rainbows
- Our Flags: Brazil 🇧🇷, United States 🇺🇸
- World Flags: 150+ country flags
- Fantasy: Unicorns, mermaids, dragons
- Faces: Happy expressions
- Halloween: Spooky themes
- Zodiac: Astrological signs
- Chinese Zodiac: Traditional symbols
- Christmas: Holiday themes
- Sports: Athletic activities
- Music: Musical instruments and notes

#### Distribution Intensity
- **Balanced**: Even spread across all quadrants (recommended)
- **Strong**: Heavily favors less-populated areas
- **Weak**: Allows more clustering

### Creating Multi-Page Albums

1. Generate page 1 with Start Number = 1
2. Note the ending sticker number (e.g., 30)
3. For page 2, set:
   - Page Number = 2
   - Start Number = 31 (previous end + 1)
4. Print each page
5. Repeat for additional pages

### Printing Tips

1. Use Print Preview to check layout
2. Set margins to "None" or "Minimum"
3. Ensure "Background graphics" is enabled
4. For best results, use thick paper or cardstock
5. Consider laminating for reusability (use dry-erase markers)

## Customization Guide

### Changing the Title
Edit line 476 and 495 in the HTML:
```html
<h1 class="page-title">🌟 [Your Name]'s Sticker Album 🌟</h1>
```

### Changing the Subtitle
Edit line 477 and 496:
```html
<p class="page-subtitle">Page <span id="pageNumberDisplay">1</span> - [Your Custom Text]</p>
```

### Adjusting Colors
Modify the CSS variables in the `<style>` section:
- Background gradient: Line 12
- Primary color: `#ff6b9d` (pink)
- Secondary color: `#4ecdc4` (teal)
- Accent color: `#667eea` (purple)

### Adding Custom Emojis
Edit the `emojiCategories` object (starting at line 533):
```javascript
customCategory: ['😀', '😎', '🎉', ...]
```

Don't forget to add the category to the UI (lines 367-448).

## Examples & Use Cases

1. **Behavior Charts**: Track good behavior with stickers
2. **Chore Completion**: Mark completed household tasks
3. **Reading Goals**: One sticker per book read
4. **Potty Training**: Reward successful attempts
5. **Classroom Rewards**: Teacher appreciation system
6. **Habit Tracking**: Build positive routines
7. **Collection Albums**: Track real sticker collections

## Browser Compatibility

Tested and working on:
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

**Note**: Some flag emojis may not render correctly in all browsers/operating systems.

## Known Limitations

1. Emoji rendering varies by platform
2. Very high Max Retries values (>50) may cause performance issues
3. Print scaling depends on browser print settings
4. North Korea flag (KP) may not display correctly

## Troubleshooting

**Problem**: Stickers overlap
- **Solution**: Increase Max Retries value

**Problem**: Too few stickers generated
- **Solution**: Increase Max Retries or reduce minimum sticker count expectations

**Problem**: Emojis not showing
- **Solution**: Check browser emoji support; try different categories

**Problem**: Print looks different from screen
- **Solution**: Enable background graphics in print settings

**Problem**: Category selection not working
- **Solution**: Refresh page; click Generate after changing categories

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

This is a personal hobby project. Feel free to fork and customize for your own use!

## Credits

Created as part of a personal life-hacking toolkit to make parenting rewards more fun and engaging.

## Changelog

### Version 1.0 (2025)
- Initial release
- Bell curve size distribution
- Milestone tracking system
- 19 emoji categories
- Quadrant-based emoji distribution
- Interactive sticker marking
- Two page size options
