[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $true)]
    [string]$TargetPath
)

$ErrorActionPreference = 'Stop'

$sourceRoot = Split-Path -Parent $PSScriptRoot
$sourceAgentsFile = Join-Path $sourceRoot 'AGENTS.md'
$sourceSkill = Join-Path $sourceRoot '.agents\skills\shopify-web-design'

if (-not (Test-Path -LiteralPath $TargetPath -PathType Container)) {
    throw "Target directory does not exist: $TargetPath"
}

$targetRoot = (Resolve-Path -LiteralPath $TargetPath).Path
$targetAgentsFile = Join-Path $targetRoot 'AGENTS.md'
$targetSkillsRoot = Join-Path $targetRoot '.agents\skills'
$targetSkill = Join-Path $targetSkillsRoot 'shopify-web-design'

if (Test-Path -LiteralPath $targetAgentsFile -PathType Leaf) {
    $sourceHash = (Get-FileHash -LiteralPath $sourceAgentsFile -Algorithm SHA256).Hash
    $targetHash = (Get-FileHash -LiteralPath $targetAgentsFile -Algorithm SHA256).Hash
    if ($sourceHash -ne $targetHash) {
        throw "A different AGENTS.md already exists at $targetAgentsFile. Merge it manually; this installer will not overwrite project instructions."
    }
}

if (Test-Path -LiteralPath $targetSkill) {
    throw "The target skill already exists at $targetSkill. Review and update it manually; this installer will not overwrite it."
}

if ($PSCmdlet.ShouldProcess($targetRoot, 'Install Codex Shopify standards')) {
    if (-not (Test-Path -LiteralPath $targetAgentsFile)) {
        Copy-Item -LiteralPath $sourceAgentsFile -Destination $targetAgentsFile
    }

    New-Item -ItemType Directory -Path $targetSkillsRoot -Force | Out-Null
    Copy-Item -LiteralPath $sourceSkill -Destination $targetSkill -Recurse

    Write-Output "Installed AGENTS.md and shopify-web-design into: $targetRoot"
    Write-Output 'Start a new Codex session from the target repository root to load the skill.'
}
