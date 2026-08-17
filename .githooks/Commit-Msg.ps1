<#
    .SYNOPSIS
    Validates a Git commit message against the Angular commit convention.

    .DESCRIPTION
    Reads the first line of the commit message file supplied by Git and verifies
    that it uses an allowed type, an optional scope, and a lowercase description.
    Git-generated merge, revert, fixup, and squash messages are accepted.

    .PARAMETER MessageFile
    The path to the temporary commit message file supplied to the commit-msg hook.

    .EXAMPLE
    .\.githooks\Commit-Msg.ps1 -MessageFile .git\COMMIT_EDITMSG

    Validates the current Git commit message file.

    .OUTPUTS
    None. The script exits with code 0 for a valid message and code 1 otherwise.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$MessageFile
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$header = Get-Content -LiteralPath $MessageFile -First 1

if ([string]::IsNullOrWhiteSpace($header)) {
    Write-Error 'Commit message cannot be empty.' -ErrorAction Continue
    exit 1
}

if ($header -match '^(Merge |Revert "|fixup! |squash! )') {
    exit 0
}

$allowedTypes = @(
    'build'
    'chore'
    'ci'
    'docs'
    'feat'
    'fix'
    'perf'
    'refactor'
    'revert'
    'style'
    'test'
)
$allowedTypesPattern = ($allowedTypes | ForEach-Object { [regex]::Escape($_) }) -join '|'
$headerPattern = "^($allowedTypesPattern)(\([a-z0-9][a-z0-9._/-]*\))?!?: [a-z0-9](.*[^.])?$"

if ($header.Length -gt 100) {
    Write-Error "Commit header must be 100 characters or fewer (found $($header.Length))." -ErrorAction Continue
    exit 1
}

if ($header -cnotmatch $headerPattern) {
    Write-Host 'Commit message must follow the Angular convention:' -ForegroundColor Red
    Write-Host '  type(optional-scope): lowercase description' -ForegroundColor Yellow
    Write-Host '  type(optional-scope)!: lowercase breaking-change description' -ForegroundColor Yellow
    Write-Host ''
    Write-Host "Allowed types: $($allowedTypes -join ', ')"
    Write-Host 'Examples:'
    Write-Host '  feat(workflows): add reusable validation'
    Write-Host '  fix: handle missing input'
    Write-Host '  refactor(api)!: remove deprecated parameter'
    exit 1
}

exit 0
