# Character & Word Counter for Alfred

An Alfred workflow that counts characters, words, lines, and UTF-8 bytes.

![Character & Word Counter Preview](preview.gif)

## Requirements

- [Alfred 5](https://www.alfredapp.com/) with Powerpack
- macOS (uses system `zsh` only)

No PHP, Composer, Python, or Homebrew dependencies.

## Install

1. Download the latest `.alfredworkflow` from [Releases](https://github.com/ibnuh/alfred-character-counter-workflow/releases).
2. Double-click the file to add it in Alfred.
3. Optional: open the workflow and click **Configure Workflow…** to change the keyword (default: `cw`).

## Usage

### Keyword

Type `cw`, a space, then your text. Results update as you type.

| Key | Action |
| --- | --- |
| `↩` | Copy the selected number |
| `⌘↩` | Copy and paste into the frontmost app |
| `⌘C` | Copy (Alfred standard) |
| `⌘L` | Large Type |

### Universal Action

1. Select text in any app.
2. Press your Universal Actions hotkey.
3. Choose **Character & Word Counter**.
4. Pick a metric, then `↩` or `⌘↩` as above.

## Metrics

| Result | Meaning |
| --- | --- |
| Characters | Unicode characters (not raw bytes) |
| Words | Whitespace-separated tokens |
| Characters (no whitespace) | Characters after removing spaces, tabs, and newlines |
| Lines | Newline-separated rows |
| Bytes (UTF-8) | Size of the text in UTF-8 |

## Development

```bash
git clone https://github.com/ibnuh/alfred-character-counter-workflow.git
cd alfred-character-counter-workflow
chmod +x count build.sh
./count 'Hello 世界'
./build.sh
```

`./build.sh` writes `dist/Character-and-Word-Counter.alfredworkflow`.

### Layout

| File | Role |
| --- | --- |
| `count` | External Script Filter (`zsh`, JSON) |
| `info.plist` | Alfred 5 workflow definition |
| `icon.png` | Workflow icon |
| `build.sh` | Packages the `.alfredworkflow` |
| `.github/workflows/ci.yml` | PR/master smoke tests + package build |
| `.github/workflows/release.yml` | Tag release (master only) |

### Releasing

Releases are tag-driven and only publish when the tag points at a commit on `master`.

1. Bump `version` in `info.plist` (example: `2.0.0`).
2. Merge to `master`.
3. Tag and push from `master`:

```bash
git checkout master
git pull
git tag -a v2.0.0 -m "v2.0.0"
git push origin v2.0.0
```

4. The **Release** workflow checks:
   - the tag commit is on `origin/master`
   - tag `vX.Y.Z` matches `info.plist` `version`
   - smoke tests pass
5. It uploads `Character-and-Word-Counter.alfredworkflow` to the GitHub Release.

## Credits

- Icon: [Flaticon](https://www.flaticon.com/free-icon/alphabet-letters-a-b-and-c_27482)
- Script Filter JSON: [Alfred Help](https://www.alfredapp.com/help/workflows/inputs/script-filter/json/)

## License

[MIT](LICENSE)
