# 🔨 BUILD INSTRUCTIONS - Azan Clock

## Prerequisites

Before building, ensure you have:
- **Node.js** (v16 or higher) - Download from https://nodejs.org
- **Android Studio** - Download from https://developer.android.com/studio
- **Java JDK** (v17 or higher) - Usually included with Android Studio

---

## 📦 Initial Setup (One-Time)

### 1. Install Dependencies

Open a terminal in the project folder and run:

```bash
npm install
```

This installs all required packages (~50MB, takes 2-3 minutes).

### 2. Verify Android SDK

Open Android Studio:
- Go to **Tools** → **SDK Manager**
- Ensure **Android SDK 31+** is installed
- Note your SDK path (e.g., `C:\Users\YourName\AppData\Local\Android\Sdk`)

---

## 🎵 Adding Your Real Audio Files

### Replace Placeholder MP3s

1. Navigate to `src/` folder
2. Replace placeholder MP3s in these folders:
   - `Azan/` - Replace 5 files (Kadhmain.mp3, Karbala.mp3, etc.)
   - `Duas/` - Replace 26 files (dua-ahad.mp3, Dua for Friday.mp3, etc.)
   - `Tasbeeh/` - Replace 4 files (Alhamdulillah.mp3, Salawat.mp3, etc.)

**Important:** Keep the exact same filenames!

### Add Prayer Timing CSVs

1. Add your CSV files to `src/Timing/` folder
2. CSV format must be:
```csv
Date,Fajr,Sunrise,Zohr,Maghrib
01/01/2025,06:15,08:06,12:08,16:03
```

---

## 🏗️ Building the APK

### Option 1: Command Line (Recommended)

```bash
npm run build
```

**Output:** `android/app/build/outputs/apk/debug/app-debug.apk`

### Option 2: Android Studio

1. Run: `npm run open-android`
2. Click **Build** → **Build APK(s)**
3. Wait 3-5 minutes
4. Find APK in: `android/app/build/outputs/apk/debug/`

---

## 📲 Installing the APK

### Direct Install on Phone

1. Copy APK to phone
2. Open file manager and tap the APK
3. Allow "Install from Unknown Sources" if prompted
4. Tap "Install"

---

## 🐛 Making Updates

### 1. Edit HTML

Open `src/index.html` and make changes

### 2. Update Version

Find and change:
```javascript
const currentVersion = '1.0.0';  // Change to '1.0.1'
```

### 3. Rebuild

```bash
npm run build
```

---

## 📋 Common Issues

**Gradle build failed:** Delete `android/.gradle` and rebuild

**SDK not found:** Open Android Studio to download SDK

**Out of memory:** Add to `android/gradle.properties`:
```
org.gradle.jvmargs=-Xmx4096m
```

---

## ⚡ Quick Reference

| Command | Purpose |
|---------|---------|
| `npm install` | Install dependencies |
| `npm run build` | Build APK |
| `npm run sync` | Sync changes |
| `npm run open-android` | Open Android Studio |
