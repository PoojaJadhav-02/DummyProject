import 'package:figmaproject/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _loadInter() async {
  final loader = FontLoader('Inter');
  for (final asset in const [
    'assets/fonts/Inter-Regular.ttf',
    'assets/fonts/Inter-Medium.ttf',
    'assets/fonts/Inter-SemiBold.ttf',
  ]) {
    final data = await rootBundle.load(asset);
    loader.addFont(Future<ByteData>.value(data));
  }
  await loader.load();
}

void main() {
  setUpAll(_loadInter);

  testWidgets('create account screen shows the designed copy', (tester) async {
    await tester.pumpWidget(const ReviveApp());
    await tester.pump();

    expect(find.textContaining('Create your'), findsWidgets);
    expect(find.text('Step 1 of 2'), findsOneWidget);
    expect(find.text('First Name'), findsOneWidget);
    expect(find.text('Last Name'), findsOneWidget);
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('Gender'), findsOneWidget);
    expect(find.text('Male'), findsOneWidget);
    expect(find.text('Female'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);
    expect(find.textContaining('Log in'), findsOneWidget);
    expect(
      find.text('PEOPLE  ·  PLANET  ·  PURPOSE  ·  TOGETHER'),
      findsOneWidget,
    );
    expect(find.text('Revive'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('gender selection and password visibility respond', (
      tester,
      ) async {
    await tester.pumpWidget(const ReviveApp());
    await tester.pump();

    final fields = tester
        .widgetList<TextField>(find.byType(TextField))
        .toList();
    expect(fields, hasLength(5));
    expect(fields[3].obscureText, isTrue);
    expect(fields[4].obscureText, isTrue);

    await tester.ensureVisible(find.byKey(const Key('password-visibility')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('password-visibility')));
    await tester.pump();

    final revealed = tester
        .widgetList<TextField>(find.byType(TextField))
        .toList();
    expect(revealed[3].obscureText, isFalse);
    expect(revealed[4].obscureText, isTrue);

    await tester.tap(find.text('Female'));
    await tester.pump();
    expect(find.text('Female'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), 'Asha');
    await tester.pump();
    expect(find.text('Asha'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
