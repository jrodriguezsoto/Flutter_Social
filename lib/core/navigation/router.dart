import 'package:flutter/material.dart';
import 'package:flutter_social/core/shell/shell_scaffold.dart';
import 'package:flutter_social/features/feed/models/post.dart';
import 'package:flutter_social/features/feed/presentation/page/feed.dart';
import 'package:flutter_social/features/feed/presentation/widgets/post_detail.dart';
import 'package:flutter_social/features/profile/presentation/page/profile.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _profileNavigatorKey = GlobalKey<NavigatorState>();
final _feedNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  initialLocation: "/feed",
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ShellScaffold(child: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _feedNavigatorKey,
          routes: [
            GoRoute(
              path: "/feed",
              builder: (context, state) => FeedScreen(),
              routes: [detailRoute],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: "/profile",
              builder: (context, state) => ProfileScreen(),
              routes: [detailRoute],
            ),
          ],
        ),
      ],
    ),
  ],
);

GoRoute detailRoute = GoRoute(
  path: "/detail",
  builder: (context, state) {
    PostModel post = state.extra as PostModel;
    return PostDetail(post: post);
  },
);
