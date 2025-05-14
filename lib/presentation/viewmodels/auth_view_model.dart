// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:random_task_provider/presentation/views/home.dart';

class AuthViewModel extends ChangeNotifier {
  // Text Editing Controllers
  final firstNameTC = TextEditingController();
  final lastNameTC = TextEditingController();
  final emailTC = TextEditingController();
  final phoneTC = TextEditingController();
  final passwordTC = TextEditingController();
  final confirmPasswordTC = TextEditingController();

  // State variables
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _termsAccepted = false;
  bool get termsAccepted => _termsAccepted;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void toggleTermsAccepted(bool? value) {
    _termsAccepted = value ?? !_termsAccepted;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 5));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    _setLoading(false);
    clearControllers();
  }

  Future<void> signUp(BuildContext context) async {
    if (!_termsAccepted) {
      debugPrint("Terms not accepted");
      return;
    }
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 5));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    _setLoading(false);
    clearControllers();
  }

  void clearControllers() {
    firstNameTC.clear();
    lastNameTC.clear();
    emailTC.clear();
    phoneTC.clear();
    passwordTC.clear();
    confirmPasswordTC.clear();
    _termsAccepted = false;
  }

  @override
  void dispose() {
    firstNameTC.dispose();
    lastNameTC.dispose();
    emailTC.dispose();
    phoneTC.dispose();
    passwordTC.dispose();
    confirmPasswordTC.dispose();
    super.dispose();
  }
}
