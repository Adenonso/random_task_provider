// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:random_task_provider/components/colors.dart';
import 'package:random_task_provider/components/my_buttons.dart';
import 'package:random_task_provider/view_models/auth_view_model.dart';
import 'package:random_task_provider/views/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = true;

  @override
  void initState() {
    super.initState();
    isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    //initializing the authViewModel

    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              spacing: 15,
              children: [
                SizedBox(
                  height: 1,
                ),
                Row(
                  spacing: 5,
                  children: [
                    GestureDetector(
                        child: Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.secondary,
                    )),
                    Spacer(),
                    Text(
                      "Have an account?",
                      style: GoogleFonts.raleway(fontSize: 14),
                    ),
                    MyButtons(
                      buttonWidth: 69,
                      buttonHeight: 36,
                      buttonText: "Log in",
                      borderColor: AppColors.primary,
                      buttonTextstyle: GoogleFonts.raleway(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                    )
                  ],
                ),
                Text(
                  "Create an account",
                  style: GoogleFonts.lora(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                buildSignUpItem(
                    text1: "Name",
                    text2: "Enter your name",
                    // onChanged: authViewModel.setName,
                    textController: TextEditingController()),
                buildSignUpItem(
                    text1: "Email",
                    text2: "Enter your email",
                    // onChanged: authViewModel.setEmail,
                    textController: TextEditingController()),
                buildSignUpItem(
                    text1: "Phone Number",
                    text2: "Enter your phone number",
                    // onChanged: authViewModel.setPhoneNumber,
                    textController: TextEditingController()),
                buildSignUpItem(
                    text1: "Create Password",
                    text2: "Create a password",
                    // onChanged: authViewModel.setPassword,
                    sufIcon: Icon(
                      Icons.help_outline_outlined,
                      color: AppColors.neutralLight,
                    ),
                    textController: TextEditingController()),
                Row(
                  children: [
                    Text(
                      "Must be at least 8 characters",
                      style: GoogleFonts.raleway(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                buildSignUpItem(
                    text1: "Confirm Password",
                    text2: "Confirm password",
                    sufIcon: Icon(
                      Icons.help_outline_outlined,
                      color: AppColors.neutralLight,
                    ),
                    textController: TextEditingController()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: Icon(
                          isChecked
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded,
                          color: isChecked
                              ? AppColors.secondary
                              : AppColors.neutralLight,
                        )),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Please accept our ",
                            style: GoogleFonts.lora(
                                fontSize: 12, color: Colors.black),
                          ),
                          TextSpan(
                            text: "Terms and Conditions",
                            style: GoogleFonts.lora(
                                fontSize: 12,
                                color: AppColors.primary,
                                decoration: TextDecoration.underline),
                          ),
                          TextSpan(
                            text: " before proceeding ",
                            style: GoogleFonts.lora(
                                fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                        color: isChecked
                            ? AppColors.secondary
                            : AppColors.neutralLight,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.background),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 58,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppColors.neutralLight, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 15,
                        children: [
                          SvgPicture.asset('assets/images/googleLogosvg.svg'),
                          Text(
                            "Sign up with Google",
                            style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildSignUpItem(
      {required String text1,
      required String text2,
      required TextEditingController textController,
      Function(String)? onChanged,
      Widget? sufIcon,
      bool? obscureText}) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        Text(
          text1,
          style: GoogleFonts.raleway(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700),
        ),
        TextField(
          controller: textController,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: text2,
            hintStyle: GoogleFonts.raleway(
                fontSize: 14,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500), //raleway font
            suffixIcon: sufIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: AppColors.neutralLight), // Red border when not focused
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: AppColors.secondary,
                  width: 2), // Red border when focused
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
