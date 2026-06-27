import 'package:flutter_test/flutter_test.dart';
import 'package:adstacks_dashboard/main.dart';

void main() {
  testWidgets('Dashboard renders home title', (tester) async {
    await tester.pumpWidget(const AdstacksDashboardApp());
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsWidgets);
    expect(find.text('All Projects'), findsOneWidget);
    expect(find.text('Top Creators'), findsOneWidget);
  });
}
