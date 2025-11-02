$ENV:EDITOR = "nvim"
oh-my-posh init pwsh --config ~/themes/nordtron.omp.json | Invoke-Expression
Set-Alias -Name vi -Value nvim

function sd {
    $selectedDir = find-path | fzf --tac
    if ($selectedDir) {
        Set-Location -Path $selectedDir
    }
}

function find-path {
    Get-ChildItem -Path . -Directory -Recurse -Force -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName
}

Set-PSReadlineKeyHandler -Key 'Ctrl+r' -ScriptBlock {
    # Get the full, persistent command history from the PSReadLine file
    $history = Get-Content (Get-PSReadlineOption).HistorySavePath
    
    # Pipe the full history to fzf for a fuzzy search and capture the selection
    $selectedCommand = $history | fzf
    
    # If a command was selected, insert it on the command line for editing
    if ($selectedCommand) {
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert($selectedCommand)
    }
}

function o {
  cd "~/Obsidian-Vaults/myVault"
  nvim
}
Invoke-Expression (& { (zoxide init powershell | Out-String) })
