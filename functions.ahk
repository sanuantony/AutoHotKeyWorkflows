#Requires AutoHotkey v2.0
#SingleInstance Force
#Include CoreLibrary.ahk

; =========================================================================
; CORSAIR K55 FULL KEYBOARD MAPPER
; Intercepts: Ctrl(^) + Shift(+) + Alt(!) + F13 + Key
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
    MsgBox("LCtrl")
}

funcRightCtrl() {
    MsgBox("RCtrl")
}

funcEscape() {
    MsgBox("Escape")
}

funcF1() {
    MsgBox("F1")
}

funcF2() {
    MsgBox("F2")
}

funcF3() {
    MsgBox("F3")
}

funcF4() {
    MsgBox("F4")
}

funcF5() {
    MsgBox("F5")
}

funcF6() {
    MsgBox("F6")
}

funcF7() {
    MsgBox("F7")
}

funcF8() {
    MsgBox("F8")
}

funcF9() {
    MsgBox("F9")
}

funcF10() {
    MsgBox("F10")
}

funcF11() {
    MsgBox("F11")
}

funcF12() {
    MsgBox("F12")
}

funcGraveAccentAndTilde() {
    MsgBox("``")
}

func1() {
    MsgBox("1")
}

func2() {
    MsgBox("2")
}

func3() {
    MsgBox("3")
}

func4() {
    MsgBox("4")
}

func5() {
    MsgBox("5")
}

func6() {
    MsgBox("6")
}

func7() {
    MsgBox("7")
}

func8() {
    MsgBox("8")
}

func9() {
    MsgBox("9")
}

func0() {
    MsgBox("0")
}

funcMinusAndUnderscore() {
    MsgBox("-")
}

funcEqualsAndPlus() {
    MsgBox("=")
}

funcBackspace() {
    MsgBox("BackSpace")
}

funcTab() {
    MsgBox("Tab")
}

funcQ() {
    MsgBox("Q")
}

funcW() {
    MsgBox("W")
}

funcE() {
    MsgBox("E")
}

funcR() {
    MsgBox("R")
}

funcT() {
    MsgBox("T")
}

funcY() {
    MsgBox("Y")
}

funcU() {
    MsgBox("U")
}

funcI() {
    MsgBox("I")
}

funcO() {
    MsgBox("O")
}

funcP() {
    MsgBox("P")
}

funcBracketLeft() {
    MsgBox("[")
}

funcBracketRight() {
    MsgBox("]")
}

funcBackslash() {
    MsgBox("\\")
}

funcCapsLock() {
    MsgBox("CapsLock")
}

funcA() {
    MsgBox("A")
}

funcS() {
    MsgBox("S")
}

funcD() {
    MsgBox("D")
}

funcF() {
    MsgBox("F")
}

funcG() {
    MsgBox("G")
}

funcH() {
    MsgBox("H")
}

funcJ() {
    MsgBox("J")
}

funcK() {
    MsgBox("K")
}

funcL() {
    MsgBox("L")
}

funcSemicolonAndColon() {
    MsgBox(";")
}

funcApostropheAndDoubleQuote() {
    MsgBox("'")
}

funcEnter() {
    MsgBox("Enter")
}

funcZ() {
    MsgBox("Z")
}

funcX() {
    MsgBox("X")
}

funcC() {
    MsgBox("C")
}

funcV() {
    MsgBox("V")
}

funcB() {
    MsgBox("B")
}

funcN() {
    MsgBox("N")
}

funcM() {
    MsgBox("M")
}

funcCommaAndLessThan() {
    MsgBox(",")
}

funcPeriodAndBiggerThan() {
    MsgBox(".")
}

funcSlashAndQuestionMark() {
    MsgBox("/")
}

funcLeftGui() {
    MsgBox("LWin")
}

funcLeftAlt() {
    MsgBox("LAlt")
}

funcSpace() {
    MsgBox("Space")
}

funcRightAlt() {
    MsgBox("RAlt")
}

funcRightGui() {
    MsgBox("RWin")
}

funcApplication() {
    MsgBox("AppsKey")
}

funcPrintScreen() {
    MsgBox("PrintScreen")
}

funcScrollLock() {
    MsgBox("ScrollLock")
}

funcPauseBreak() {
    MsgBox("Pause")
}

funcInsert() {
    MsgBox("Insert")
}

funcHome() {
    MsgBox("Home")
}

funcPageUp() {
    MsgBox("PgUp")
}

funcEnd() {
    MsgBox("End")
}

funcPageDown() {
    MsgBox("PgDn")
}

funcUpArrow() {
    MsgBox("Up")
}

funcDownArrow() {
    MsgBox("Down")
}

funcLeftArrow() {
    MsgBox("Left")
}

funcRightArrow() {
    MsgBox("Right")
}

funcNumLock() {
    MsgBox("NumLock")
}

funcKeypadSlash() {
    MsgBox("NumpadDiv")
}

funcKeypadAsterisk() {
    MsgBox("NumpadMult")
}

funcKeypadMinus() {
    MsgBox("NumpadSub")
}

funcKeypad7() {
    MsgBox("Numpad7")
}

funcKeypad8() {
    MsgBox("Numpad8")
}

funcKeypad9() {
    MsgBox("Numpad9")
}

funcKeypadPlus() {
    MsgBox("NumpadAdd")
}

funcKeypad4() {
    MsgBox("Numpad4")
}

funcKeypad5() {
    MsgBox("Numpad5")
}

funcKeypad6() {
    MsgBox("Numpad6")
}

funcKeypad1() {
    MsgBox("Numpad1")
}

funcKeypad2() {
    MsgBox("Numpad2")
}

funcKeypad3() {
    MsgBox("Numpad3")
}

funcKeypadEnter() {
    MsgBox("NumpadEnter")
}

funcKeypad0() {
    ShowTooltip("Numpad0",500)
}

funcKeypadPeriodAndDelete() {    
    ShowTooltip("NumpadDel",500)
}
