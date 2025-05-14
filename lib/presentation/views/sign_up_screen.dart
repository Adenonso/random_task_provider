import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:random_task_provider/constants/colors.dart';
import 'package:random_task_provider/constants/const.dart';
import 'package:random_task_provider/constants/icon_path.dart';
import 'package:random_task_provider/constants/styles.dart';
import 'package:random_task_provider/constants/validator.dart';
import 'package:random_task_provider/presentation/views/login_screen.dart';
import 'package:random_task_provider/presentation/viewmodels/auth_view_model.dart';
import 'package:random_task_provider/presentation/widgets/button.dart';
import 'package:random_task_provider/presentation/widgets/phone_number_input_field.dart';
import 'package:random_task_provider/presentation/widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: primaryColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Spacer(),
            Text(
              'Have an account?',
              style: TextStyles.style14.copyWith(
                color: color344054,
              ),
            ),
            horizontalSpaceSmall(),
            AppButton(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              title: "Log in",
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
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpaceMedium(),
              Text(
                'Create an account',
                style: TextStyles.style32,
              ),
              TextInputForm(
                label: 'First name',
                hint: 'Enter your first name',
                controller: authViewModel.firstNameTC,
                validator: (val) => UsernameValidator.validateUsername(val!),
              ),
              TextInputForm(
                label: 'Last name',
                hint: 'Enter your last name',
                controller: authViewModel.lastNameTC,
                validator: (val) => UsernameValidator.validateUsername(val!),
              ),
              TextInputForm(
                label: 'Email',
                hint: 'Enter your email',
                controller: authViewModel.emailTC,
                validator: (val) => EmailValidator.validateEmail(val!),
                keyboardType: TextInputType.emailAddress,
              ),
              PhoneTextInputForm(
                label: 'Phone number',
                hint: 'Enter your phone number',
                controller: authViewModel.phoneTC,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  authViewModel.phoneTC.text = value.completeNumber;
                },
                keyboardType: TextInputType.phone,
              ),
              TextInputForm(
                label: 'Password',
                hint: 'Create a password',
                controller: authViewModel.passwordTC,
                obscure: true,
                validator: (val) => PasswordValidator.validatePassword(val!),
              ),
              TextInputForm(
                label: 'Confirm password',
                hint: 'Confirm password',
                obscure: true,
                controller: authViewModel.confirmPasswordTC,
                validator: (value) {
                  if (authViewModel.confirmPasswordTC.text !=
                      authViewModel.passwordTC.text) {
                    return "Your passwords do not match";
                  }
                  return null;
                },
              ),
              verticalSpaceMedium(),
              Consumer<AuthViewModel>(builder: (context, viewModel, child) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 23,
                      width: 23,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: viewModel.termsAccepted
                              ? colorEE79A9
                              : colorD0D5DD,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Checkbox(
                        value: viewModel.termsAccepted,
                        onChanged: (value) {
                          viewModel.toggleTermsAccepted(value);
                        },
                        activeColor: colorD0D5DD,
                        checkColor: colorEE79A9,
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    horizontalSpaceSmall(),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                            text: 'Please accept our ',
                            style: TextStyles.style12.copyWith(
                              color: color475367,
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyles.style12.copyWith(
                                  color: color093D3D,
                                  decoration: TextDecoration.underline,
                                  decorationColor: color093D3D,
                                ),
                              ),
                              TextSpan(
                                text: ' before proceeding',
                                style: TextStyles.style12.copyWith(
                                  color: color475367,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                );
              }),
              verticalSpaceSmall(),
              Consumer<AuthViewModel>(builder: (context, viewModel, child) {
                return AppButton(
                  isLoading: viewModel.isLoading,
                  allowSubmit: viewModel.termsAccepted,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if (viewModel.termsAccepted) {
                        viewModel.signUp(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Please accept the terms and conditions.')),
                        );
                      }
                    }
                  },
                  title: "Sign up",
                );
              }),
              verticalSpaceMedium(),
              OutlinedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(IconPath.google),
                label: Text(
                  'Sign up with google',
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
                    'Sign up with Apple',
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
              verticalSpaceMedium(),
            ],
          ),
        ),
      ),
    );
  }
}
