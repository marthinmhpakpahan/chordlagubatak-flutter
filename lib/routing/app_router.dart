import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/songs/presentation/pages/songs_list_page.dart';
import '../features/songs/presentation/pages/song_detail_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const SongsListPage(),
    ),
    GoRoute(
      path: '/song/:id',
      builder: (_, state) => SongDetailPage(songId: state.params['id']!),
    ),
  ],
);
