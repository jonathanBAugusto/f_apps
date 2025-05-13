import 'package:dowallet/core/routes/router.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static final AppNavigator _instance = AppNavigator._internal();
  AppNavigator._internal();
  factory AppNavigator() {
    return _instance;
  }

  Future<T?> push<T>(Routes route, dynamic arguments) async {
    return GoRouter.of(
      navigationKey.currentContext!,
    ).push<T>(route.path, extra: arguments);
  }

  Future<T?> replace<T>(Routes route, [dynamic arguments]) async {
    return GoRouter.of(
      navigationKey.currentContext!,
    ).replace<T>(route.path, extra: arguments);
  }
}
