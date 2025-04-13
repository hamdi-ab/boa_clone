import 'package:boa_clone/features/auth/data/local_auth_data.dart';
import 'package:boa_clone/core/auth_state.dart';
import 'package:flutter/cupertino.dart';

class SignInViewModel with ChangeNotifier {
  final AuthState? authState;

  SignInViewModel({this.authState});

  final String _correctPhone = "0912345678";
  final String _correctPin = "1234";

  final LocalAuthService _authService = LocalAuthService();

  String _phoneNumber = '';
  String _pin = '';
  bool _isExpanded = false;
  String? errorMessage;

  bool get isExpanded => _isExpanded;
  void toggleExpansion() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  // Getters
  String get phoneNumber => _phoneNumber;
  String get pin => _pin;

  // Setters
  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setPin(String value) {
    _pin = value;
    notifyListeners();
  }
  bool validateLogin() {
    return _phoneNumber == _correctPhone && _pin == _correctPin;
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  bool _validateInputs() {
    if (_phoneNumber.isEmpty || _pin.isEmpty) {
      errorMessage = 'Please fill all fields';
      notifyListeners();
      return false;
    }
    return true;
  }
}