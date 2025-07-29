# --- সব running process এর dummy file তৈরি (extension .temp) ---
$processes = Get-Process | Select-Object -Unique -Property ProcessName
$tempPath = $env:TEMP

foreach ($p in $processes) {
    $fileName = "$($p.ProcessName).temp"
    $filePath = Join-Path $tempPath $fileName

    # dummy content তৈরি
    "Dummy shortcut for process $($p.ProcessName)" | Out-File -FilePath $filePath -Encoding UTF8 -Force
}

# --- Temp ফোল্ডারের সব DLL ফাইলের extension পরিবর্তন (.temp) ---
Get-ChildItem -Path $tempPath -Filter *.dll -File | ForEach-Object {
    $newName = "$($_.BaseName).temp"
    Rename-Item -Path $_.FullName -NewName $newName -Force
}

# --- Specific DLL delete (Recycle Bin থেকেও) ---
$targetDll = Join-Path $tempPath "Neck F8 Free.dll"
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

Write-Host "Dummy files created, DLL extensions changed, and Neck F8 Free.dll deleted permanently."
