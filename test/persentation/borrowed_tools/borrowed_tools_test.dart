import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tools_tracking/persentation/borrowed_tools/bloc/borrowed_tools_bloc.dart';
import 'package:tools_tracking/persentation/borrowed_tools/borrowed_tools.dart';
import 'package:tools_tracking/persentation/borrowed_tools/models/borrowed_tools.dart';
import 'package:tools_tracking/persentation/friends/bloc/friends_bloc.dart';
import 'package:tools_tracking/persentation/friends/models/friends.dart';
import 'package:tools_tracking/persentation/tools/models/tools.dart';

import '../../helpers/hydrated_bloc.dart';
import '../../helpers/injections.dart';

void main() {
  initHydratedStorage();
  injectionUnit();

  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  group('Borrowed Tools Page', () {
    late BorrowedToolsBloc borrowedBloc;
    late FriendsBloc friendsBloc;

    setUp(() {
      borrowedBloc = getIt<BorrowedToolsBloc>();
      friendsBloc = getIt<FriendsBloc>();
    });

    testWidgets('renders tools view', (tester) async {
      when(() => borrowedBloc.state).thenReturn(const BorrowedToolsState());
      when(() => friendsBloc.state).thenReturn(const FriendsState());
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BorrowedToolsPage(
              toolsId: Tools.jokoTools.first.idUnique,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(BorrowedToolsView), findsOneWidget);
    });

    testWidgets('check whos borrow the tools', (tester) async {
      final toolsId = Tools.jokoTools.first.idUnique;
      when(() => borrowedBloc.state).thenReturn(
        BorrowedToolsState(
          borrowed: [
            BorrowedTools(userId: 'userId', toolId: toolsId, borrowedCount: 1)
          ],
        ),
      );
      when(() => friendsBloc.state).thenReturn(
        FriendsState(
          friends: [
            Friends(name: 'userTest', uid: 'userId'),
          ],
        ),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BorrowedToolsPage(
              toolsId: Tools.jokoTools.first.idUnique,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('_listTileOntapBorrowToUser')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('_BorrowedToolsUsers')), findsOneWidget);
    });
  });
}
