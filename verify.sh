#!/bin/bash

# Azan Clock - Pre-Build Verification Script
# Checks if all required files are in place before building

echo "🕌 Azan Clock - Pre-Build Verification"
echo "========================================"
echo ""

ERRORS=0
WARNINGS=0

# Function to check if file exists and is larger than placeholder size
check_file() {
    local file=$1
    local min_size=2048  # 2KB minimum (placeholders are 1KB)
    
    if [ ! -f "$file" ]; then
        echo "❌ MISSING: $file"
        ((ERRORS++))
        return 1
    fi
    
    local size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
    if [ "$size" -lt "$min_size" ]; then
        echo "⚠️  WARNING: $file is too small (${size} bytes) - might be placeholder"
        ((WARNINGS++))
        return 2
    fi
    
    echo "✅ OK: $file (${size} bytes)"
    return 0
}

echo "Checking Azan files..."
echo "----------------------"
check_file "www/Azan/Kadhmain.mp3"
check_file "www/Azan/Karbala.mp3"
check_file "www/Azan/Mashhad.mp3"
check_file "www/Azan/Najaf.mp3"
check_file "www/Azan/Qom.mp3"
echo ""

echo "Checking Duas files..."
echo "----------------------"
check_file "www/Duas/dua-ahad.mp3"
check_file "www/Duas/Dua for Friday.mp3"
check_file "www/Duas/Dua for Monday.mp3"
check_file "www/Duas/Dua for Saturday.mp3"
check_file "www/Duas/Dua for Sunday.mp3"
check_file "www/Duas/Dua for Thursday.mp3"
check_file "www/Duas/Dua for Tuesday.mp3"
check_file "www/Duas/Dua for Wednesday.mp3"
check_file "www/Duas/Dua_Faraj.mp3"
check_file "www/Duas/Dua_Iftitah.mp3"
check_file "www/Duas/dua_kumayl.mp3"
check_file "www/Duas/dua_mashlool.mp3"
check_file "www/Duas/dua_mujeer.mp3"
check_file "www/Duas/Dua_Nudba.mp3"
check_file "www/Duas/dua_sabah.mp3"
check_file "www/Duas/dua_samaat.mp3"
check_file "www/Duas/dua_tawassul.mp3"
check_file "www/Duas/dua_yastasheer.mp3"
check_file "www/Duas/Juz 30.mp3"
check_file "www/Duas/Surah Mulk.mp3"
check_file "www/Duas/Surah Rahman.mp3"
check_file "www/Duas/Surah Waqiah.mp3"
check_file "www/Duas/Surah Yaseen.mp3"
check_file "www/Duas/Tasbihaat alAshar.mp3"
check_file "www/Duas/Ziyarat Jamia Kabeer.mp3"
check_file "www/Duas/Ziyarat_Ashura.mp3"
echo ""

echo "Checking Tasbeeh files..."
echo "-------------------------"
check_file "www/Tasbeeh/Alhamdulillah.mp3"
check_file "www/Tasbeeh/Salawat.mp3"
check_file "www/Tasbeeh/Subhanallah.mp3"
check_file "www/Tasbeeh/Takbeer.mp3"
echo ""

echo "Checking Timing files..."
echo "------------------------"
if [ ! -f "www/Timing/Hujjat_Stanmore.csv" ]; then
    echo "❌ MISSING: www/Timing/Hujjat_Stanmore.csv"
    ((ERRORS++))
else
    echo "✅ OK: www/Timing/Hujjat_Stanmore.csv"
fi

# Check for additional timing files
timing_count=$(ls -1 www/Timing/*.csv 2>/dev/null | wc -l)
echo "   Found $timing_count timing CSV file(s)"
echo ""

echo "Checking core files..."
echo "----------------------"
if [ ! -f "www/index.html" ]; then
    echo "❌ MISSING: www/index.html"
    ((ERRORS++))
else
    echo "✅ OK: www/index.html"
fi

if [ ! -f "www/update-manager.js" ]; then
    echo "❌ MISSING: www/update-manager.js"
    ((ERRORS++))
else
    echo "✅ OK: www/update-manager.js"
fi
echo ""

echo "Checking configuration..."
echo "-------------------------"
if [ ! -f "capacitor.config.json" ]; then
    echo "❌ MISSING: capacitor.config.json"
    ((ERRORS++))
else
    echo "✅ OK: capacitor.config.json"
fi

if [ ! -f "package.json" ]; then
    echo "❌ MISSING: package.json"
    ((ERRORS++))
else
    echo "✅ OK: package.json"
fi
echo ""

echo "========================================"
echo "Verification Complete"
echo "========================================"
echo ""

if [ $ERRORS -gt 0 ]; then
    echo "❌ ERRORS: $ERRORS critical file(s) missing!"
    echo "   Cannot build APK. Please fix the errors above."
    echo ""
    exit 1
fi

if [ $WARNINGS -gt 0 ]; then
    echo "⚠️  WARNINGS: $WARNINGS file(s) might still be placeholders"
    echo "   You can build, but audio might not work properly."
    echo "   Replace placeholder files with real audio before distributing."
    echo ""
    
    read -p "Continue with build anyway? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Build cancelled."
        exit 1
    fi
fi

echo "✅ All checks passed!"
echo ""
echo "Ready to build. Run:"
echo "  npm run build"
echo ""
