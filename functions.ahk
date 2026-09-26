#Requires AutoHotkey v2.0
#SingleInstance Force

; =========================================================================
; CORSAIR K55 FULL KEYBOARD ALPHABET MAPPER
; Intercepts: Ctrl(^) + Shift(+) + Alt(!) + Letter
; =========================================================================

^+!a:: devA()
^+!b:: devB()
^+!c:: devC()
^+!d:: devD()
^+!e:: devE()
^+!f:: devF()
^+!g:: devG()
^+!h:: devH()
^+!i:: devI()
^+!j:: devJ()
^+!k:: devK()
^+!l:: devL()
^+!m:: devM()
^+!n:: devN()
^+!o:: devO()
^+!p:: devP()
^+!q:: devQ()
^+!r:: devR()
^+!s:: devS()
^+!t:: devT()
^+!u:: devU()
^+!v:: devV()
^+!w:: devW()
^+!x:: devX()
^+!y:: devY()
^+!z:: devZ()

; =========================================================================
; DEVELOPER CODE FUNCTIONS
; =========================================================================

devA() {
    ; 1. Launch PowerShell directly into Administrative mode
    Run("powershell.exe")
    
    ; 2. Wait for the PowerShell window to become active (up to 3 seconds)
    if WinWaitActive("ahk_exe powershell.exe", , 3) {
        Sleep(500) ; Short delay to ensure the prompt is ready for text input
        
        ; 3. Navigate to your directory and chain the npm run dev script
        ; Using {Enter} executes the text block instantly
        Send("cd E:\Workspace\Reactor\ace-runtime; npm run dev{Enter}")
    }
}


devB() {
    Run("code.exe E:\Workspace\Reactor\ace-runtime")
}

devC() {
    ; Example: Open CMD or Terminal window
    Run("cmd.exe")
}

devD() {
    Send("/* Your macro text or function logic for D goes here */")
}

devE() {
    Send("/* Your macro text or function logic for E goes here */")
}

devF() {
    Send("/* Your macro text or function logic for F goes here */")
}

devG() {
    Send("git status{Enter}")
}

devH() {
    Send("/* Blank Template */")
}

devI() {
    Send("/* Blank Template */")
}

devJ() {
    Send("/* Blank Template */")
}

devK() {
    Send("/* Blank Template */")
}

devL() {
    Send("/* Blank Template */")
}

devM() {
    Send("/* Blank Template */")
}

devN() {
    Send("/* Blank Template */")
}

devO() {
    Send("/* Blank Template */")
}

devP() {
    Send("/* Blank Template */")
}

devQ() {
    Send("/* Blank Template */")
}

devR() {
    Send("/* Blank Template */")
}

devS() {
        ; 1. Launch PowerShell directly into Administrative mode
    Run("powershell.exe")
    
    ; 2. Wait for the PowerShell window to become active (up to 3 seconds)
    if WinWaitActive("ahk_exe powershell.exe", , 3) {
        Sleep(500) ; Short delay to ensure the prompt is ready for text input
        
        ; 3. Navigate to your directory and chain the npm run dev script
        ; Using {Enter} executes the text block instantly
        Send("cd E:\Workspace\Reactor\ace-runtime; npm run dev{Enter}")
    }
}

devT() {
    Send("/* Blank Template */")
}

devU() {
    Send("/* Blank Template */")
}

devV() {
    Send("/* Blank Template */")
}

devW() {
    Send("/* Blank Template */")
}

devX() {
    Send("/* Blank Template */")
}

devY() {
    Send("/* Blank Template */")
}

devZ() {
    Send("/* Blank Template */")
}

