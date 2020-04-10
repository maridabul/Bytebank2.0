

import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/matchers.dart';

void main (){

  testWidgets('Should display the main image when Dashboard is opened', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard(),));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });

  testWidgets('Should display the transfer feature when Dashboard is opened', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard(),));
    final transferFeature = find.byWidgetPredicate((widget) {
      return featureItemMatcher(widget, 'Transfer', Icons.monetization_on);
    });
    expect(transferFeature, findsOneWidget);
  });

  testWidgets('Should display the transaction feed feature when Dashboard is opened', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard(),));
    final transactionFeedFeature = find.byWidgetPredicate((widget) {
      return featureItemMatcher(widget, 'Transaction Feed', Icons.description);
    });
    expect(transactionFeedFeature, findsOneWidget);
  });


}
