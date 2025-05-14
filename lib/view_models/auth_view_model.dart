import 'package:flutter/material.dart';
import 'package:random_task_provider/models/user_model.dart';

class AuthViewModel extends ChangeNotifier {
  String? _name;
  String? _email;
  String? _phoneNumber;
  String? _password;

  bool _isLoading = false;

  //for the getters
  String? get name => _name;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  bool get isLoading => _isLoading;

  //for the setters
  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  //for the SignUp process
  Future<void> signUp() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    //save the data
    UserModel user =
        UserModel(name: _name!, email: _email!, phoneNumber: _phoneNumber!);

    _isLoading = false;
    notifyListeners();
  }
}
