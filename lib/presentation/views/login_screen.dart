import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:random_task_provider/constants/colors.dart';
import 'package:random_task_provider/constants/const.dart';
import 'package:random_task_provider/constants/icon_path.dart';
import 'package:random_task_provider/constants/styles.dart';
import 'package:random_task_provider/constants/validator.dart';
import 'package:random_task_provider/presentation/viewmodels/auth_view_model.dart';
import 'package:random_task_provider/presentation/views/home.dart';
import 'package:random_task_provider/presentation/views/sign_up_screen.dart';
import 'package:random_task_provider/presentation/widgets/button.dart';
import 'package:random_task_provider/presentation/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Spacer(),
            Text(
              "Don't have an account?",
              style: TextStyles.style14.copyWith(
                color: color344054,
              ),
            ),
            horizontalSpaceSmall(),
            AppButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              title: "Sign up",
              buttonColor: Colors.white,
              textColor: colorEE79A9,
              borderColor: colorEE79A9,
              vPadding: 8,
              hPadding: 14,
              borderRadius: 8,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpaceMedium(),
              Text(
                'Login to your account',
                style: TextStyles.style32,
              ),
              verticalSpaceSmall(),
              Text(
                'Start exploring the glitbase universe',
                style: TextStyles.style16,
              ),
              verticalSpaceSmall(),
              TextInputForm(
                label: 'Email',
                hint: 'Enter your email',
                controller: authViewModel.emailTC,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (val) => EmailValidator.validateEmail(val!),
              ),
              TextInputForm(
                label: 'Password',
                hint: 'Enter password',
                controller: authViewModel.passwordTC,
                textInputAction: TextInputAction.done,
                validator: (val) => PasswordValidator.validatePassword(val!),
              ),
              verticalSpaceMedium(),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forgot password?",
                    style: TextStyles.style14.copyWith(color: colorEE79A9),
                  ),
                ),
              ),
              verticalSpace(0.05, context),
              AppButton(
                isLoading: authViewModel.isLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    authViewModel.login(context);
                  }
                },
                title: "Login",
              ),
              verticalSpaceMedium(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  "Use as guest",
                  style: TextStyles.style14.copyWith(color: colorEE79A9),
                ),
              ),
              verticalSpaceMedium(),
              OutlinedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(IconPath.google),
                label: Text(
                  'Login with google',
                  style: TextStyles.style16,
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              if (Platform.isIOS) ...[
                verticalSpaceMedium(),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    IconPath.apple,
                  ),
                  label: Text(
                    'Login with Apple',
                    style: TextStyles.style16,
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
