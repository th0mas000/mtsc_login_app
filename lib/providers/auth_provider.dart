import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isPasswordVisible = false;
  String _username = '';
  String _password = '';
  String? _usernameError;
  String? _passwordError;

  bool get isPasswordVisible => _isPasswordVisible;
  String get username => _username;
  String get password => _password;
  String? get usernameError => _usernameError;
  String? get passwordError => _passwordError;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void setUsername(String value) {
    _username = value;
    _usernameError = null;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _passwordError = null;
    notifyListeners();
  }

  bool validateInputs() {
    bool isValid = true;

    // Username validation
    if (_username.isEmpty) {
      _usernameError = 'กรุณาใส่ชื่อผู้ใช้';
      isValid = false;
    } else if (_username.trim().length < 3) {
      _usernameError = 'ชื่อผู้ใช้ต้องมีอย่างน้อย 3 ตัวอักษร';
      isValid = false;
    } else {
      _usernameError = null;
    }

    // Password validation
    if (_password.isEmpty) {
      _passwordError = 'กรุณาใส่รหัสผ่าน';
      isValid = false;
    } else if (_password.length < 3) {
      _passwordError = 'รหัสผ่านต้องมีอย่างน้อย 3 ตัวอักษร';
      isValid = false;
    } else {
      _passwordError = null;
    }

    notifyListeners();
    return isValid;
  }

  Future<bool> login() async {
    // First validate inputs and return false if validation fails
    if (!validateInputs()) {
      return false;
    }
    
    // Mock login delay
    await Future.delayed(const Duration(seconds: 1));
    
    // For demo purposes, check if username and password match expected values
    // This simulates a real authentication check
    if (_username == 'admin' && _password == '123') {
      return true;
    } else {
      // Add an error message for invalid credentials
      _passwordError = 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง';
      notifyListeners();
      return false;
    }
  }
}