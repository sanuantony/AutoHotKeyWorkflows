#Requires AutoHotkey v2.0
#SingleInstance Force
#Include CoreLibrary.ahk

; =========================================================================
; CORSAIR K55 FULL KEYBOARD MAPPER
; Intercepts: F13 + Key
; =========================================================================

F13 & Escape:: funcEscape()
F13 & F1:: funcF1()
F13 & F2:: funcF2()
F13 & F3:: funcF3()
F13 & F4:: funcF4()
F13 & F5:: funcF5()
F13 & F6:: funcF6()
F13 & F7:: funcF7()
F13 & F8:: funcF8()
F13 & F9:: funcF9()
F13 & F10:: funcF10()
F13 & F11:: funcF11()
F13 & F12:: funcF12()
F13 & `:: funcGraveAccentAndTilde()
F13 & 1:: func1()
F13 & 2:: func2()
F13 & 3:: func3()
F13 & 4:: func4()
F13 & 5:: func5()
F13 & 6:: func6()
F13 & 7:: func7()
F13 & 8:: func8()
F13 & 9:: func9()
F13 & 0:: func0()
F13 & -:: funcMinusAndUnderscore()
F13 & =:: funcEqualsAndPlus()
F13 & BackSpace:: funcBackspace()
F13 & Tab:: funcTab()
F13 & q:: funcQ()
F13 & w:: funcW()
F13 & e:: funcE()
F13 & r:: funcR()
F13 & t:: funcT()
F13 & y:: funcY()
F13 & u:: funcU()
F13 & i:: funcI()
F13 & o:: funcO()
F13 & p:: funcP()
F13 & [:: funcBracketLeft()
F13 & ]:: funcBracketRight()
F13 & \:: funcBackslash()
F13 & CapsLock:: funcCapsLock()
F13 & a:: funcA()
F13 & s:: funcS()
F13 & d:: funcD()
F13 & f:: funcF()
F13 & g:: funcG()
F13 & h:: funcH()
F13 & j:: funcJ()
F13 & k:: funcK()
F13 & l:: funcL()
F13 & `;:: funcSemicolonAndColon()
F13 & ':: funcApostropheAndDoubleQuote()
F13 & Enter:: funcEnter()
F13 & z:: funcZ()
F13 & x:: funcX()
F13 & c:: funcC()
F13 & v:: funcV()
F13 & b:: funcB()
F13 & n:: funcN()
F13 & m:: funcM()
F13 & ,:: funcCommaAndLessThan()
F13 & .:: funcPeriodAndBiggerThan()
F13 & /:: funcSlashAndQuestionMark()
F13 & LCtrl:: funcLeftCtrl()
F13 & LWin:: funcLeftGui()
F13 & LAlt:: funcLeftAlt()
F13 & Space:: funcSpace()
F13 & RAlt:: funcRightAlt()
F13 & RWin:: funcRightGui()
F13 & RCtrl:: funcRightCtrl()
F13 & AppsKey:: funcApplication()
F13 & PrintScreen:: funcPrintScreen()
F13 & ScrollLock:: funcScrollLock()
F13 & Pause:: funcPauseBreak()
F13 & Insert:: funcInsert()
F13 & Home:: funcHome()
F13 & PgUp:: funcPageUp()
F13 & End:: funcEnd()
F13 & PgDn:: funcPageDown()
F13 & Up:: funcUpArrow()
F13 & Down:: funcDownArrow()
F13 & Left:: funcLeftArrow()
F13 & Right:: funcRightArrow()
F13 & NumLock:: funcNumLock()
F13 & NumpadDiv:: funcKeypadSlash()
F13 & NumpadMult:: funcKeypadAsterisk()
F13 & NumpadSub:: funcKeypadMinus()
F13 & Numpad7:: funcKeypad7()
F13 & Numpad8:: funcKeypad8()
F13 & Numpad9:: funcKeypad9()
F13 & NumpadAdd:: funcKeypadPlus()
F13 & Numpad4:: funcKeypad4()
F13 & Numpad5:: funcKeypad5()
F13 & Numpad6:: funcKeypad6()
F13 & Numpad1:: funcKeypad1()
F13 & Numpad2:: funcKeypad2()
F13 & Numpad3:: funcKeypad3()
F13 & NumpadEnter:: funcKeypadEnter()
F13 & Numpad0:: funcKeypad0()
F13 & NumpadDel:: funcKeypadPeriodAndDelete()

; =========================================================================
; KEYBOARD FUNCTIONS
; =========================================================================

funcLeftCtrl() {
    ShowTooltip("LCtrl", 500)
}

funcRightCtrl() {
    ShowTooltip("RCtrl", 500)
}

funcEscape() {
    ShowTooltip("Escape", 500)
}

funcF1() {
    ShowTooltip("F1", 500)
}

funcF2() {
    ShowTooltip("F2", 500)
}

funcF3() {
    ShowTooltip("F3", 500)
}

funcF4() {
    ShowTooltip("F4", 500)
}

funcF5() {
    ShowTooltip("F5", 500)
}

funcF6() {
    ShowTooltip("F6", 500)
}

funcF7() {
    ShowTooltip("F7", 500)
}

funcF8() {
    ShowTooltip("F8", 500)
}

funcF9() {
    ShowTooltip("F9", 500)
}

funcF10() {
    ShowTooltip("F10", 500)
}

funcF11() {
    ShowTooltip("F11", 500)
}

funcF12() {
    ShowTooltip("F12", 500)
}

funcGraveAccentAndTilde() {
    ShowTooltip("``", 500)
}

func1() {
    ShowTooltip("1", 500)
}

func2() {
    ShowTooltip("2", 500)
}

func3() {
    ShowTooltip("3", 500)
}

func4() {
    ShowTooltip("4", 500)
}

func5() {
    ShowTooltip("5", 500)
}

func6() {
    ShowTooltip("6", 500)
}

func7() {
    ShowTooltip("7", 500)
}

func8() {
    ShowTooltip("8", 500)
}

func9() {
    ShowTooltip("9", 500)
}

func0() {
    ShowTooltip("0", 500)
}

funcMinusAndUnderscore() {
    ShowTooltip("-", 500)
}

funcEqualsAndPlus() {
    ShowTooltip("=", 500)
}

funcBackspace() {
    ShowTooltip("BackSpace", 500)
}

funcTab() {
    ShowTooltip("Tab", 500)
}

funcQ() {
    ShowTooltip("Q", 500)
}

funcW() {
    ShowTooltip("W", 500)
}

funcE() {
    ShowTooltip("E", 500)
}

funcR() {
    ShowTooltip("R", 500)
}

funcT() {
    ShowTooltip("T", 500)
}

funcY() {
    ShowTooltip("Y", 500)
}

funcU() {
    ShowTooltip("U", 500)
}

funcI() {
    ShowTooltip("I", 500)
}

funcO() {
    ShowTooltip("O", 500)
}

funcP() {
    ShowTooltip("P", 500)
}

funcBracketLeft() {
    ShowTooltip("[", 500)
}

funcBracketRight() {
    ShowTooltip("]", 500)
}

funcBackslash() {
    ShowTooltip("\\", 500)
}

funcCapsLock() {
    ShowTooltip("CapsLock", 500)
}

funcA() {
    ShowTooltip("A", 500)
}

funcS() {
    ShowTooltip("S", 500)
}

funcD() {
    ShowTooltip("D", 500)
}

funcF() {
    ShowTooltip("F", 500)
}

funcG() {
    ShowTooltip("G", 500)
}

funcH() {
    ShowTooltip("H", 500)
}

funcJ() {
    ShowTooltip("J", 500)
}

funcK() {
    ShowTooltip("K", 500)
}

funcL() {
    ShowTooltip("L", 500)
}

funcSemicolonAndColon() {
    ShowTooltip(";", 500)
}

funcApostropheAndDoubleQuote() {
    ShowTooltip("'", 500)
}

funcEnter() {
    ShowTooltip("Enter", 500)
}

funcZ() {
    ShowTooltip("Z", 500)
}

funcX() {
    ShowTooltip("X", 500)
}

funcC() {
    ShowTooltip("C", 500)
}

funcV() {
    ShowTooltip("V", 500)
}

funcB() {
    ShowTooltip("B", 500)
}

funcN() {
    ShowTooltip("N", 500)
}

funcM() {
    ShowTooltip("M", 500)
}

funcCommaAndLessThan() {
    ShowTooltip(",", 500)
}

funcPeriodAndBiggerThan() {
    ShowTooltip(".", 500)
}

funcSlashAndQuestionMark() {
    ShowTooltip("/", 500)
}

funcLeftGui() {
    ShowTooltip("LWin", 500)
}

funcLeftAlt() {
    ShowTooltip("LAlt", 500)
}

funcSpace() {
    ShowTooltip("Space", 500)
}

funcRightAlt() {
    ShowTooltip("RAlt", 500)
}

funcRightGui() {
    ShowTooltip("RWin", 500)
}

funcApplication() {
    ShowTooltip("AppsKey", 500)
}

funcPrintScreen() {
    ShowTooltip("PrintScreen", 500)
}

funcScrollLock() {
    ShowTooltip("ScrollLock", 500)
}

funcPauseBreak() {
    ShowTooltip("Pause", 500)
}

funcInsert() {
    ShowTooltip("Insert", 500)
}

funcHome() {
    ShowTooltip("Home", 500)
}

funcPageUp() {
    ShowTooltip("PgUp", 500)
}

funcEnd() {
    ShowTooltip("End", 500)
}

funcPageDown() {
    ShowTooltip("PgDn", 500)
}

funcUpArrow() {
    ShowTooltip("Up", 500)
}

funcDownArrow() {
    ShowTooltip("Down", 500)
}

funcLeftArrow() {
    ShowTooltip("Left", 500)
}

funcRightArrow() {
    ShowTooltip("Right", 500)
}

funcNumLock() {
    ShowTooltip("NumLock", 500)
}

funcKeypadSlash() {
    ShowTooltip("NumpadDiv", 500)
}

funcKeypadAsterisk() {
    ShowTooltip("NumpadMult", 500)
}

funcKeypadMinus() {
    ShowTooltip("NumpadSub", 500)
}

funcKeypad7() {
    ShowTooltip("Numpad7", 500)
}

funcKeypad8() {
    ShowTooltip("Numpad8", 500)
}

funcKeypad9() {
    ShowTooltip("Numpad9", 500)
}

funcKeypadPlus() {
    ShowTooltip("NumpadAdd", 500)
}

funcKeypad4() {
    ShowTooltip("Numpad4", 500)
}

funcKeypad5() {
    ShowTooltip("Numpad5", 500)
}

funcKeypad6() {
    ShowTooltip("Numpad6", 500)
}

funcKeypad1() {
    ShowTooltip("Numpad1", 500)
}

funcKeypad2() {
    ShowTooltip("Numpad2", 500)
}

funcKeypad3() {
    ShowTooltip("Numpad3", 500)
}

funcKeypadEnter() {
    ShowTooltip("NumpadEnter", 500)
}

funcKeypad0() {
    ShowTooltip("Numpad0",500)
}

funcKeypadPeriodAndDelete() {    
    ShowTooltip("NumpadDel",500)
}
