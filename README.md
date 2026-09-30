# AutoHotKeyWorkflows

Personal AutoHotkey v2 utilities and a Corsair iCUE keyboard profile. The current F13 mappings are a test scaffold: they display which chord was pressed, but do not yet run editor or application shortcuts.

## What's Here

- [functions.ahk](functions.ahk) defines F13+key hotkeys for the keyboard, navigation keys, and numpad. Each handler displays a tooltip for 500 ms.
- [CoreLibrary.ahk](CoreLibrary.ahk) contains reusable helpers for getting the active File Explorer path, launching applications, opening a browser or Explorer, capturing selected clipboard data, running as administrator, launching ripgrep in the current directory, and showing tooltips. These helpers are not bound to the F13 hotkeys by default.
- [F13 Profile.cueprofile](F13%20Profile.cueprofile) is an exported Corsair iCUE profile intended for a K55 keyboard. Its key-remap actions emit F13+key chords for AutoHotkey to handle.

## Requirements

- Windows
- AutoHotkey v2
- Corsair iCUE and a compatible Corsair keyboard for importing and using the profile
- PowerShell and `rg` (ripgrep) on `PATH` to use `rpGrepInCurrentDir`

## Setup

1. In Corsair iCUE, import `F13 Profile.cueprofile` and assign the profile to the intended keyboard.
2. Run `functions.ahk` with AutoHotkey v2. It includes `CoreLibrary.ahk` from the same directory.
3. Test a mapped F13+key chord. The current handler should show a short tooltip; it does not send the original key or perform another action.

The profile changes keyboard key output to F13+key combinations. Back up your existing iCUE profile and test this configuration with care, since normal typing may be affected while it is active.

## Utility Notes

- `GetActiveExplorerPath()` returns the active File Explorer folder or an empty string.
- `LaunchAppInCurrentDir(appTarget)` launches an application using the active Explorer folder when available.
- `GetSelectedData()` sends Ctrl+C, reads the resulting clipboard text, then restores the previous clipboard contents.
- `rpGrepInCurrentDir(searchQuery := "")` opens a persistent PowerShell session and runs ripgrep in the active Explorer folder, falling back to the script working directory.
- `RunElevated`, `OpenBrowser`, `OpenExplorer`, and `ShowTooltip` provide the corresponding launch or display helpers.

These functions are library helpers; to use one from a hotkey, add a call to its handler in `functions.ahk`.

## License

Licensed under the GNU General Public License v3.0; see [LICENSE](LICENSE).
