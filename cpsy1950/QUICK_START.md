# CPSY 1950 Quick Start Guide

## File Locations

- **Course Page**: `cpsy1950/index.md`
- **Lesson Pages**: `cpsy1950/lesson1/`, `cpsy1950/lesson2/`, etc.
- **PDFs**: `cpsy1950/papers/` (add PDFs here)
- **Data Files**: `_data/cpsy1950/` (edit these to update content)

## Course Structure (Sidebar Navigation)

The course uses a sidebar navigation similar to fast.ai, organized by **Parts** and **Lessons**.

### Add a New Lesson

1. **Create the lesson directory and page:**
   ```bash
   mkdir -p cpsy1950/lesson6
   # Create cpsy1950/lesson6/index.md
   ```

2. **Add the lesson to the structure:**
   Edit `_data/cpsy1950/structure.yml`:
   ```yaml
   parts:
     - id: part1
       title: "Part 1"
       lessons:
         - number: 6
           title: "Your Lesson Title"
           url: "/cpsy1950/lesson6/"
           description: "Lesson description"
   ```

3. **Create the lesson page** (`cpsy1950/lesson6/index.md`):
   ```markdown
   ---
   layout: course-sidebar
   title: Lesson 6: Your Lesson Title
   subtitle: Part 1
   ---
   
   ## Overview
   Your lesson content here...
   ```

### Add a New Part

Edit `_data/cpsy1950/structure.yml` and add a new part:
```yaml
parts:
  - id: part2
    title: "Part 2"
    description: "Advanced Topics"
    lessons:
      - number: 7
        title: "New Lesson"
        url: "/cpsy1950/lesson7/"
```

## Quick Actions

### Add a Reading
1. Put PDF in `cpsy1950/papers/your-paper.pdf`
2. Edit `_data/cpsy1950/readings.yml` - add to the appropriate week's `papers:` list

### Add a YouTube Video
1. Get YouTube ID from URL (e.g., `dQw4w9WgXcQ` from `https://youtube.com/watch?v=dQw4w9WgXcQ`)
2. Edit `_data/cpsy1950/videos.yml` - add new entry to `videos:` list
3. Link to a lesson by adding `lesson: 1` (or lesson number)

### Add an Assignment
1. Put PDF in `cpsy1950/papers/assignment.pdf`
2. Edit `_data/cpsy1950/assignments.yml` - add to `assignments:` list

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
        pdf: "/cpsy1950/papers/your-paper.pdf"
        url: "https://paper-url.com"
```

## Example: Adding a YouTube Video

```yaml
# In _data/cpsy1950/videos.yml
videos:
  - title: "Lecture 1: Introduction"
    description: "Overview of the course"
    youtube_id: "dQw4w9WgXcQ"  # From https://youtube.com/watch?v=dQw4w9WgXcQ
    lesson: 1  # Optional: link to lesson number
```
