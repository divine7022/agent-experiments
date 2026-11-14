#!/usr/bin/env bash
# inline the figures so they follow the page theme
set -euo pipefail
cd "$(dirname "$0")"
python3 - <<'PY'
import re
cap = {r.split("|")[1].strip(): r.split("|")[2].strip() for r in open("figures/MANIFEST.md") if r.startswith("| ") and ".svg" in r}
def fig(m):
    svg = re.sub(r"<\?xml.*?\?>", "", open(f"figures/{m[1]}.svg").read()).strip()
    svg = svg.replace('"arrow"', f'"arrow-{m[1]}"').replace("#arrow)", f"#arrow-{m[1]})")
    return f'<figure>{svg}<figcaption>{cap[m[1] + ".svg"]}</figcaption></figure>'
html = re.sub(r"<!-- fig:(\w+) -->", fig, open("index.src.html").read())
open("index.html", "w").write(html)
PY
