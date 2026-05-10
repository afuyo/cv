$ErrorActionPreference = "Stop"

$env:PYTHONIOENCODING = "utf-8"
$env:PYTHONUTF8 = "1"

uv run rendercv render artur_mrozowski__cv.yaml
uv run python scripts/format_rendercv_markdown.py
