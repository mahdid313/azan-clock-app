# 🔄 AUTO-UPDATE SYSTEM - Azan Clock

## How It Works

Your app checks GitHub for updates on every launch:
- Downloads new prayer timing CSVs automatically
- Shows notification when updates install
- Works completely in the background
- No user action required

---

## 📁 Setup GitHub Repository

### 1. Create GitHub Account

Go to https://github.com and sign up (free).

### 2. Create Update Repository

1. Click **New Repository**
2. Name: `azan-clock-updates`
3. Set to **Public**
4. Click **Create**

### 3. Create Files

Click **Add file** → **Create new file** and add these:

#### `version.json`
```json
{
  "version": "1.0.1",
  "message": "Added new prayer timings for Birmingham",
  "timings": [
    {
      "name": "Birmingham_2025.csv",
      "url": "https://raw.githubusercontent.com/YOUR_USERNAME/azan-clock-updates/main/Timing/Birmingham_2025.csv"
    },
    {
      "name": "Manchester_2025.csv",
      "url": "https://raw.githubusercontent.com/YOUR_USERNAME/azan-clock-updates/main/Timing/Manchester_2025.csv"
    }
  ]
}
```

#### `Timing/Hujjat_Stanmore.csv`
```csv
Date,Fajr,Sunrise,Zohr,Maghrib
01/01/2025,06:15,08:06,12:08,16:03
02/01/2025,06:15,08:06,12:09,16:04
...
```

---

## 🔗 Configure Your App

### 1. Update URL in Your App

Edit `src/index.html` and find this line (~line 1787):

```javascript
const updateURL = 'https://raw.githubusercontent.com/YOUR_USERNAME/azan-clock-updates/main/version.json';
```

Replace `YOUR_USERNAME` with your actual GitHub username.

### 2. Rebuild APK

```bash
npm run build
```

Now your app will check for updates!

---

## 📤 Pushing Updates

### Adding New Prayer Timings

1. Go to your GitHub repository
2. Click **Add file** → **Upload files**
3. Upload new CSV to `Timing/` folder
4. Edit `version.json`:
   - Increment version: `1.0.1` → `1.0.2`
   - Add CSV to `timings` array
   - Add descriptive message
5. Click **Commit changes**

**Done!** All users will get the update on next app launch.

---

## 🐛 Pushing Bug Fixes

### For HTML/JS Changes

Bug fixes in your HTML require users to reinstall the APK:

1. Fix the bug in `src/index.html`
2. Update version in HTML: `const currentVersion = '1.0.2'`
3. Rebuild: `npm run build`
4. Upload new APK somewhere (Google Drive, Dropbox, etc.)
5. Share download link with users

**Note:** Future update system could download HTML updates too, but requires more setup.

---

## 📊 Example Update Workflow

### Scenario: Adding London Prayer Times

1. **Create CSV:** `London_2025.csv`
2. **Upload to GitHub:** `Timing/London_2025.csv`
3. **Update version.json:**
```json
{
  "version": "1.0.2",
  "message": "Added London 2025 prayer times",
  "timings": [
    {
      "name": "London_2025.csv",
      "url": "https://raw.githubusercontent.com/YOUR_USERNAME/azan-clock-updates/main/Timing/London_2025.csv"
    }
  ]
}
```
4. **Commit changes**
5. **Users auto-update** on next app launch

---

## 🔍 Monitoring Updates

### Check If Users Got Update

Users will see a notification: "Update 1.0.2 installed! Added London 2025 prayer times"

### Test Updates Yourself

1. Install app on test device
2. Close app completely
3. Push update to GitHub
4. Reopen app
5. Should see update notification

---

## 📋 Update Best Practices

### Version Numbering

- **1.0.X** - New timings, minor changes
- **1.X.0** - New features
- **X.0.0** - Major changes

### Message Guidelines

Be descriptive:
- ❌ "Update available"
- ✅ "Added Birmingham & Manchester 2025 timings"

### Testing

Always test updates before committing:
1. Create test repository
2. Point app to test repo
3. Verify update works
4. Then update production repository

---

## 🚀 Advanced: Hosting Alternatives

### GitHub (Recommended)
- **Pros:** Free, reliable, easy
- **Cons:** Public repository

### Dropbox
Update URL format:
```
https://dl.dropboxusercontent.com/s/SHARE_ID/version.json
```

### Google Drive
Requires public sharing link

### Your Own Server
Any web server works - just host the files!

---

## 🔐 Security Note

The update system is read-only:
- Users can only download files
- No code execution from updates
- Only CSV files are auto-downloaded
- Safe for public repositories

---

## 💡 Future Enhancements

Possible improvements:
- Download HTML updates (full app updates without reinstall)
- Download new audio files
- Selective updates based on user location
- Update statistics/analytics

---

## ⚡ Quick Reference

| Action | Steps |
|--------|-------|
| Add timing | Upload CSV → Update version.json → Commit |
| Fix bug | Edit HTML → Rebuild APK → Share new APK |
| Test update | Use test repository → Verify → Update prod |

---

**Your update system is ready! Users will automatically receive new prayer timings as you add them to GitHub.**
