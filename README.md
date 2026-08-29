# Character & Word Counter for Alfred

Count characters, words, lines, and UTF-8 bytes from Alfred. Zero dependencies — plain `zsh` on macOS.

![Character & Word Counter Preview](preview.gif)

## Requirements

- [Alfred 5](https://www.alfredapp.com/) + Powerpack
- macOS (no PHP, Composer, Python, or Homebrew packages)

## Install

1. Download the latest `.alfredworkflow` from [Releases](https://github.com/ibnuh/alfred-character-counter-workflow/releases).
2. Double-click to import into Alfred.
3. Optional: **Configure Workflow…** to change the keyword (default `cw`).

## Usage

| Action | How |
| --- | --- |
| Keyword | Type `cw` then your text. Results update as you type. |
| Copy | **↩** on a row copies that number. |
| Copy + paste | **⌘↩** copies and pastes into the frontmost app. |
| Universal Action | Select text → Universal Actions hotkey → **Character & Word Counter**. |

### Metrics

- Characters (Unicode, not raw bytes)
- Words (whitespace-separated)
- Characters without whitespace
- Lines
- Bytes (UTF-8)

## Development

```bash
git clone https://github.com/ibnuh/alfred-character-counter-workflow.git
cd alfred-character-counter-workflow
./build.sh
```

`build.sh` writes `dist/Character-and-Word-Counter.alfredworkflow` (zip of the workflow root).

Smoke-test the Script Filter output:

```bash
./count 'Hello 世界'
```

## Credits

1. Icons by [Flaticon](https://www.flaticon.com/free-icon/alphabet-letters-a-b-and-c_27482)
2. Alfred Script Filter [JSON format](https://www.alfredapp.com/help/workflows/inputs/script-filter/json/)
