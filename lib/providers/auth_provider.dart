import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoggedIn = false;

  void login() {
    isLoading = true;
    notifyListeners();

    isLoggedIn = true;
    isLoading = false;
    notifyListeners();
  }

  void logout() {
    isLoading = true;
    notifyListeners();

    isLoggedIn = false;
    isLoading = false;
    notifyListeners();
  }
}
