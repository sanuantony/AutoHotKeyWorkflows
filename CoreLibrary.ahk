#Requires AutoHotkey v2.0
#SingleInstance Force

/**
 * 1. GetActiveExplorerPath
 * Silently retrieves the file system path of the active Windows Explorer window.
 * @returns {String} Absolute directory path, or an empty string if not found.
 */
GetActiveExplorerPath() {
    if (explorerHwnd := WinActive("ahk_class CabinetWClass")) {
        for window in ComObject("Shell.Application").Windows {
            try {
                if (window && window.hwnd && window.hwnd == explorerHwnd)
                    return window.Document.Folder.Self.Path
            }
        }
    }
    return ""
}

/**
 * 2. LaunchApp
 * Safely executes a program or opens a path, returning the Process ID (PID).
 * @param {String} appTarget - Executable alias, full path, or document URL.
 * @param {String} [workingDir] - Optional initial working directory.
 * @returns {Integer} The Process ID (PID) of the launched application.
 * @throws {Error} Throws an error upstream if the target cannot be launched.
 */
LaunchApp(appTarget, workingDir := "") {
    pid := 0
    ; Throws automatically if target is invalid, allowing parent functions to catch it
    Run(appTarget, workingDir, , &pid)
    return pid
}

/**
 * 3. LaunchAppInCurrentDir
 * Automatically grabs the current active Explorer path and boots an application there.
 * @param {String} appTarget - The application to launch.
 * @returns {Integer} The Process ID (PID) of the application.
 */
LaunchAppInCurrentDir(appTarget) {
    currentDir := GetActiveExplorerPath()
    ; Fallback to default system path or script directory if Explorer isn't active
    if (currentDir == "")
        currentDir := A_WorkingDir 
        
    return LaunchApp(appTarget, currentDir)
}

/**
 * 4. rpGrepInCurrentDir
 * Launches an external ripGrep (rg) process or search UI targeting the current directory.
 * @param {String} [searchQuery] - Optional initial query text to pass into grep.
 */
rpGrepInCurrentDir(searchQuery := "") {
    currentDir := GetActiveExplorerPath()
    if (currentDir == "")
        currentDir := A_WorkingDir

    ; Example 1: Launch standard ripGrep inside a persistent PowerShell prompt
    LaunchApp("powershell.exe -NoExit -Command rg `"" . searchQuery . "`"", currentDir)    
}


/**
 * GetSelectedText Or Files
 * A highly resilient fallback mechanism to get whatever the user is highlighting.
 * Works across browsers, text editors, and pulls absolute paths if files are selected in Explorer.
 * @returns {String} The captured string data or newline-separated file paths.
 */
GetSelectedData() {
    ; Save existing clipboard state safely
    clipSaved := ClipboardAll()
    A_Clipboard := ""
    
    ; Send explicit copy command
    Send("^c")
    if ClipWait(0.4, 1) { ; Wait up to 400ms for data to arrive
        selection := A_Clipboard
        A_Clipboard := clipSaved ; Restore original clipboard
        return selection
    }
    
    A_Clipboard := clipSaved ; Restore original clipboard if empty
    return ""
}

/**
 * RunElevated
 * Forces any application or script block to execute with full Administrator rights.
 * @param {String} appTarget - Target application path.
 * @param {String} [workingDir] - Target working directory.
 */
RunElevated(appTarget, workingDir := "") {
    try {
        Run("*RunAs " . appTarget, workingDir)
    }
}

/*
 * OpenBrowser
 * Opens the default web browser to a specified URL.
 * @param {String} url - The web address to open.

*/
OpenBrowser(url := "https://www.google.com") {
    Run(url)
}

/*
* OpenExplorer
* Opens Windows Explorer to a specified directory.
*/
OpenExplorer(dirPath := A_WorkingDir) {
    Run("explorer.exe " . dirPath)
}

/*
* Create show a tooltip with a message for a specified duration.
* @param {String} message - The message to display in the tooltip.
 */

ShowTooltip(message, duration := 1000) {
    ToolTip(message)
    Sleep(duration)
    ToolTip() ; Clear the tooltip
}