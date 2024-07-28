import 'package:employee_management/home/screens/home_screen.dart';
import 'package:employee_management/login/screens/login.dart';
import 'package:get/get.dart';
import 'auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  var user = Rx<User?>(null);
  var isLoading = false.obs;
  final AuthService _authService = AuthService();

  @override
  void onInit() {
    user.bindStream(_authService.authStateChanges());
    super.onInit();
  }

  void signUp(String email, String password) async {
    isLoading(true);
    User? newUser = await _authService.signUp(email, password);
    if (newUser != null) {
      isLoading(false);
      Get.snackbar('Sign Up', 'Sign Up Successful');
      Get.offAll(() => HomeScreen());
    } else {
      isLoading(false);
      Get.snackbar('Sign Up', 'Sign Up Failed');
    }
  }

  void login(String email, String password) async {
    isLoading(true);
    User? loggedInUser = await _authService.login(email, password);
    if (loggedInUser != null) {
      isLoading(false);
      Get.snackbar('Login', 'Login Successful');
      Get.offAll(() => HomeScreen());
    } else {
      isLoading(false);
      Get.snackbar('Login', 'Login Failed');
    }
  }

  void logout() async {
    await _authService.logout();
    Get.offAll(() => LoginScreen());
  }
}
