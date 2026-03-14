
abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final String username;
  final String password;

  LoginSubmitted(this.username, this.password);
}

class LogoutRequested extends LoginEvent {}

class UpdateProfile extends LoginEvent {
  final String newUsername;
  final String newPassword;

  UpdateProfile(this.newUsername, this.newPassword);
}