import 'package:flutter/material.dart';
import 'package:random_task_provider/constants/colors.dart';
import 'package:random_task_provider/constants/styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.title,
    this.loadingText,
    this.buttonColor,
    this.borderColor,
    this.textColor,
    this.borderRadius,
    this.hPadding,
    this.vPadding,
    this.allowSubmit = true,
    this.isLoading = false,
  });

  final String title;
  final String? loadingText;
  final void Function() onTap;
  final Color? buttonColor, borderColor;
  final Color? textColor;
  final double? borderRadius, hPadding, vPadding;
  final bool allowSubmit, isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: allowSubmit ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor ?? (allowSubmit ? primaryColor : colorD0D5DD),
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            border: Border.all(
              color: borderColor ?? (allowSubmit ? primaryColor : colorD0D5DD),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: hPadding ?? 24.0,
            vertical: vPadding ?? 10.0,
          ),
          child: Center(
            child: isLoading
                ? const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Text(
                    title,
                    style: TextStyles.style18.copyWith(
                      color: textColor ?? white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
