import 'package:boa_clone/features/auth/model/user_model.dart';

class LocalAuthService {
  // Local list of predefined users
  final List<User> _users = const [
    User(phoneNumber: "0912345678", pin: "1234"),
    User(phoneNumber: "0987654321", pin: "4321"),
  ];

  User? authenticate(String phoneNumber, String pin) {
    return _users.firstWhere(
          (user) => user.phoneNumber == phoneNumber && user.pin == pin,
      orElse: () => const User(phoneNumber: '', pin: ''),
    );
  }

  bool userExists(String phoneNumber) {
    return _users.any((user) => user.phoneNumber == phoneNumber);
  }
}