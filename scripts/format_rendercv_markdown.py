from __future__ import annotations

import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MARKDOWN_PATH = ROOT / "rendercv_output" / "Artur_Mrozowski_CV.md"
README_PATH = ROOT / "README.md"


def tighten_markdown(text: str) -> str:
    text = text.replace("\r\n", "\n")

    # RenderCV leaves a blank line between every generated list item. Repeat
    # until stable because adjacent matches otherwise skip every other item.
    previous = None
    while previous != text:
        previous = text
        text = re.sub(r"(^|\n)(- [^\n]+)\n[ \t]*\n(?=- )", r"\1\2\n", text)

    previous = None
    while previous != text:
        previous = text
        text = re.sub(r"(^|\n)(\*\*[^\n]+\*\*[^\n]*)\n[ \t]*\n(?=\*\*)", r"\1\2\n", text)

    # Keep sections readable without producing large vertical gaps on GitHub.
    text = re.sub(r"\n{3,}", "\n\n", text)
    text = re.sub(r"(# .+)\n\n", r"\1\n", text)
    text = re.sub(r"(## .+)\n\n", r"\1\n", text)

    return text.strip() + "\n"


def main() -> None:
    text = MARKDOWN_PATH.read_text(encoding="utf-8")
    formatted = tighten_markdown(text)
    MARKDOWN_PATH.write_text(formatted, encoding="utf-8")
    README_PATH.write_text(formatted, encoding="utf-8")


if __name__ == "__main__":
    main()
