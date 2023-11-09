import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tools_tracking/persentation/app/app.dart';

import '../../helpers/hydrated_bloc.dart';
import '../../helpers/injections.dart';

void main() {
  initHydratedStorage();
  injectionUnit();

  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  group('App', () {
    testWidgets('renders app view', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          const App(),
        );
        await tester.pumpAndSettle();
        expect(find.byType(AppView), findsOneWidget);
      });
    });
  });
}
