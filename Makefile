.PHONY: cv

cv:
	uv run rendercv render artur_mrozowski__cv.yaml
	cp "rendercv_output/Artur_Mrozowski_CV.md" README.md

