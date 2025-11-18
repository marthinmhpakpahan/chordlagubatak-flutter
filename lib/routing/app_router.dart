import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../routing/route_names.dart';
import '../routing/route_paths.dart';
import '../routing/auth_guard.dart';

// Pages
import '../features/songs/presentation/pages/songs_list_page.dart';
import '../features/songs/presentation/pages/song_detail_page.dart';

import '../features/auth/presentation/login_page.dart';
import '../features/auth/presentation/register_page.dart';

import '../features/favorites/presentation/favorites_page.dart';

import '../features/requests/presentation/request_song_page.dart';
import '../features/requests/presentation/request_update_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.home,
  redirect: (context, state) {
    // Allow everything except protected routes
    final protectedRoutes = [
      RoutePaths.favorites,
      RoutePaths.requestSong,
    ];

    if (protectedRoutes.contains(state.subloc)) {
      return AuthGuard.checkLogin(context, state);
    }

    return null;
  },
  routes: [
    GoRoute(
      path: RoutePaths.home,
      name: RouteNames.home,
      builder: (_, __) => const SongsListPage(),
    ),

    GoRoute(
      path: RoutePaths.songDetail,
      name: RouteNames.songDetail,
      builder: (_, state) {
        final id = state.params['id']!;
        return SongDetailPage(songId: id);
      },
    ),

    GoRoute(
      path: RoutePaths.login,
      name: RouteNames.login,
      builder: (_, __) => const LoginPage(),
    ),

    GoRoute(
      path: RoutePaths.register,
      name: RouteNames.register,
      builder: (_, __) => const RegisterPage(),
    ),

    GoRoute(
      path: RoutePaths.favorites,
      name: RouteNames.favorites,
      builder: (_, __) => const FavoritesPage(),
    ),

    GoRoute(
      path: RoutePaths.requestSong,
      name: RouteNames.requestSong,
      builder: (_, __) => const RequestSongPage(),
    ),

    GoRoute(
      path: RoutePaths.requestUpdate,
      name: RouteNames.requestUpdate,
      builder: (_, state) {
        final id = state.params['id']!;
        return RequestUpdatePage(songId: id);
      },
    ),
  ],
);
