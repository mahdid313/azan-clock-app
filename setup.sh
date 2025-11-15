#!/bin/bash

# Azan Clock - Quick Setup Script
# This script helps you set up the project for the first time

echo "🕌 Azan Clock - Quick Setup"
echo "=============================="
echo ""

# Check Node.js
echo "Checking Node.js..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found!"
    echo "   Please install Node.js from: https://nodejs.org"
    echo "   Then run this script again."
    exit 1
fi

echo "✅ Node.js found: $(node --version)"
echo ""

# Check npm
echo "Checking npm..."
if ! command -v npm &> /dev/null; then
    echo "❌ npm not found!"
    exit 1
fi

echo "✅ npm found: $(npm --version)"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
echo "   (This may take a few minutes...)"
npm install --break-system-packages

if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully!"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo ""
echo "🔄 Syncing Capacitor files..."
npm run sync

if [ $? -eq 0 ]; then
    echo "✅ Project synced successfully!"
else
    echo "❌ Failed to sync project"
    exit 1
fi

echo ""
echo "=============================="
echo "✅ Setup Complete!"
echo "=============================="
echo ""
echo "Next steps:"
echo ""
echo "1. Replace placeholder audio files:"
echo "   - www/Azan/ (5 MP3 files)"
echo "   - www/Duas/ (26 MP3 files)"
echo "   - www/Tasbeeh/ (4 MP3 files)"
echo ""
echo "2. Add your prayer timing CSVs:"
echo "   - www/Timing/ folder"
echo ""
echo "3. Build the APK:"
echo "   npm run build"
echo ""
echo "4. Find your APK at:"
echo "   android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "For detailed instructions, see:"
echo "  - BUILD_INSTRUCTIONS.md"
echo "  - README.md"
echo ""
echo "Happy building! 🚀"
