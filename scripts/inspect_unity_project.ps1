param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectPath,
    [string]$OutputPath
)

$ErrorActionPreference = 'Stop'
$resolved = (Resolve-Path -LiteralPath $ProjectPath).Path
if (-not (Test-Path -LiteralPath (Join-Path $resolved 'Assets'))) {
    throw "Not a Unity project: Assets is missing from $resolved"
}
if (-not (Test-Path -LiteralPath (Join-Path $resolved 'ProjectSettings'))) {
    throw "Not a Unity project: ProjectSettings is missing from $resolved"
}

$scripts = @(Get-ChildItem -LiteralPath (Join-Path $resolved 'Assets') -Filter '*.cs' -File -Recurse)
$scenes = @(Get-ChildItem -LiteralPath (Join-Path $resolved 'Assets') -Filter '*.unity' -File -Recurse)
$tests = @($scripts | Where-Object { $_.FullName -match '[\\/]Tests?[\\/]' -or $_.Name -match 'Tests?\.cs$' })
$largeAssets = @(Get-ChildItem -LiteralPath (Join-Path $resolved 'Assets') -File -Recurse | Where-Object Length -gt 10485760 | Sort-Object Length -Descending)
$cacheDirs = @('Library','Temp','Logs','obj') | ForEach-Object {
    [pscustomobject]@{ Name = $_; Present = Test-Path -LiteralPath (Join-Path $resolved $_) }
}
$versionFile = Join-Path $resolved 'ProjectSettings\ProjectVersion.txt'
$unityVersion = if (Test-Path -LiteralPath $versionFile) {
    (Select-String -LiteralPath $versionFile -Pattern '^m_EditorVersion:\s*(.+)$').Matches.Groups[1].Value
} else { 'unknown' }

$lines = @(
    'Unity project readiness report',
    "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')",
    "Project: $resolved",
    "Unity: $unityVersion",
    "C# scripts: $($scripts.Count)",
    "Scenes: $($scenes.Count)",
    "Test scripts: $($tests.Count)",
    "Assets over 10 MiB: $($largeAssets.Count)",
    '',
    'Cache directories (exclude from source archive):'
)
$lines += $cacheDirs | ForEach-Object { "- $($_.Name): $($_.Present)" }
$lines += ''
$lines += 'Large assets:'
$lines += if ($largeAssets.Count) {
    $largeAssets | ForEach-Object { "- $([math]::Round($_.Length / 1MB, 2)) MiB | $($_.FullName.Substring($resolved.Length + 1))" }
} else { '- none' }

if ($OutputPath) {
    $parent = Split-Path -Parent $OutputPath
    if ($parent) { New-Item -ItemType Directory -Force -Path $parent | Out-Null }
    $lines | Set-Content -LiteralPath $OutputPath -Encoding UTF8
}
$lines
