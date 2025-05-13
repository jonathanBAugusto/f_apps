import 'package:dowallet/core/session/user_session.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();
  factory SessionManager() => _instance;
  SessionManager._internal();

  UserSession? _session;

  UserSession? get session => _session;

  Future<void> saveSession(UserSession session) async {
    _session = session;
  }

  Future<void> loadSession() async {
    print('Loading session...');
  }

  Future<void> clearSession() async {
    _session = null;
  }
}
