// Auto-Update Manager for Azan Clock
// Checks GitHub for updates on app launch

(function() {
    const UPDATE_CHECK_URL = 'https://raw.githubusercontent.com/YOUR-USERNAME/azan-clock-updates/main/version.json';
    const CURRENT_VERSION = '1.0.0';
    
    // Check for updates on app start
    async function checkForUpdates() {
        try {
            // Only check if online
            if (!navigator.onLine) {
                console.log('Offline - skipping update check');
                return;
            }
            
            const response = await fetch(UPDATE_CHECK_URL, {
                cache: 'no-cache',
                headers: {
                    'Cache-Control': 'no-cache'
                }
            });
            
            if (!response.ok) {
                console.log('Update check failed - continuing with cached version');
                return;
            }
            
            const updateInfo = await response.json();
            
            if (compareVersions(updateInfo.version, CURRENT_VERSION) > 0) {
                console.log(`Update available: ${updateInfo.version}`);
                await downloadUpdates(updateInfo);
            } else {
                console.log('App is up to date');
            }
        } catch (error) {
            console.log('Update check error (app will work offline):', error.message);
        }
    }
    
    // Compare version strings (e.g., "1.2.3" vs "1.2.0")
    function compareVersions(v1, v2) {
        const parts1 = v1.split('.').map(Number);
        const parts2 = v2.split('.').map(Number);
        
        for (let i = 0; i < Math.max(parts1.length, parts2.length); i++) {
            const p1 = parts1[i] || 0;
            const p2 = parts2[i] || 0;
            if (p1 > p2) return 1;
            if (p1 < p2) return -1;
        }
        return 0;
    }
    
    // Download updated files
    async function downloadUpdates(updateInfo) {
        try {
            // Check if there are timing updates
            if (updateInfo.timingFiles && updateInfo.timingFiles.length > 0) {
                for (const file of updateInfo.timingFiles) {
                    await downloadTimingFile(file);
                }
            }
            
            // Check if there are audio updates
            if (updateInfo.audioFiles && updateInfo.audioFiles.length > 0) {
                for (const file of updateInfo.audioFiles) {
                    await downloadAudioFile(file);
                }
            }
            
            // Store the new version
            localStorage.setItem('app_version', updateInfo.version);
            console.log('Updates downloaded successfully');
            
            // Show notification to user if we have a UI element for it
            if (typeof showNotification === 'function') {
                showNotification('Update installed: ' + updateInfo.message);
            }
        } catch (error) {
            console.error('Error downloading updates:', error);
        }
    }
    
    // Download timing CSV files
    async function downloadTimingFile(fileInfo) {
        const url = `https://raw.githubusercontent.com/YOUR-USERNAME/azan-clock-updates/main/Timing/${fileInfo.name}`;
        const response = await fetch(url);
        const csvText = await response.text();
        
        // Store in localStorage
        localStorage.setItem(`timing_${fileInfo.name}`, csvText);
        console.log(`Downloaded timing: ${fileInfo.name}`);
    }
    
    // Download audio files (optional - can be large)
    async function downloadAudioFile(fileInfo) {
        const url = `https://raw.githubusercontent.com/YOUR-USERNAME/azan-clock-updates/main/${fileInfo.path}`;
        const response = await fetch(url);
        const blob = await response.blob();
        
        // Convert to base64 and store
        const reader = new FileReader();
        reader.onloadend = function() {
            localStorage.setItem(`audio_${fileInfo.name}`, reader.result);
            console.log(`Downloaded audio: ${fileInfo.name}`);
        };
        reader.readAsDataURL(blob);
    }
    
    // Run update check when app loads
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', checkForUpdates);
    } else {
        checkForUpdates();
    }
    
    // Check for updates every 24 hours while app is running
    setInterval(checkForUpdates, 24 * 60 * 60 * 1000);
})();
