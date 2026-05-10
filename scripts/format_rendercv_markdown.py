from __future__ import annotations

from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
LAYOUT_PATH = ROOT / "layout.md"
MARKDOWN_PATH = ROOT / "rendercv_output" / "Artur_Mrozowski_CV.md"
README_PATH = ROOT / "README.md"


def main() -> None:
    formatted = LAYOUT_PATH.read_text(encoding="utf-8").replace("\r\n", "\n")
    formatted = formatted.strip() + "\n"
    MARKDOWN_PATH.write_text(formatted, encoding="utf-8")
    README_PATH.write_text(formatted, encoding="utf-8")


if __name__ == "__main__":
    main()
