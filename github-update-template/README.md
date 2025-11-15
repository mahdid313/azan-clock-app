# GitHub Update Repository Template

## What to Upload to GitHub

Upload these files to your `azan-clock-updates` repository:

### 1. version.json (Root)
Controls updates. Edit to add new timing files.

### 2. Timing/ folder
Contains CSV files with prayer times.

---

## Setup Instructions

1. Create GitHub repository: `azan-clock-updates`
2. Upload `version.json` to root
3. Create `Timing/` folder
4. Upload CSV files to `Timing/`
5. Update your app's URL in `src/index.html`:
   ```javascript
   const updateURL = 'https://raw.githubusercontent.com/YOUR_USERNAME/azan-clock-updates/main/version.json';
   ```

---

## Adding New Timings

1. Upload new CSV to `Timing/` folder
2. Edit `version.json`:
   - Increment version number
   - Add CSV to `timings` array
   - Update message
3. Commit changes

Users will get updates automatically!

---

## CSV Format

```csv
Date,Fajr,Sunrise,Zohr,Maghrib
01/01/2025,06:15,08:06,12:08,16:03
02/01/2025,06:15,08:06,12:09,16:04
```

**Required columns:** Date, Fajr, Sunrise, Zohr, Maghrib  
**Date format:** DD/MM/YYYY  
**Time format:** HH:MM (24-hour)
