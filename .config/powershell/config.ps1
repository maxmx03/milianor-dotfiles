# Git
Import-Module posh-git

# Theme
Import-Module oh-my-posh
Import-Module -Name Terminal-Icons
Set-PoshPrompt -Theme space

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Path
$Env:Path += ';C:\Users\maxma\scoop\apps\nvm\current\nodejs\v16.14.2'

# Alias
Set-Alias vim nvim

# Utilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue |
	 Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function touch ($command) {
    New-Item -Path . -Name $command
}

function open ($command) {
    explorer $command
}

function ll ($command) {
    ls -Force $command
}

function find($command) {
    fd $command -H -i $HOME
}

# Python environment
function pe() {
  python -m venv venv
  .\venv\Scripts\Activate.ps1
}

function pa() {
  .\venv\Scripts\Activate.ps1
}
