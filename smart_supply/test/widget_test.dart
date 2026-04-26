import 'package:flutter_test/flutter_test.dart';
import 'package:smart_supply/main.dart';

void main() {
  testWidgets('Splash screen displays app name', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartSupplyApp());

    // Verify splash screen shows the app name
    expect(find.text('Smart Supply'), findsOneWidget);
    expect(find.text('Sourcing China'), findsOneWidget);
  });
}
