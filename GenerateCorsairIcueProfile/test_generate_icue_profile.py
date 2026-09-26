import unittest
import os
import tempfile
import uuid
import xml.etree.ElementTree as ET
from unittest.mock import patch

from index import generate_icue_profile, _find_keyboard_actions_node, _build_assignment, KEY_LIST


class GenerateIcueProfileTests(unittest.TestCase):
    """Test suite for iCUE profile generation functionality."""

    def setUp(self):
        """Create temporary directory for test files."""
        self.test_dir = tempfile.mkdtemp()

    def tearDown(self):
        """Clean up temporary test files."""
        for filename in os.listdir(self.test_dir):
            file_path = os.path.join(self.test_dir, filename)
            try:
                os.remove(file_path)
            except (FileNotFoundError, PermissionError):
                pass
        try:
            os.rmdir(self.test_dir)
        except (FileNotFoundError, PermissionError):
            pass

    @staticmethod
    def _build_valid_profile_xml():
        """Build a valid iCUE profile XML structure for testing."""
        return '''<?xml version="1.0" encoding="UTF-8"?>
        <root>
          <profile>
            <keyboard>
              <key>Keyboard</key>
              <properties>
                <value0>
                  <ptr_wrapper>
                    <data>
                      <actions size="dynamic" />
                    </data>
                  </ptr_wrapper>
                </value0>
              </properties>
            </keyboard>
          </profile>
        </root>
        '''

    @staticmethod
    def _build_invalid_xml_profile():
        """Build an invalid XML structure for negative testing."""
        return '''<?xml version="1.0" encoding="UTF-8"?>
        <root>
          <profile>
            <keyboard>
              <key>Keyboard</key>
              <properties>
                <value0>
                  <ptr_wrapper>
                    <data>
                      <!-- Missing actions node -->
                    </data>
                  </ptr_wrapper>
                </value0>
              </properties>
            </keyboard>
          </profile>
        </root>
        '''

    @staticmethod
    def _build_malformed_xml():
        """Build malformed XML for parsing error testing."""
        return '''<?xml version="1.0" encoding="UTF-8"?>
        <root>
          <profile>
            <keyboard>
              <key>Keyboard</key>
              <properties>
                <value0>
                  <ptr_wrapper>
                    <data>
                      <actions size="dynamic" />
                    </data>
                  </ptr_wrapper>
                </value0>
              </properties>
            </keyboard>
          </profile>
        <!-- Missing closing root tag -->
        '''

    def test_generate_icue_profile_creates_full_key_remaps(self):
        """AC 2 & AC 3: Verify all keys in KEY_LIST are remapped with F13 + Ctrl + Alt + Shift + Key combination."""
        source = os.path.join(self.test_dir, 'test_source.cueprofile')
        output = os.path.join(self.test_dir, 'test_output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_valid_profile_xml())

        result = generate_icue_profile(source, output)
        
        self.assertIsNotNone(result, "Function should return output path on success")
        self.assertEqual(result, output, "Should return the correct output path")

        with open(output, 'rb') as f:
            data = f.read()
        self.assertTrue(data.startswith(b'<?xml version="1.0" encoding="UTF-8"?>'),
                       "AC 4: Output should have proper XML declaration")

        root = ET.parse(output).getroot()
        actions = next(root.iter('actions'))
        self.assertEqual(actions.attrib.get('size'), 'dynamic',
                        "Actions node should have dynamic size attribute")

        # Verify all keys are present
        self.assertEqual(len(actions), len(KEY_LIST), f"Should have exactly {len(KEY_LIST)} action assignments")

        # Track UUIDs to ensure uniqueness
        uuids = set()
        ptr_ids = set()

        for index, key in enumerate(KEY_LIST):
            value = actions.find(f'value{index}')
            self.assertIsNotNone(value, f'Value node for key {key} should exist')

            # Verify trigger key
            self.assertEqual(value.find('second/key').text, key,
                           f'Trigger key should be {key}')

            # Verify modifier stack
            self.assertEqual(value.find('first/ptr_wrapper/data/keyStroke/value0').text, 'F13',
                           'First modifier should be F13')
            self.assertEqual(value.find('first/ptr_wrapper/data/keyStroke/value1').text, 'LeftCtrl',
                           'Second modifier should be LeftCtrl')
            self.assertEqual(value.find('first/ptr_wrapper/data/keyStroke/value2').text, 'LeftShift',
                           'Third modifier should be LeftShift')
            self.assertEqual(value.find('first/ptr_wrapper/data/keyStroke/value3').text, 'LeftAlt',
                           'Fourth modifier should be LeftAlt')
            self.assertEqual(value.find('first/ptr_wrapper/data/keyStroke/value4').text, key,
                           f'Fifth key should be {key}')

            # Verify execHint matches original structure
            exec_hint = value.find('first/ptr_wrapper/data/base/executionHints/execHint')
            self.assertEqual(exec_hint.text, 'OnPress', 'execHint should be OnPress to match original')

            # Verify UUID uniqueness (AC 3)
            action_id = value.find('first/ptr_wrapper/data/base/id').text
            self.assertIsNotNone(action_id, 'Action should have a UUID')
            self.assertNotIn(action_id, uuids, 'UUIDs should be unique across all actions')
            uuids.add(action_id)

            # Verify pointer ID uniqueness and sequential pattern
            ptr_id = value.find('first/ptr_wrapper/id').text
            self.assertIsNotNone(ptr_id, 'Action should have a pointer ID')
            self.assertNotIn(ptr_id, ptr_ids, 'Pointer IDs should be unique')
            ptr_ids.add(ptr_id)

            # Verify UUID format
            try:
                uuid.UUID(action_id.strip('{}'))
            except ValueError:
                self.fail(f'Action ID should be a valid UUID: {action_id}')

            # Verify cereal_class_version tags match original structure
            base_version = value.find('first/ptr_wrapper/data/base/cereal_class_version')
            self.assertIsNotNone(base_version, 'Base should have cereal_class_version')
            self.assertEqual(base_version.text, '202', 'Base version should be 202')

            repeat_version = value.find('first/ptr_wrapper/data/base/repeatOptions/cereal_class_version')
            self.assertIsNotNone(repeat_version, 'RepeatOptions should have cereal_class_version')
            self.assertEqual(repeat_version.text, '300', 'RepeatOptions version should be 300')

            exec_version = value.find('first/ptr_wrapper/data/base/executionHints/cereal_class_version')
            self.assertIsNotNone(exec_version, 'ExecutionHints should have cereal_class_version')
            self.assertEqual(exec_version.text, '201', 'ExecutionHints version should be 201')

            second_version = value.find('second/cereal_class_version')
            self.assertIsNotNone(second_version, 'Second block should have cereal_class_version')
            self.assertEqual(second_version.text, '400', 'Second version should be 400')

    def test_generate_icue_profile_handles_missing_input_file(self):
        """Negative test: Verify graceful handling of missing input file."""
        non_existent = os.path.join(self.test_dir, 'does_not_exist.cueprofile')
        output = os.path.join(self.test_dir, 'output.cueprofile')

        result = generate_icue_profile(non_existent, output)
        
        self.assertIsNone(result, "Should return None when input file not found")
        self.assertFalse(os.path.exists(output), "Output file should not be created on error")

    def test_generate_icue_profile_handles_malformed_xml(self):
        """Negative test: Verify graceful handling of malformed XML."""
        source = os.path.join(self.test_dir, 'malformed.cueprofile')
        output = os.path.join(self.test_dir, 'output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_malformed_xml())

        result = generate_icue_profile(source, output)
        
        self.assertIsNone(result, "Should return None for malformed XML")
        self.assertFalse(os.path.exists(output), "Output file should not be created on parse error")

    def test_generate_icue_profile_handles_missing_actions_node(self):
        """Negative test: Verify graceful handling when actions node is missing."""
        source = os.path.join(self.test_dir, 'no_actions.cueprofile')
        output = os.path.join(self.test_dir, 'output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_invalid_xml_profile())

        result = generate_icue_profile(source, output)
        
        self.assertIsNone(result, "Should return None when actions node is missing")
        self.assertFalse(os.path.exists(output), "Output file should not be created on missing node")

    def test_generate_icue_profile_uses_default_paths(self):
        """Verify function works with default path parameters."""
        source = os.path.join(self.test_dir, 'test_source.cueprofile')
        output = os.path.join(self.test_dir, 'test_output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_valid_profile_xml())

        # Call with no parameters (should use defaults, but we override for test)
        result = generate_icue_profile(source, output)
        
        self.assertIsNotNone(result, "Should succeed with provided paths")

    def test_find_keyboard_actions_node_valid_structure(self):
        """Unit test: Verify _find_keyboard_actions_node finds correct node."""
        xml_str = self._build_valid_profile_xml()
        root = ET.fromstring(xml_str)
        
        actions = _find_keyboard_actions_node(root)
        
        self.assertIsNotNone(actions, "Should find actions node in valid structure")
        self.assertEqual(actions.tag, 'actions', "Found node should be actions")

    def test_find_keyboard_actions_node_missing_keyboard(self):
        """Unit test: Verify _find_keyboard_actions_node returns None when keyboard missing."""
        xml_str = '''<?xml version="1.0" encoding="UTF-8"?>
        <root>
          <profile>
            <mouse>
              <key>Mouse</key>
            </mouse>
          </profile>
        </root>
        '''
        root = ET.fromstring(xml_str)
        
        actions = _find_keyboard_actions_node(root)
        
        self.assertIsNone(actions, "Should return None when keyboard node not found")

    def test_build_assignment_creates_correct_structure(self):
        """Unit test: Verify _build_assignment creates correct XML structure."""
        key = 'A'
        index = 0
        
        assignment = _build_assignment(key, index)
        
        self.assertEqual(assignment.tag, 'value0', "Root tag should be value0")
        self.assertEqual(assignment.find('second/key').text, 'A',
                        "Trigger key should be A")
        self.assertEqual(assignment.find('first/ptr_wrapper/data/keyStroke/value0').text, 'F13',
                        "First modifier should be F13")
        self.assertEqual(assignment.find('first/ptr_wrapper/data/keyStroke/value1').text, 'LeftCtrl',
                        "Second modifier should be LeftCtrl")
        self.assertEqual(assignment.find('first/ptr_wrapper/data/keyStroke/value2').text, 'LeftShift',
                        "Third modifier should be LeftShift")
        self.assertEqual(assignment.find('first/ptr_wrapper/data/keyStroke/value3').text, 'LeftAlt',
                        "Fourth modifier should be LeftAlt")
        self.assertEqual(assignment.find('first/ptr_wrapper/data/keyStroke/value4').text, 'A',
                        "Fifth key should be A")
        
        # Verify cereal_class_version tags are present (matching original structure)
        self.assertEqual(assignment.find('first/ptr_wrapper/data/base/cereal_class_version').text, '202',
                        "Base should have cereal_class_version 202")
        self.assertEqual(assignment.find('first/ptr_wrapper/data/base/repeatOptions/cereal_class_version').text, '300',
                        "RepeatOptions should have cereal_class_version 300")
        self.assertEqual(assignment.find('first/ptr_wrapper/data/base/executionHints/cereal_class_version').text, '201',
                        "ExecutionHints should have cereal_class_version 201")
        self.assertEqual(assignment.find('second/cereal_class_version').text, '400',
                        "Second block should have cereal_class_version 400")

    def test_build_assignment_generates_unique_uuids(self):
        """Unit test: Verify _build_assignment generates unique UUIDs."""
        assignments = [_build_assignment(letter, i) for i, letter in enumerate('ABC')]
        
        uuids = [a.find('first/ptr_wrapper/data/base/id').text for a in assignments]
        
        self.assertEqual(len(set(uuids)), len(uuids),
                        "Each assignment should have a unique UUID")

    def test_build_assignment_sequential_pointer_ids(self):
        """Unit test: Verify _build_assignment generates sequential pointer IDs."""
        # Test with first few keys
        test_keys = KEY_LIST[:5]
        assignments = [_build_assignment(key, i) for i, key in enumerate(test_keys)]
        
        ptr_ids = [int(a.find('first/ptr_wrapper/id').text) for a in assignments]
        
        expected_ids = [2147483651 + (i * 2) for i in range(5)]
        self.assertEqual(ptr_ids, expected_ids,
                        "Pointer IDs should follow sequential pattern")

    def test_key_list_comprehensive_coverage(self):
        """Verify KEY_LIST contains expected keys and comprehensive coverage."""
        # Verify total count
        self.assertEqual(len(KEY_LIST), 115, "KEY_LIST should contain 115 keys")
        
        # Verify key categories are present
        self.assertIn("G1", KEY_LIST, "Should contain G-keys")
        self.assertIn("Escape", KEY_LIST, "Should contain function row keys")
        self.assertIn("A", KEY_LIST, "Should contain alphabet keys")
        self.assertIn("Space", KEY_LIST, "Should contain spacebar")
        self.assertIn("Keypad0", KEY_LIST, "Should contain numpad keys")
        self.assertIn("UpArrow", KEY_LIST, "Should contain arrow keys")
        
        # Verify new naming convention
        self.assertIn("GraveAccentAndTilde", KEY_LIST, "Should use new naming convention")
        self.assertIn("BracketLeft", KEY_LIST, "Should use new naming convention")
        self.assertIn("KeypadSlash", KEY_LIST, "Should use new naming convention")
        
        # Verify no duplicates
        self.assertEqual(len(KEY_LIST), len(set(KEY_LIST)), "KEY_LIST should not contain duplicates")

    def test_f13_modifier_first_position(self):
        """Verify F13 is always the first modifier in the key combination."""
        source = os.path.join(self.test_dir, 'test_source.cueprofile')
        output = os.path.join(self.test_dir, 'test_output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_valid_profile_xml())

        generate_icue_profile(source, output)

        root = ET.parse(output).getroot()
        actions = next(root.iter('actions'))

        # Verify F13 is first modifier for all keys
        for index, key in enumerate(KEY_LIST):
            value = actions.find(f'value{index}')
            first_modifier = value.find('first/ptr_wrapper/data/keyStroke/value0')
            self.assertEqual(first_modifier.text, 'F13',
                           f'F13 should be first modifier for key {key}')

    def test_five_key_combination_structure(self):
        """Verify each remap uses exactly 5 keys in the combination."""
        source = os.path.join(self.test_dir, 'test_source.cueprofile')
        output = os.path.join(self.test_dir, 'test_output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_valid_profile_xml())

        generate_icue_profile(source, output)

        root = ET.parse(output).getroot()
        actions = next(root.iter('actions'))

        # Verify 5-value structure for all keys
        for index, key in enumerate(KEY_LIST):
            value = actions.find(f'value{index}')
            key_stroke = value.find('first/ptr_wrapper/data/keyStroke')
            
            # Count value children
            value_children = [child for child in key_stroke if child.tag.startswith('value')]
            self.assertEqual(len(value_children), 5,
                           f'Key {key} should have exactly 5 values in combination')

    def test_specific_key_categories_validation(self):
        """Validate specific key categories are properly remapped."""
        source = os.path.join(self.test_dir, 'test_source.cueprofile')
        output = os.path.join(self.test_dir, 'test_output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_valid_profile_xml())

        generate_icue_profile(source, output)

        root = ET.parse(output).getroot()
        actions = next(root.iter('actions'))

        # Test specific key categories
        test_keys = {
            'G1': 'G-key',
            'Escape': 'Function key',
            'A': 'Alphabet key',
            'Space': 'Special key',
            'Keypad0': 'Numpad key',
            'UpArrow': 'Navigation key',
            'GraveAccentAndTilde': 'Special character key'
        }

        for key_name, category in test_keys.items():
            if key_name in KEY_LIST:
                index = KEY_LIST.index(key_name)
                value = actions.find(f'value{index}')
                self.assertIsNotNone(value, f'{category} {key_name} should exist')
                
                # Verify the key is properly mapped
                trigger_key = value.find('second/key')
                self.assertEqual(trigger_key.text, key_name,
                               f'{category} should trigger {key_name}')

    def test_all_keys_have_unique_names(self):
        """Verify all generated assignments have unique names."""
        source = os.path.join(self.test_dir, 'test_source.cueprofile')
        output = os.path.join(self.test_dir, 'test_output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_valid_profile_xml())

        generate_icue_profile(source, output)

        root = ET.parse(output).getroot()
        actions = next(root.iter('actions'))

        names = set()
        for index, key in enumerate(KEY_LIST):
            value = actions.find(f'value{index}')
            name = value.find('first/ptr_wrapper/data/base/name').text
            self.assertNotIn(name, names, f'Name "{name}" should be unique')
            names.add(name)
            self.assertIn(key, name, f'Name should contain key {key}')

    def test_xml_structure_integrity(self):
        """Verify the complete XML structure is valid and well-formed."""
        source = os.path.join(self.test_dir, 'test_source.cueprofile')
        output = os.path.join(self.test_dir, 'test_output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_valid_profile_xml())

        generate_icue_profile(source, output)

        # Verify file is valid XML
        try:
            tree = ET.parse(output)
            root = tree.getroot()
        except ET.ParseError as e:
            self.fail(f'Output should be valid XML: {e}')

        # Verify root element exists
        self.assertIsNotNone(root, "Root element should exist")

        # Verify actions node exists and has correct attributes
        actions = next(root.iter('actions'))
        self.assertIsNotNone(actions, "Actions node should exist")
        self.assertEqual(actions.attrib.get('size'), 'dynamic',
                        "Actions should have dynamic size")

    def test_modifier_order_consistency(self):
        """Verify modifier order is consistent across all keys."""
        source = os.path.join(self.test_dir, 'test_source.cueprofile')
        output = os.path.join(self.test_dir, 'test_output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_valid_profile_xml())

        generate_icue_profile(source, output)

        root = ET.parse(output).getroot()
        actions = next(root.iter('actions'))

        expected_order = ['F13', 'LeftCtrl', 'LeftShift', 'LeftAlt']

        for index, key in enumerate(KEY_LIST):
            value = actions.find(f'value{index}')
            key_stroke = value.find('first/ptr_wrapper/data/keyStroke')
            
            for i, expected_modifier in enumerate(expected_order):
                actual_modifier = key_stroke.find(f'value{i}')
                self.assertEqual(actual_modifier.text, expected_modifier,
                               f'Modifier {i} should be {expected_modifier} for key {key}')

    def test_pointer_id_range_validation(self):
        """Verify pointer IDs are within expected range and follow pattern."""
        source = os.path.join(self.test_dir, 'test_source.cueprofile')
        output = os.path.join(self.test_dir, 'test_output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_valid_profile_xml())

        generate_icue_profile(source, output)

        root = ET.parse(output).getroot()
        actions = next(root.iter('actions'))

        pointer_ids = []
        for index, key in enumerate(KEY_LIST):
            value = actions.find(f'value{index}')
            ptr_id = int(value.find('first/ptr_wrapper/id').text)
            pointer_ids.append(ptr_id)

        # Verify sequential pattern
        expected_ids = [2147483651 + (i * 2) for i in range(len(KEY_LIST))]
        self.assertEqual(pointer_ids, expected_ids,
                        "Pointer IDs should follow expected sequential pattern")

        # Verify no duplicates
        self.assertEqual(len(pointer_ids), len(set(pointer_ids)),
                        "Pointer IDs should be unique")

    def test_large_scale_generation_performance(self):
        """Test that generating 114 keys completes successfully."""
        import time
        
        source = os.path.join(self.test_dir, 'test_source.cueprofile')
        output = os.path.join(self.test_dir, 'test_output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_valid_profile_xml())

        start_time = time.time()
        result = generate_icue_profile(source, output)
        end_time = time.time()

        self.assertIsNotNone(result, "Generation should succeed")
        self.assertLess(end_time - start_time, 5.0,
                       "Generation should complete in reasonable time (< 5 seconds)")

        # Verify all keys were generated
        root = ET.parse(output).getroot()
        actions = next(root.iter('actions'))
        self.assertEqual(len(actions), len(KEY_LIST),
                        f"All {len(KEY_LIST)} keys should be generated")

    def test_output_file_encoding(self):
        """AC 4: Verify output file uses UTF-8 encoding."""
        source = os.path.join(self.test_dir, 'test_source.cueprofile')
        output = os.path.join(self.test_dir, 'test_output.cueprofile')
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(self._build_valid_profile_xml())

        generate_icue_profile(source, output)

        # Read as binary to verify encoding declaration
        with open(output, 'rb') as f:
            content = f.read()
        
        self.assertIn(b'encoding="UTF-8"', content,
                     "Output should specify UTF-8 encoding")

    def test_preserves_existing_xml_structure(self):
        """Verify that non-keyboard elements are preserved in output."""
        source = os.path.join(self.test_dir, 'test_source.cueprofile')
        output = os.path.join(self.test_dir, 'test_output.cueprofile')
        
        xml_with_extra = '''<?xml version="1.0" encoding="UTF-8"?>
        <root>
          <profile>
            <mouse>
              <key>Mouse</key>
              <dpi>1600</dpi>
            </mouse>
            <keyboard>
              <key>Keyboard</key>
              <properties>
                <value0>
                  <ptr_wrapper>
                    <data>
                      <actions size="dynamic" />
                    </data>
                  </ptr_wrapper>
                </value0>
              </properties>
            </keyboard>
            <lighting>
              <mode>RGB</mode>
            </lighting>
          </profile>
        </root>
        '''
        
        with open(source, 'w', encoding='utf-8') as f:
            f.write(xml_with_extra)

        generate_icue_profile(source, output)

        root = ET.parse(output).getroot()
        
        # Verify mouse and lighting nodes are preserved
        self.assertIsNotNone(root.find('.//mouse'), "Mouse node should be preserved")
        self.assertIsNotNone(root.find('.//lighting'), "Lighting node should be preserved")
        self.assertEqual(root.find('.//mouse/dpi').text, '1600',
                        "Mouse DPI setting should be preserved")

    @patch('builtins.print')
    def test_error_messages_printed_on_failure(self, mock_print):
        """Verify appropriate error messages are printed on failures."""
        # Test file not found error
        result = generate_icue_profile('nonexistent.cueprofile', 'output.cueprofile')
        mock_print.assert_called()
        error_message = str(mock_print.call_args[0][0])
        self.assertIn('not found', error_message.lower(),
                     "Error message should mention file not found")

        # Test malformed XML error
        source = os.path.join(self.test_dir, 'malformed.cueprofile')
        with open(source, 'w', encoding='utf-8') as f:
            f.write('<invalid><xml>')
        
        mock_print.reset_mock()
        result = generate_icue_profile(source, 'output.cueprofile')
        mock_print.assert_called()
        error_message = str(mock_print.call_args[0][0])
        self.assertIn('parse', error_message.lower(),
                     "Error message should mention parse error")

    def test_with_actual_profile_file(self):
        """Integration test: Verify script works with the actual profile file."""
        # Check if the actual profile file exists in project directory
        actual_profile = "AutoHotKey Profile.cueprofile"
        if not os.path.exists(actual_profile):
            self.skipTest(f"Actual profile file not found: {actual_profile}")
        
        output = os.path.join(self.test_dir, 'actual_profile_output.cueprofile')
        
        result = generate_icue_profile(actual_profile, output)
        
        self.assertIsNotNone(result, "Should successfully process actual profile file")
        self.assertTrue(os.path.exists(output), "Output file should be created")
        
        # Verify the output is valid XML
        root = ET.parse(output).getroot()
        actions = _find_keyboard_actions_node(root)
        self.assertIsNotNone(actions, "Should find actions node in actual profile")
        self.assertEqual(len(actions), len(KEY_LIST), f"Should have {len(KEY_LIST)} key remaps")


if __name__ == '__main__':
    unittest.main(verbosity=2)
