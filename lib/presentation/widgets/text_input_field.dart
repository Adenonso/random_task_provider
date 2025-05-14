// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_task_provider/constants/colors.dart';
import 'package:random_task_provider/constants/const.dart';
import 'package:random_task_provider/constants/styles.dart';

class TextInputForm extends StatefulWidget {
  const TextInputForm({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscure = false,
    this.onChanged,
    this.onSubmit,
    this.enabled = true,
    this.controller,
    this.label,
    this.hint,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.prefixText,
    this.onTap,
    this.bgColor,
    this.textInputAction,
  });

  final suffixIcon;
  final prefixIcon;
  final onChanged;
  final onSubmit;
  final validator;
  final bool enabled;
  final TextEditingController? controller;
  final bool obscure;
  final String? label;
  final String? prefixText;
  final String? hint;
  final TextCapitalization textCapitalization;
  final keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final Function()? onTap;
  final Color? bgColor;
  final TextInputAction? textInputAction;
  @override
  State<TextInputForm> createState() => _TextInputFormState();
}

class _TextInputFormState extends State<TextInputForm> {
  bool showpassword = true;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              Text(
                widget.label!,
                style: TextStyles.style14.copyWith(
                  color: color344054,
                ),
              ),
              verticalSpaceTiny(),
            ],
            InkWell(
              onTap: widget.onTap,
              child: TextFormField(
                buildCounter: (context,
                        {required currentLength,
                        required isFocused,
                        maxLength}) =>
                    null,
                inputFormatters: widget.inputFormatters,
                enabled: widget.enabled,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                style: TextStyles.style14,
                textCapitalization: widget.textCapitalization,
                validator: widget.validator,
                onChanged: widget.onChanged,
                onFieldSubmitted: widget.onSubmit,
                obscureText: widget.obscure ? showpassword : false,
                obscuringCharacter: '*',
                maxLines: widget.maxLines,
                maxLength: widget.maxLength,
                textInputAction: widget.textInputAction,
                decoration: InputDecoration(
                  filled: widget.bgColor != null ? true : false,
                  fillColor: widget.bgColor ?? Colors.transparent,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: colorD0D5DD, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: colorD0D5DD, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: colorD0D5DD, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: colorFF2F2F, width: 1)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: colorFF2F2F, width: 1)),
                  suffixIcon: widget.suffixIcon ??
                      (widget.obscure == true
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  showpassword = !showpassword;
                                });
                              },
                              child: Icon(
                                showpassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: widget.controller!.text.isEmpty
                                    ? grey
                                    : color98A2B3,
                              ),
                            )
                          : const SizedBox()),
                  prefixIcon: widget.prefixIcon,
                  hintText: widget.hint,
                  prefixText: widget.prefixText,
                  hintStyle: TextStyles.style14.copyWith(
                    color: color667085,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscure = false,
    this.onChanged,
    this.onSubmit,
    this.enabled = true,
    this.controller,
    this.label,
    this.hint,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.prefixText,
    this.onTap,
  });

  final suffixIcon;
  final prefixIcon;
  final onChanged;
  final onSubmit;
  final validator;
  final bool enabled;
  final TextEditingController? controller;
  final bool obscure;
  final String? label;
  final String? prefixText;
  final String? hint;
  final TextCapitalization textCapitalization;
  final keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null)
              Text(label!,
                  style: TextStyles.style14.copyWith(color: color344054)),
            verticalSpaceSmall(),
            InkWell(
              onTap: onTap,
              child: TextFormField(
                buildCounter: (context,
                        {required currentLength,
                        required isFocused,
                        maxLength}) =>
                    null,
                inputFormatters: inputFormatters,
                enabled: enabled,
                controller: controller,
                keyboardType: keyboardType,
                style: TextStyles.style14,
                textCapitalization: textCapitalization,
                validator: validator,
                onChanged: onChanged,
                onFieldSubmitted: onSubmit,
                obscureText: obscure,
                obscuringCharacter: '*',
                maxLines: maxLines,
                maxLength: maxLength,
                decoration: InputDecoration(
                  filled: false,
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: colorD0D5DD, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: colorD0D5DD, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: colorD0D5DD, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: colorFF2F2F, width: 1)),
                  focusedErrorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          const BorderSide(color: colorFF2F2F, width: 1)),
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  hintText: hint,
                  prefixText: prefixText,
                  hintStyle: TextStyles.style14.copyWith(color: color667085),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            ),
          ],
        ),
      );
}
