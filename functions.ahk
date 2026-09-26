#Requires AutoHotkey v2.0
#SingleInstance Force

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
F13 & LWin:: funcLeftGui()
F13 & LAlt:: funcLeftAlt()
F13 & Space:: funcSpace()
F13 & RAlt:: funcRightAlt()
F13 & RWin:: funcRightGui()
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



funcEscape() {
    MsgBox("Ctrl+Shift+Alt+F13+Escape")
}

funcF1() {
    MsgBox("Ctrl+Shift+Alt+F13+F1")
}

funcF2() {
    MsgBox("Ctrl+Shift+Alt+F13+F2")
}

funcF3() {
    MsgBox("Ctrl+Shift+Alt+F13+F3")
}

funcF4() {
    MsgBox("Ctrl+Shift+Alt+F13+F4")
}

funcF5() {
    MsgBox("Ctrl+Shift+Alt+F13+F5")
}

funcF6() {
    MsgBox("Ctrl+Shift+Alt+F13+F6")
}

funcF7() {
    MsgBox("Ctrl+Shift+Alt+F13+F7")
}

funcF8() {
    MsgBox("Ctrl+Shift+Alt+F13+F8")
}

funcF9() {
    MsgBox("Ctrl+Shift+Alt+F13+F9")
}

funcF10() {
    MsgBox("Ctrl+Shift+Alt+F13+F10")
}

funcF11() {
    MsgBox("Ctrl+Shift+Alt+F13+F11")
}

funcF12() {
    MsgBox("Ctrl+Shift+Alt+F13+F12")
}

funcGraveAccentAndTilde() {
    MsgBox("Ctrl+Shift+Alt+F13+``")
}

func1() {
    MsgBox("Ctrl+Shift+Alt+F13+1")
}

func2() {
    MsgBox("Ctrl+Shift+Alt+F13+2")
}

func3() {
    MsgBox("Ctrl+Shift+Alt+F13+3")
}

func4() {
    MsgBox("Ctrl+Shift+Alt+F13+4")
}

func5() {
    MsgBox("Ctrl+Shift+Alt+F13+5")
}

func6() {
    MsgBox("Ctrl+Shift+Alt+F13+6")
}

func7() {
    MsgBox("Ctrl+Shift+Alt+F13+7")
}

func8() {
    MsgBox("Ctrl+Shift+Alt+F13+8")
}

func9() {
    MsgBox("Ctrl+Shift+Alt+F13+9")
}

func0() {
    MsgBox("Ctrl+Shift+Alt+F13+0")
}

funcMinusAndUnderscore() {
    MsgBox("Ctrl+Shift+Alt+F13+-")
}

funcEqualsAndPlus() {
    MsgBox("Ctrl+Shift+Alt+F13+=")
}

funcBackspace() {
    MsgBox("Ctrl+Shift+Alt+F13+BackSpace")
}

funcTab() {
    MsgBox("Ctrl+Shift+Alt+F13+Tab")
}

funcQ() {
    MsgBox("Ctrl+Shift+Alt+F13+Q")
}

funcW() {
    MsgBox("Ctrl+Shift+Alt+F13+W")
}

funcE() {
    MsgBox("Ctrl+Shift+Alt+F13+E")
}

funcR() {
    MsgBox("Ctrl+Shift+Alt+F13+R")
}

funcT() {
    MsgBox("Ctrl+Shift+Alt+F13+T")
}

funcY() {
    MsgBox("Ctrl+Shift+Alt+F13+Y")
}

funcU() {
    MsgBox("Ctrl+Shift+Alt+F13+U")
}

funcI() {
    MsgBox("Ctrl+Shift+Alt+F13+I")
}

funcO() {
    MsgBox("Ctrl+Shift+Alt+F13+O")
}

funcP() {
    MsgBox("Ctrl+Shift+Alt+F13+P")
}

funcBracketLeft() {
    MsgBox("Ctrl+Shift+Alt+F13+[")
}

funcBracketRight() {
    MsgBox("Ctrl+Shift+Alt+F13+]")
}

funcBackslash() {
    MsgBox("Ctrl+Shift+Alt+F13+\\")
}

funcCapsLock() {
    MsgBox("Ctrl+Shift+Alt+F13+CapsLock")
}

funcA() {
    MsgBox("Ctrl+Shift+Alt+F13+A")
}

funcS() {
    MsgBox("Ctrl+Shift+Alt+F13+S")
}

funcD() {
    MsgBox("Ctrl+Shift+Alt+F13+D")
}

funcF() {
    MsgBox("Ctrl+Shift+Alt+F13+F")
}

funcG() {
    MsgBox("Ctrl+Shift+Alt+F13+G")
}

funcH() {
    MsgBox("Ctrl+Shift+Alt+F13+H")
}

funcJ() {
    MsgBox("Ctrl+Shift+Alt+F13+J")
}

funcK() {
    MsgBox("Ctrl+Shift+Alt+F13+K")
}

funcL() {
    MsgBox("Ctrl+Shift+Alt+F13+L")
}

funcSemicolonAndColon() {
    MsgBox("Ctrl+Shift+Alt+F13+;")
}

funcApostropheAndDoubleQuote() {
    MsgBox("Ctrl+Shift+Alt+F13+'")
}

funcEnter() {
    MsgBox("Ctrl+Shift+Alt+F13+Enter")
}

funcZ() {
    MsgBox("Ctrl+Shift+Alt+F13+Z")
}

funcX() {
    MsgBox("Ctrl+Shift+Alt+F13+X")
}

funcC() {
    MsgBox("Ctrl+Shift+Alt+F13+C")
}

funcV() {
    MsgBox("Ctrl+Shift+Alt+F13+V")
}

funcB() {
    MsgBox("Ctrl+Shift+Alt+F13+B")
}

funcN() {
    MsgBox("Ctrl+Shift+Alt+F13+N")
}

funcM() {
    MsgBox("Ctrl+Shift+Alt+F13+M")
}

funcCommaAndLessThan() {
    MsgBox("Ctrl+Shift+Alt+F13+,")
}

funcPeriodAndBiggerThan() {
    MsgBox("Ctrl+Shift+Alt+F13+.")
}

funcSlashAndQuestionMark() {
    MsgBox("Ctrl+Shift+Alt+F13+/")
}

funcLeftGui() {
    MsgBox("Ctrl+Shift+Alt+F13+LWin")
}

funcLeftAlt() {
    MsgBox("Ctrl+Shift+Alt+F13+LAlt")
}

funcSpace() {
    MsgBox("Ctrl+Shift+Alt+F13+Space")
}

funcRightAlt() {
    MsgBox("Ctrl+Shift+Alt+F13+RAlt")
}

funcRightGui() {
    MsgBox("Ctrl+Shift+Alt+F13+RWin")
}

funcApplication() {
    MsgBox("Ctrl+Shift+Alt+F13+AppsKey")
}

funcPrintScreen() {
    MsgBox("Ctrl+Shift+Alt+F13+PrintScreen")
}

funcScrollLock() {
    MsgBox("Ctrl+Shift+Alt+F13+ScrollLock")
}

funcPauseBreak() {
    MsgBox("Ctrl+Shift+Alt+F13+Pause")
}

funcInsert() {
    MsgBox("Ctrl+Shift+Alt+F13+Insert")
}

funcHome() {
    MsgBox("Ctrl+Shift+Alt+F13+Home")
}

funcPageUp() {
    MsgBox("Ctrl+Shift+Alt+F13+PgUp")
}

funcEnd() {
    MsgBox("Ctrl+Shift+Alt+F13+End")
}

funcPageDown() {
    MsgBox("Ctrl+Shift+Alt+F13+PgDn")
}

funcUpArrow() {
    MsgBox("Ctrl+Shift+Alt+F13+Up")
}

funcDownArrow() {
    MsgBox("Ctrl+Shift+Alt+F13+Down")
}

funcLeftArrow() {
    MsgBox("Ctrl+Shift+Alt+F13+Left")
}

funcRightArrow() {
    MsgBox("Ctrl+Shift+Alt+F13+Right")
}

funcNumLock() {
    MsgBox("Ctrl+Shift+Alt+F13+NumLock")
}

funcKeypadSlash() {
    MsgBox("Ctrl+Shift+Alt+F13+NumpadDiv")
}

funcKeypadAsterisk() {
    MsgBox("Ctrl+Shift+Alt+F13+NumpadMult")
}

funcKeypadMinus() {
    MsgBox("Ctrl+Shift+Alt+F13+NumpadSub")
}

funcKeypad7() {
    MsgBox("Ctrl+Shift+Alt+F13+Numpad7")
}

funcKeypad8() {
    MsgBox("Ctrl+Shift+Alt+F13+Numpad8")
}

funcKeypad9() {
    MsgBox("Ctrl+Shift+Alt+F13+Numpad9")
}

funcKeypadPlus() {
    MsgBox("Ctrl+Shift+Alt+F13+NumpadAdd")
}

funcKeypad4() {
    MsgBox("Ctrl+Shift+Alt+F13+Numpad4")
}

funcKeypad5() {
    MsgBox("Ctrl+Shift+Alt+F13+Numpad5")
}

funcKeypad6() {
    MsgBox("Ctrl+Shift+Alt+F13+Numpad6")
}

funcKeypad1() {
    MsgBox("Ctrl+Shift+Alt+F13+Numpad1")
}

funcKeypad2() {
    MsgBox("Ctrl+Shift+Alt+F13+Numpad2")
}

funcKeypad3() {
    MsgBox("Ctrl+Shift+Alt+F13+Numpad3")
}

funcKeypadEnter() {
    MsgBox("Ctrl+Shift+Alt+F13+NumpadEnter")
}

funcKeypad0() {
    MsgBox("Ctrl+Shift+Alt+F13+Numpad0")
}

funcKeypadPeriodAndDelete() {
    MsgBox("Ctrl+Shift+Alt+F13+NumpadDel")
}
