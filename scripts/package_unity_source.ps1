param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectPath,
    [Parameter(Mandatory = $true)]
    [string]$DestinationZip
)

$ErrorActionPreference = 'Stop'
$project = (Resolve-Path -LiteralPath $ProjectPath).Path
foreach ($required in @('Assets','Packages','ProjectSettings')) {
    if (-not (Test-Path -LiteralPath (Join-Path $project $required))) {
        throw "Not a Unity project: $required is missing from $project"
    }
}

$zipParent = Split-Path -Parent $DestinationZip
if ($zipParent) { New-Item -ItemType Directory -Force -Path $zipParent | Out-Null }
if (Test-Path -LiteralPath $DestinationZip) {
    throw "Destination already exists. Choose a new path or remove it explicitly: $DestinationZip"
}

$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("desktop-pet-source-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $tempRoot | Out-Null
try {
    foreach ($name in @('Assets','Packages','ProjectSettings')) {
        Copy-Item -LiteralPath (Join-Path $project $name) -Destination $tempRoot -Recurse
    }
    foreach ($optional in @('Docs','README.md','LICENSE','LICENSE.md')) {
        $path = Join-Path $project $optional
        if (Test-Path -LiteralPath $path) {
            Copy-Item -LiteralPath $path -Destination $tempRoot -Recurse
        }
    }
    Compress-Archive -Path (Join-Path $tempRoot '*') -DestinationPath $DestinationZip -CompressionLevel Optimal
    $item = Get-Item -LiteralPath $DestinationZip
    [pscustomobject]@{
        Path = $item.FullName
        Bytes = $item.Length
        SHA256 = (Get-FileHash -LiteralPath $item.FullName -Algorithm SHA256).Hash
    }
}
finally {
    if (Test-Path -LiteralPath $tempRoot) {
        Remove-Item -LiteralPath $tempRoot -Recurse -Force
    }
}
