import 'package:dowallet/core/domain/session_manager.dart';
import 'package:dowallet/ui/home/widgets/home_screen.dart';
import 'package:dowallet/ui/login/widgets/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DummyPage extends StatelessWidget {
  final String title;
  const DummyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}

enum Routes {
  home('/home'),
  about('/about'),
  contact('/contact'),
  notFound('/not-found'),
  unauthorized('/unauthorized'),
  login('/login');

  final String path;

  const Routes(this.path);

  String get title => switch (this) {
    Routes.home => 'Home',
    Routes.about => 'About',
    Routes.contact => 'Contact',
    Routes.notFound => 'Not Found',
    Routes.unauthorized => 'Unauthorized',
    Routes.login => 'Login',
  };

  Widget Function(BuildContext, GoRouterState) get builder {
    debugPrint('Creating $title on $path');
    switch (this) {
      case Routes.home:
        return (context, state) => HomeScreen();
      case Routes.about:
        return (context, state) => DummyPage(title: Routes.about.title);
      case Routes.contact:
        return (context, state) => DummyPage(title: Routes.contact.title);
      case Routes.notFound:
        return (context, state) => DummyPage(title: Routes.notFound.title);
      case Routes.unauthorized:
        return (context, state) => DummyPage(title: Routes.unauthorized.title);
      case Routes.login:
        return (context, state) => LoginScreen();
    }
  }
}

final navigationKey = GlobalKey<NavigatorState>();

final routes = GoRouter(
  redirect: (context, state) {
    if (SessionManager().session?.isAuthorized != true) {
      return Routes.login.path;
    }
    return null;
  },
  initialLocation:
      SessionManager().session?.isAuthorized != true
          ? Routes.login.path
          : Routes.home.path,
  navigatorKey: navigationKey,
  routes: [
    GoRoute(path: '/', builder: Routes.home.builder),
    GoRoute(path: Routes.home.path, builder: Routes.home.builder),
    GoRoute(path: Routes.login.path, builder: Routes.login.builder),
  ],
);
