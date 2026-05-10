from __future__ import annotations

from pathlib import Path

from ruamel.yaml import YAML


ROOT = Path(__file__).resolve().parents[1]
YAML_PATH = ROOT / "artur_mrozowski__cv.yaml"
MARKDOWN_PATH = ROOT / "rendercv_output" / "Artur_Mrozowski_CV.md"
README_PATH = ROOT / "README.md"


MONTHS = {
    "01": "Jan",
    "02": "Feb",
    "03": "Mar",
    "04": "Apr",
    "05": "May",
    "06": "Jun",
    "07": "Jul",
    "08": "Aug",
    "09": "Sep",
    "10": "Oct",
    "11": "Nov",
    "12": "Dec",
}


def load_cv() -> dict:
    yaml = YAML(typ="safe")
    return yaml.load(YAML_PATH)["cv"]


def bullet_text(entry: str | dict) -> str:
    if isinstance(entry, dict):
        return str(entry["bullet"])
    return str(entry)


def bullets(entries: list[str | dict]) -> list[str]:
    return [f"- {bullet_text(entry)}" for entry in entries]


def format_date(value: str) -> str:
    value = str(value)
    if value.lower() == "present":
        return "Present"
    if "-" not in value:
        return value
    year, month = value.split("-", 1)
    return f"{MONTHS[month]} {year}"


def format_range(entry: dict) -> str:
    return f"{format_date(entry['start_date'])} – {format_date(entry['end_date'])}"


def strip_markdown_label(value: str) -> str:
    if value.startswith("**") and ":** " in value:
        return value.split(":** ", 1)[1]
    return value


def split_label(value: str) -> tuple[str, str] | None:
    if not value.startswith("**") or ":**" not in value:
        return None
    label, detail = value.split(":**", 1)
    return label.removeprefix("**"), detail.strip()


def markdown_section_title(label: str) -> str:
    return {
        "Revenue Intelligence and Operational Analytics": "Revenue Intelligence & Operational Analytics",
        "Data Product Platform and Strategy": "Data Product Platform & Strategy",
        "Metadata and Data Catalog": "Metadata & Data Catalog",
    }.get(label, label)


def render_experience(entry: dict) -> list[str]:
    lines = [
        f"## {entry['company']} — {entry['position']}",
        f"**{format_range(entry)}**",
        "",
    ]

    pending_label: str | None = None
    for raw_highlight in entry.get("highlights", []):
        highlight = str(raw_highlight)
        label = split_label(highlight)

        if label and label[0] == "Technologies":
            if lines[-1] != "":
                lines.append("")
            lines.append(f"**Technologies:** {label[1]}")
            continue

        if label:
            if lines[-1] != "":
                lines.append("")
            lines.extend([f"### {markdown_section_title(label[0])}", ""])
            if label[1]:
                lines.append(f"- {label[1]}")
            else:
                pending_label = label[0]
            continue

        pending_label = None
        lines.append(f"- {highlight}")

    return lines[:-1] if lines[-1] == "" else lines


def render_markdown(cv: dict) -> str:
    sections = cv["sections"]
    github = next(
        network["username"]
        for network in cv.get("social_networks", [])
        if network["network"].lower() == "github"
    )

    lines = [
        f"# {cv['name']}",
        f"{cv['location']}  ",
        f"{cv['phone']} | {cv['email']} | GitHub: {github}",
        "",
        "---",
        "",
        f"# {cv['headline']}",
        "",
    ]

    for paragraph in sections["summary"]:
        lines.extend([paragraph, ""])

    lines.extend(
        [
            "---",
            "",
            "# Core Competencies",
            "",
            *bullets(sections["core_competencies"]),
            "",
            "---",
            "",
            "# Professional Experience",
            "",
        ]
    )

    for index, entry in enumerate(sections["experience"]):
        lines.extend(render_experience(entry))
        lines.extend(["", "---", ""] if index < len(sections["experience"]) - 1 else [""])

    lines.extend(
        [
            "---",
            "",
            "# Earlier Career",
            "",
            *bullets(sections["earlier_career"]),
            "",
            "---",
            "",
            "# Certifications",
            "",
            *bullets(sections["certifications"]),
            "",
            "---",
            "",
            "# Current Learning & Professional Development",
            "",
            *bullets(sections["current_learning_professional_development"]),
            "",
            "---",
            "",
            "# Education",
            "",
        ]
    )

    education = sections["education"][0]
    lines.extend(
        [
            f"## {education['institution']} — {education['degree']}",
            "Faculty of Informatics",
            "",
            "Key areas:",
            education["highlights"][1].removeprefix("Key areas: "),
            "",
            "---",
            "",
            "# Additional Education",
            "",
            *bullets(sections["additional_education"]),
            "",
            "---",
            "",
            "# Speaking & Open Source",
            "",
        ]
    )

    speaking = sections["speaking_and_open_source"]
    lines.extend(bullets(speaking[:2]))
    lines.append("")
    lines.extend(bullets(speaking[2:]))
    lines.extend(["", "---"])

    return "\n".join(lines).strip()


def main() -> None:
    formatted = render_markdown(load_cv())
    MARKDOWN_PATH.write_text(formatted, encoding="utf-8")
    README_PATH.write_text(formatted, encoding="utf-8")


if __name__ == "__main__":
    main()
