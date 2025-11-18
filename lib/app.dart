import 'package:flutter/material.dart';
import 'routing/app_router.dart';

class LyricsApp extends StatelessWidget {
  const LyricsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
