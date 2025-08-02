# Kill explorer.exe
Stop-Process -Name explorer -Force

# Wait for a moment to ensure it’s stopped
Start-Sleep -Seconds 2

# Start explorer.exe again
Start-Process explorer.exe
