import 'package:flutter_test/flutter_test.dart';
import 'package:cafeteria/main.dart';

void main() {
  testWidgets('La aplicacion muestra el pedido inicial',
      (WidgetTester tester) async {
    await tester.pumpWidget(const CafeteriaApp());

    expect(find.text('Mi pedido'), findsOneWidget);
    expect(find.text('Total: Q0.00'), findsOneWidget);
  });
}