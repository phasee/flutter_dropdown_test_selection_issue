import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:testing_dropdown_tap_issue/main.dart';
import 'package:testing_dropdown_tap_issue/model.dart';

class MockModel extends Mock implements Model {}

main() {
  MockModel model;

  setUp(() {
    model = MockModel();
  });

  testWidgets('Test dropdown menu item selection', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MyApp(model: model),
        ),
      ),
    );

    await tester.tap(find.byKey(Key('0')));

    final valueOne = find.byKey(Key('1'));
    expect(valueOne, findsOneWidget);

    await tester.tap(valueOne);
    verify(model.updateSelection(any)).called(1);
  });
}
