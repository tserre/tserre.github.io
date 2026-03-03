# CPSY 1950 Quick Start Guide

## File Locations

- **Course Page**: `cpsy1950/index.md`
- **Data Files**: `_data/cpsy1950/` (edit these to update content)

## Course Structure (Sidebar Navigation)

The course uses a sidebar navigation defined in `_data/cpsy1950/structure.yml`, with links to the main course page sections (overview, schedule, readings, assignments), syllabus, and outline.

## Quick Actions

### Add a Reading
1. Edit `_data/cpsy1950/readings.yml` - add to the appropriate week's `papers:` list with an external URL (e.g., Brown Library proxy)

### Add a YouTube Video
1. Get YouTube ID from URL (e.g., `dQw4w9WgXcQ` from `https://youtube.com/watch?v=dQw4w9WgXcQ`)
2. Edit `_data/cpsy1950/videos.yml` - add new entry to `videos:` list

### Add an Assignment
1. Edit `_data/cpsy1950/assignments.yml` - add to `assignments:` list with external URL (e.g., Canvas)

### Update Schedule
Edit `_data/cpsy1950/schedule.yml` - add entries to `schedule:` list

## View Your Changes

The page will be at: `https://thomas-serre.com/cpsy1950/`

After pushing to GitHub, GitHub Pages will automatically rebuild the site.

## Example: Adding a Reading

```yaml
# In _data/cpsy1950/readings.yml
readings:
  - week: 1
    topic: "Introduction"
    papers:
      - title: "Your Paper Title"
        authors: "Author Name"
        journal: "Journal Name"
        year: 2024
        url: "https://paper-url.com"  # Brown Library proxy or publisher link
```

## Example: Adding a YouTube Video

```yaml
# In _data/cpsy1950/videos.yml
videos:
  - title: "Lecture 1: Introduction"
    description: "Overview of the course"
    youtube_id: "dQw4w9WgXcQ"  # From https://youtube.com/watch?v=dQw4w9WgXcQ
```
