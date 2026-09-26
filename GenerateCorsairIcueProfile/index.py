import uuid
import xml.etree.ElementTree as ET

# Default file paths (relative to project directory)
INPUT_PATH = "AutoHotKey Profile.cueprofile"
OUTPUT_PATH = "AutoHotKey Profile_Updated.cueprofile"

# Comprehensive key list for full keyboard remapping
KEY_LIST = [
    "G1", "G2", "G3", "G4", "G5", "G6",
    "MR", "Brightness", "WinLock",
    "Mute", "VolumeUp", "VolumeDown", "Stop", "PrevTrack", "PlayPause", "NextTrack",
    "Escape", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12",
    "Tilde", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "Minus", "Equals", "Backspace",
    "Tab", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "LeftBracket", "RightBracket", "Backslash",
    "CapsLock", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Semicolon", "Quote", "Enter",
    "Z", "X", "C", "V", "B", "N", "M", "Comma", "Period", "Slash",
    "LeftWin", "Spacebar", "RightWin", "Fn", "Menu",
    "PrintScreen", "ScrollLock", "PauseBreak",
    "Insert", "Home", "PageUp", "End", "PageDown",
    "UpArrow", "DownArrow", "LeftArrow", "RightArrow",
    "NumLock", "NumDivide", "NumMultiply", "NumMinus",
    "Num7", "Num8", "Num9", "NumPlus",
    "Num4", "Num5", "Num6",
    "Num1", "Num2", "Num3", "NumEnter",
    "Num0", "NumDecimal"
]


def _find_keyboard_actions_node(root):
    def walk(node):
        for child in list(node):
            if child.tag == "key" and child.text == "Keyboard":
                actions = node.find(".//actions")
                if actions is not None:
                    return actions
            found = walk(child)
            if found is not None:
                return found
        return None

    return walk(root)


def _build_assignment(letter, index):
    value = ET.Element(f"value{index}")

    first = ET.SubElement(value, "first")
    ET.SubElement(first, "polymorphic_id").text = "2147483666"
    ET.SubElement(first, "polymorphic_name").text = "KeyRemapAction"

    ptr_wrapper = ET.SubElement(first, "ptr_wrapper")
    ET.SubElement(ptr_wrapper, "id").text = str(2147483651 + (index * 2))

    data = ET.SubElement(ptr_wrapper, "data")
    ET.SubElement(data, "cereal_class_version").text = "400"

    base = ET.SubElement(data, "base")
    ET.SubElement(base, "cereal_class_version").text = "202"
    ET.SubElement(base, "name").text = f"Keystroke {letter}"
    ET.SubElement(base, "id").text = f"{{{uuid.uuid4()}}}"

    repeat_options = ET.SubElement(base, "repeatOptions")
    ET.SubElement(repeat_options, "cereal_class_version").text = "300"
    ET.SubElement(repeat_options, "repeatCount").text = "1"
    ET.SubElement(repeat_options, "repeatMode").text = "NoRepeat"
    ET.SubElement(repeat_options, "delay").text = "0"
    ET.SubElement(repeat_options, "delayMode").text = "Constant"
    ET.SubElement(repeat_options, "randomDelayFrom").text = "0"
    ET.SubElement(repeat_options, "randomDelayTo").text = "0"

    execution_hints = ET.SubElement(base, "executionHints")
    ET.SubElement(execution_hints, "cereal_class_version").text = "201"
    ET.SubElement(execution_hints, "terminateOnSecondExec").text = "false"
    ET.SubElement(execution_hints, "restartOnSecondExec").text = "false"
    ET.SubElement(execution_hints, "execHint").text = "OnPress"
    ET.SubElement(execution_hints, "retainOriginalKeyOutput").text = "false"

    ET.SubElement(base, "actionLighting").text = "{00000000-0000-0000-0000-000000000000}"
    ET.SubElement(base, "actionSoundPath").text = ""
    ET.SubElement(base, "attachedActions", size="dynamic")

    ET.SubElement(data, "keyName").text = ""

    key_stroke = ET.SubElement(data, "keyStroke", size="dynamic")
    ET.SubElement(key_stroke, "value0").text = "LeftCtrl"
    ET.SubElement(key_stroke, "value1").text = "LeftShift"
    ET.SubElement(key_stroke, "value2").text = "LeftAlt"
    ET.SubElement(key_stroke, "value3").text = letter

    ET.SubElement(data, "holdingKeyEnabled").text = "false"
    ET.SubElement(data, "holdingKeyType").text = "OnPress"
    ET.SubElement(data, "holdingKeyOnPressInterval").text = "100"
    ET.SubElement(data, "programPath").text = ""
    ET.SubElement(data, "sniperSwitchMode").text = "WhilePressed"
    ET.SubElement(data, "remapGroup").text = "7"

    second = ET.SubElement(value, "second")
    ET.SubElement(second, "cereal_class_version").text = "400"
    ET.SubElement(second, "key").text = letter
    ET.SubElement(second, "layer").text = "StandardLayer"
    ET.SubElement(second, "event").text = "Click"
    ET.SubElement(second, "distance").text = "0"

    return value


def generate_icue_profile(input_path=INPUT_PATH, output_path=OUTPUT_PATH):
    try:
        tree = ET.parse(input_path)
        root = tree.getroot()
    except FileNotFoundError:
        print(f"Error: The file at '{input_path}' was not found. Please verify the path.")
        return None
    except ET.ParseError:
        print("Error: Failed to parse the file. Ensure the file contains valid XML data.")
        return None

    actions_node = _find_keyboard_actions_node(root)
    if actions_node is None:
        print("Error: Could not locate the keyboard <actions> node in the XML profile.")
        return None

    actions_node.clear()
    actions_node.attrib["size"] = "dynamic"

    for index, key in enumerate(KEY_LIST):
        actions_node.append(_build_assignment(key, index))

    # Use a custom XML writer to preserve formatting and special characters
    def indent(elem, level=0):
        i = '\n' + level * '\t'
        if len(elem):
            if not elem.text or not elem.text.strip():
                elem.text = i + '\t'
            if not elem.tail or not elem.tail.strip():
                elem.tail = i
            for child in elem:
                indent(child, level + 1)
            if not child.tail or not child.tail.strip():
                child.tail = i
        else:
            if level and (not elem.tail or not elem.tail.strip()):
                elem.tail = i

    indent(root)

    with open(output_path, "wb") as output_file:
        output_file.write(b'<?xml version="1.0" encoding="UTF-8"?>\n')
        tree.write(output_file, encoding="utf-8", xml_declaration=False)

    print(f"\nSuccess! {len(KEY_LIST)} key remaps successfully written to:")
    print(f"-> {output_path}")
    print("You can now import this file straight into the iCUE desktop app.")
    return output_path


if __name__ == "__main__":
    generate_icue_profile()
