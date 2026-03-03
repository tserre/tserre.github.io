# CPSY 1950 Course Page Setup

This directory contains the course page for CPSY 1950: Deep Learning in Brains, Minds & Machines.

## Directory Structure

```
cpsy1950/
├── index.md              # Main course page
└── README.md             # This file
```

## Data Files

Course content is managed through YAML data files in `_data/cpsy1950/`:

- **`readings.yml`** - Reading lists organized by week/topic
- **`videos.yml`** - YouTube videos and lecture materials
- **`schedule.yml`** - Course schedule with dates and topics
- **`assignments.yml`** - Assignment information and materials

## How to Add Content

### Adding a Reading

Edit `_data/cpsy1950/readings.yml` and add to the appropriate week. Use external URLs (e.g., Brown Library proxy, DOI, or publisher links):

```yaml
papers:
  - title: "Paper Title"
    authors: "Author 1, Author 2"
    journal: "Journal Name"
    year: 2024
    url: "https://paper-url.com"  # Brown Library proxy or publisher link
    notes: "Optional notes for students"
```

### Adding a YouTube Video

1. Edit `_data/cpsy1950/videos.yml`:

```yaml
videos:
  - title: "Video Title"
    description: "Description of the video"
    youtube_id: "dQw4w9WgXcQ"  # Extract from YouTube URL
    date: "2025-01-15"
```

To get the YouTube ID: From `https://youtube.com/watch?v=dQw4w9WgXcQ`, the ID is `dQw4w9WgXcQ`.

### Adding an Assignment

Edit `_data/cpsy1950/assignments.yml`:

```yaml
assignments:
  - title: "Assignment 1"
    due_date: "2025-02-01"
    description: "Assignment description"
    materials:
      - name: "Assignment PDF"
        type: "pdf"
        url: "https://example.com/assignment1.pdf"  # External URL
```

### Adding to Schedule

Edit `_data/cpsy1950/schedule.yml`:

```yaml
schedule:
  - date: "2025-01-15"
    topic: "Introduction to NeuroAI"
    readings:
      - title: "Reading Title"
        url: "https://example.com/reading.pdf"  # External URL
```

## Viewing the Page

After making changes:

1. The page will be available at: `https://thomas-serre.com/cpsy1950/`
2. To preview locally, run `bundle exec jekyll serve` (if Jekyll is set up locally)
3. The page will automatically update when you push to GitHub (if using GitHub Pages)

## Notes

- The page uses Jekyll's data files, so changes to YAML files will automatically appear on the page
- Use external URLs for readings and assignments (e.g., Brown Library proxy, Canvas, or publisher links)
