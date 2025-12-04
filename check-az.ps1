# Script para localizar e executar az --version
if (Get-Command az -ErrorAction SilentlyContinue) {
    Write-Output "FOUND_CMD: $(Get-Command az).Path"
    az --version
} else {
    $paths = @("C:\Program Files","C:\Program Files (x86)")
    $found = $null
    foreach ($p in $paths) {
        try {
            $found = Get-ChildItem -Path $p -Filter "az.exe","az.cmd" -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
            if ($found) { break }
        } catch { }
    }

    if ($found) {
        Write-Output "FOUND_FILE: $($found.FullName)"
        & "$($found.FullName)" --version
    } else {
        Write-Output "NOT_FOUND"
    }
}
