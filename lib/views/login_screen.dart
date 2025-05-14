import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_task_provider/components/colors.dart';
import 'package:random_task_provider/components/my_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: AppColors.secondary,
                        )),
                    Spacer(),
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.raleway(fontSize: 14),
                    ),
                    MyButtons(
                      buttonWidth: 69,
                      buttonHeight: 36,
                      buttonText: "Sign up",
                      borderColor: AppColors.primary,
                      buttonTextstyle: GoogleFonts.raleway(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Text(
                  "Login to your account",
                  style: GoogleFonts.lora(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Start exploring the universe",
                  style: GoogleFonts.raleway(
                    fontSize: 15,
                  ),
                ),
                buildloginItem(
                    text1: "Email",
                    text2: "AdeLoius@gmail.com",
                    textController: TextEditingController()),
                buildloginItem(
                    text1: "Password",
                    text2: "Enter password",
                    sufIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.neutralLight,
                    ),
                    textController: TextEditingController()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot password?",
                      style: GoogleFonts.raleway(
                          fontSize: 15, color: AppColors.primary),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        "Log in",
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

  Column buildloginItem(
      {required String text1,
      required String text2,
      required TextEditingController textController,
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
          strutStyle: StrutStyle(),
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: text2,
            hintStyle: GoogleFonts.raleway(fontSize: 14), //raleway font
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
        ),
      ],
    );
  }
}
