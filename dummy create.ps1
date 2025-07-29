# --- Target DLL delete from System32 (Recycle Bin bypass) ---
$targetDll = "C:\Windows\System32\Neck_F8_Free.dll"

if (Test-Path $targetDll) {
    try {
        # সরাসরি delete (Recycle Bin bypass)
        Remove-Item -Path $targetDll -Force
        Write-Host "Deleted: $targetDll (permanently)"
    }
    catch {
        Write-Warning "Failed to delete $targetDll : $_"
    }
}
else {
    Write-Host "Target DLL not found: $targetDll"
}
