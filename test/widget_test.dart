// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:workshop_test/main.dart';

void main() {
  testWidgets('My app has a search box', (WidgetTester tester) async {
    await tester.pumpWidget(TravelAppWrapper());

    final searchBoxFinder = find.byKey(Key("Search box"));

    expect(searchBoxFinder, findsOneWidget);
  });
}
