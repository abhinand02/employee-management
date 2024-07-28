import 'package:employee_management/login/widget/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginSignUpForm(
                formKey: formKey,
              ),
              Row(
                children: [
                  const Text('Create an account?'),
                  TextButton(
                    onPressed: () {
                      Get.to(() => SignUpScreen());
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
