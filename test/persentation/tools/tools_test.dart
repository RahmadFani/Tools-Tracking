import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tools_tracking/persentation/borrowed_tools/bloc/borrowed_tools_bloc.dart';
import 'package:tools_tracking/persentation/tools/tools.dart';

import '../../helpers/hydrated_bloc.dart';
import '../../helpers/injections.dart';

void main() {
  initHydratedStorage();
  injectionUnit();

  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  group('Tools Page', () {
    late BorrowedToolsBloc borrowedBloc;

    setUp(() {
      borrowedBloc = getIt<BorrowedToolsBloc>();
    });

    testWidgets('renders tools view', (tester) async {
      when(() => borrowedBloc.state).thenReturn(const BorrowedToolsState());
      await tester.pumpWidget(const MaterialApp(home: ToolsPage()));
      await tester.pumpAndSettle();
      expect(find.byType(ToolsView), findsOneWidget);
    });
  });
}
