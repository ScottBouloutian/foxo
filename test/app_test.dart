import 'package:flutter_test/flutter_test.dart';
import 'package:foxo_application/app.dart';

void main() {
  testWidgets('finds a title', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Can you outsmart Foxo?'), findsOneWidget);
  });
}
