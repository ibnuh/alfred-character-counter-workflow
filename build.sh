#!/usr/bin/env bash
# Build a shareable .alfredworkflow (zip) from the repo root.
set -euo pipefail

root="$(cd "$(dirname "$0")" && pwd)"
cd "$root"

name="Character-and-Word-Counter"
out_dir="$root/dist"
out="$out_dir/${name}.alfredworkflow"

mkdir -p "$out_dir"
rm -f "$out"
chmod +x count

python3 - "$out" <<'PY'
import sys, zipfile
from pathlib import Path

out = Path(sys.argv[1])
files = ["info.plist", "count", "icon.png"]
# preview.gif stays on GitHub only (large); not needed at runtime.
optional = ["README.md", "LICENSE"]
with zipfile.ZipFile(out, "w", compression=zipfile.ZIP_DEFLATED) as zf:
    for name in files:
        zf.write(name, arcname=name)
    for name in optional:
        p = Path(name)
        if p.is_file():
            zf.write(p, arcname=name)
    print("Built", out)
    for info in zf.infolist():
        print(f"  {info.file_size:8d}  {info.filename}")
PY
