import 'package:flutter_test/flutter_test.dart';
import 'package:foxo/app.dart';

void main() {
  testWidgets('finds a title', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    expect(find.text('Foxo'), findsOneWidget);
  });
}
