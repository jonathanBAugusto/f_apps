import 'package:dowallet/core/routes/router.dart';
import 'package:dowallet/core/domain/session_manager.dart';
import 'package:flutter/material.dart';

void main() {
  SessionManager().loadSession();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
    );
  }
}
