import 'package:dowallet/core/domain/entities/user_entity.dart';
import 'package:dowallet/core/routes/app_navigator.dart';
import 'package:dowallet/core/domain/session_manager.dart';
import 'package:dowallet/core/session/user_session.dart';
import 'package:dowallet/core/widgets/page_template.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Login',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login Screen'),
          TextField(decoration: const InputDecoration(labelText: 'user')),
          TextField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              SessionManager().saveSession(
                UserSession(
                  user: UserEntity(
                    id: 'asdasdqw',
                    name: 'Jhon Doe',
                    email: 'jhon@doe.com',
                  ),
                  token: 'tokenValidOMG',
                  tokenExpiration: DateTime.now().add(const Duration(days: 1)),
                ),
              );
              AppNavigator().replace(Routes.home);
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
