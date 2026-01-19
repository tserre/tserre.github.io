# CPSY 1950 Course Page Setup

This directory contains the course page for CPSY 1950: Deep Learning in Brains, Minds & Machines.

## Directory Structure

```
cpsy1950/
├── index.md              # Main course page
├── papers/              # PDF files for readings and assignments
│   └── (add PDFs here)
└── README.md            # This file
```

## Data Files

Course content is managed through YAML data files in `_data/cpsy1950/`:

- **`readings.yml`** - Reading lists organized by week/topic
- **`videos.yml`** - YouTube videos and lecture materials
- **`resources.yml`** - Additional resources (tools, datasets, tutorials)
- **`schedule.yml`** - Course schedule with dates and topics
- **`assignments.yml`** - Assignment information and materials

## How to Add Content

### Adding a Reading

1. Add the PDF to `cpsy1950/papers/` (e.g., `cpsy1950/papers/paper-title.pdf`)
2. Edit `_data/cpsy1950/readings.yml` and add to the appropriate week:

```yaml
papers:
  - title: "Paper Title"
    authors: "Author 1, Author 2"
    journal: "Journal Name"
    year: 2024
    pdf: "/cpsy1950/papers/paper-title.pdf"
    url: "https://paper-url.com"  # Optional: link to journal/conference
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

1. Add assignment PDFs to `cpsy1950/papers/`
2. Edit `_data/cpsy1950/assignments.yml`:

```yaml
assignments:
  - title: "Assignment 1"
    due_date: "2025-02-01"
    description: "Assignment description"
    materials:
      - name: "Assignment PDF"
        type: "pdf"
        url: "/cpsy1950/papers/assignment1.pdf"
```

### Adding to Schedule

Edit `_data/cpsy1950/schedule.yml`:

```yaml
schedule:
  - date: "2025-01-15"
    topic: "Introduction to NeuroAI"
    readings:
      - title: "Reading Title"
        url: "/cpsy1950/papers/reading.pdf"
```

## Viewing the Page

After making changes:

1. The page will be available at: `https://thomas-serre.com/cpsy1950/`
2. To preview locally, run `bundle exec jekyll serve` (if Jekyll is set up locally)
3. The page will automatically update when you push to GitHub (if using GitHub Pages)

## Notes

- All PDFs should be placed in `cpsy1950/papers/`
- Use descriptive filenames (e.g., `serre-etal-2024-deep-learning.pdf`)
- Keep file sizes reasonable for web hosting
- The page uses Jekyll's data files, so changes to YAML files will automatically appear on the page
