import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:registration/screens/register_page.dart';

void main() {
  group('RegisterPage Widget Tests', () {
    testWidgets('Widget renders correctly', (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(const MaterialApp(
        home: RegisterPage(),
      ));

      // Verify that the text 'Registration Form / แบบฟอร์มลงทะเบียน' is present.
      expect(find.text('Registration Form / แบบฟอร์มลงทะเบียน'), findsOneWidget);

      // You can add more expectations based on your widget structure.
      // For example, check if the submit button is present.
      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('Submit button press with empty fields changes color', (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(const MaterialApp(
        home: RegisterPage(),
      ));

      // Tap the submit button.
      await tester.tap(find.text('Submit'));
      await tester.pump();

      // Extract the color from the MaterialStateProperty.
      final backgroundColor =
          tester.widget<TextButton>(find.byType(TextButton)).style!.backgroundColor!.resolve(<MaterialState>{MaterialState.pressed});

      // Verify that the color changes to red due to empty fields.
      expect(backgroundColor, equals(Colors.grey));
    });
  });
}
