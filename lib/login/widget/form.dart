import 'package:employee_management/services/auth/auth_controller.dart';
import 'package:employee_management/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSignUpForm extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginSignUpForm({
    super.key,
    required this.formKey,
    this.isLogin = true,
  });

  final GlobalKey<FormState> formKey;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
                labelText: 'Email', hintText: 'example@domain.com'),
            validator: (value) {
              return Validator.emailValidator(value);
            },
          ),
          TextFormField(
            controller: passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
                labelText: 'Password', hintText: 'Enter your password'),
            obscureText: true,
            validator: (value) => Validator.passwordValidator(value),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (isLogin) {
                        authController.login(
                            emailController.text, passwordController.text);
                      } else {
                        authController.signUp(
                            emailController.text, passwordController.text);
                      }
                    }
                  },
                  child: Obx(
                    () => Visibility(
                      visible: authController.isLoading.value,
                      replacement: Text(isLogin ? 'Login' : 'Sign Up'),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
