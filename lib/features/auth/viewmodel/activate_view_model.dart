import 'package:flutter/foundation.dart';

class ActivateViewModel with ChangeNotifier {
  String? _accountNumber;
  String? _phoneNumber;

  String? get accountNumber => _accountNumber;
  String? get phoneNumber => _phoneNumber;

  void setAccountNumber(String value) {
    _accountNumber = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  Future<void> activateAccount() async {
    if (_validateInputs()) {
      // Implement your actual activation logic here
      await Future.delayed(const Duration(seconds: 1)); // Example API call
    }
  }

  bool _validateInputs() {
    return _accountNumber?.isNotEmpty == true &&
        _phoneNumber?.isNotEmpty == true;
  }

  String? get accountNumberError {
    if (_accountNumber?.isEmpty ?? true) return 'Required field';
    return null;
  }

  String? get phoneNumberError {
    if (_phoneNumber?.isEmpty ?? true) return 'Required field';
    return null;
  }
}