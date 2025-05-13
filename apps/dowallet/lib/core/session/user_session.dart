import 'package:dowallet/core/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class UserSession extends Equatable {
  final UserEntity user;
  final String token;
  final DateTime tokenExpiration;

  const UserSession({
    required this.user,
    required this.token,
    required this.tokenExpiration,
  });

  UserSession copyWith({
    UserEntity? user,
    String? token,
    DateTime? tokenExpiration,
  }) {
    return UserSession(
      user: user ?? this.user,
      token: token ?? this.token,
      tokenExpiration: tokenExpiration ?? this.tokenExpiration,
    );
  }

  bool get isAuthorized =>
      token.isNotEmpty && DateTime.now().isBefore(tokenExpiration);

  @override
  List<Object?> get props => [user, token, tokenExpiration];
}
