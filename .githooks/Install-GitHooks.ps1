<#
    .SYNOPSIS
    Enables the repository's tracked Git hooks for the current clone.

    .DESCRIPTION
    Locates the repository root and configures the local core.hooksPath setting to
    use the tracked .githooks directory. The setting affects only the current clone.

    .EXAMPLE
    .\.githooks\Install-GitHooks.ps1

    Configures Git to run the hooks stored in .githooks.

    .OUTPUTS
    None.
#>

[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repositoryRoot = git rev-parse --show-toplevel 2>$null

if ($LASTEXITCODE -ne 0) {
    throw 'Run this script from inside the Git repository.'
}

Push-Location $repositoryRoot

try {
    git config --local core.hooksPath .githooks

    if ($LASTEXITCODE -ne 0) {
        throw 'Failed to configure the Git hooks path.'
    }

    Write-Host 'Git hooks installed. Commit messages will use the Angular convention.' -ForegroundColor Green
}
finally {
    Pop-Location
}
