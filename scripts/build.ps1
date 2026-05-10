$ErrorActionPreference = "Stop"

$env:PYTHONIOENCODING = "utf-8"
$env:PYTHONUTF8 = "1"

uv run rendercv render artur_mrozowski__cv.yaml
Copy-Item -Path "rendercv_output/Artur_Mrozowski_CV.md" -Destination "README.md" -Force

