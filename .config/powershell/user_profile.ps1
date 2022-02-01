# Prompt
import-Module posh-git
import-Module oh-my-posh
Set-PoshPrompt Space

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Path
$Env:Path += ';C:\Program Files\PostgreSQL\14\bin'
$Env:Path += ';C:\Program Files\LOVE'

# Alias
Set-Alias vim nvim
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias g git
Set-Alias p python
Set-Alias d docker
Set-Alias dc docker-compose

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

function search($command, $path) {
    ls $command -Force -Recurse -Path $path -ErrorAction SilentlyContinue
}

# Python environment
function pe() {
  python -m venv venv
  .\venv\Scripts\Activate.ps1
}

function pa() {
  .\venv\Scripts\Activate.ps1
}
