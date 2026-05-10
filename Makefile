.PHONY: cv

cv:
	uv run rendercv render artur_mrozowski__cv.yaml
	uv run python scripts/format_rendercv_markdown.py
