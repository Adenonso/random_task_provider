import 'package:flutter/material.dart';
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
              horizontal: 5,
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
                      color: Colors.green,
                    )),
                    Spacer(),
                    Text(
                      "Have an account?",
                      style: GoogleFonts.raleway(fontSize: 15),
                    ),
                    MyButtons(
                      buttonWidth: 75,
                      buttonHeight: 47,
                      buttonText: "Log in",
                      borderColor: AppColors.primary,
                      buttonTextstyle: GoogleFonts.raleway(
                          fontSize: 15,
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
                      fontSize: 23, fontWeight: FontWeight.bold),
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
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Checkbox(value: true, onChanged: (value) {}),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Icon(
                            isChecked
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: isChecked
                                ? AppColors.secondary
                                : AppColors.neutralLight,
                          )),

                      Text(
                        "Please accept Our ",
                        style: GoogleFonts.lora(fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Terms and Condition",
                          style: GoogleFonts.lora(
                              fontSize: 12,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      Text(
                        " Before Proceeding",
                        style: GoogleFonts.lora(fontSize: 12),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: isChecked
                            ? AppColors.secondary
                            : AppColors.neutralLight,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.raleway(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.background),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 50,
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
                          CircleAvatar(
                              radius: 17,
                              backgroundColor: AppColors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/google logo.png")),
                          Text(
                            "Sign up with Google",
                            style: GoogleFonts.raleway(
                                fontSize: 15,
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
          style:
              GoogleFonts.raleway(fontSize: 15.0, fontWeight: FontWeight.w600),
        ),
        TextField(
          controller: textController,
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
          onChanged: onChanged,
        ),
      ],
    );
  }
}
