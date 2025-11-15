# 🕌 Azan Clock - Transform Old Phones into Prayer Clocks

A full-screen, 24/7 Islamic prayer time display app built with Capacitor. Turn any old Android phone into a dedicated prayer clock with automatic azan playback, scheduled duas, and periodic tasbeeh reminders.

---

## ✨ Features

### Core Display
- ✅ Live clock with date display
- ✅ Prayer times (Fajr, Sunrise, Zohr, Maghrib)
- ✅ Countdown to next prayer
- ✅ Tomorrow's prayer times (after Maghrib)
- ✅ Battery indicator

### Audio System
- ✅ Automatic azan playback at prayer times
- ✅ 26 scheduled duas (daily, weekly, Kumayl, Nudba, etc.)
- ✅ Periodic tasbeeh reminders
- ✅ Independent volume controls for each type
- ✅ Smart priority system (Azan > Duas > Tasbeeh)

### Customization
- ✅ 3 color themes (Green, Blue, Purple)
- ✅ Light/Dark mode
- ✅ Font size options (S/M/L/XL)
- ✅ 12/24 hour format
- ✅ Screen brightness control
- ✅ Auto-dim at night

### Technical
- ✅ Works 100% offline after first launch
- ✅ Auto-updates from GitHub
- ✅ Screen always on (wake lock)
- ✅ Landscape orientation locked
- ✅ Fullscreen mode
- ✅ Works on Android 5.0+

---

## 🚀 Quick Start

### 1. Install Dependencies

```bash
npm install
```

### 2. Replace Placeholder Audio

Copy your real MP3 files to:
- `src/Azan/` (5 files)
- `src/Duas/` (26 files)
- `src/Tasbeeh/` (4 files)

### 3. Build APK

```bash
npm run build
```

Output: `android/app/build/outputs/apk/debug/app-debug.apk`

**See `BUILD_INSTRUCTIONS.md` for detailed steps.**

---

## 📖 Documentation

- **BUILD_INSTRUCTIONS.md** - How to build and modify
- **UPDATE_SYSTEM.md** - Setting up auto-updates
- **USER_GUIDE.md** - For end users

---

## 📦 What's Included

- ✅ Complete Capacitor project
- ✅ Your HTML app integrated
- ✅ 35 placeholder MP3 files
- ✅ Sample prayer timing CSV
- ✅ Auto-update system
- ✅ Comprehensive documentation

---

## 🔄 Update System

Users get new prayer timings automatically via GitHub:
1. Upload new CSV to GitHub
2. Update version.json
3. Users auto-update on next launch

**See UPDATE_SYSTEM.md for setup.**

---

## 🛠️ Making Changes

All code is in `src/index.html`:
1. Edit the HTML file
2. Test in browser
3. Run `npm run build`
4. Install new APK

---

## 📱 Requirements

- Node.js 16+
- Android Studio
- Android 5.0+ device

---

**Built with ❤️ for the Muslim community**
