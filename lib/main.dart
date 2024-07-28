import 'package:employee_management/firebase_options.dart';
import 'package:employee_management/home/screens/home_screen.dart';
import 'package:employee_management/login/screens/login.dart';
import 'package:employee_management/services/auth/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Management Dashboard',
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          ),
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authController.user.value != null) {
        return HomeScreen();
      } else {
        return LoginScreen();
      }
    });
  }
}
