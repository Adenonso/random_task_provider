// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:random_task_provider/constants/colors.dart';
import 'package:random_task_provider/constants/const.dart';
import 'package:random_task_provider/constants/styles.dart';

class PhoneTextInputForm extends StatefulWidget {
  const PhoneTextInputForm({
    super.key,
    this.validator,
    this.onChanged,
    this.onSubmit,
    this.onSaved,
    this.controller,
    this.hint,
    this.label,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.onTap,
    this.borderRadius = 24,
  });

  final Function(PhoneNumber)? onChanged;
  final onSubmit;
  final onSaved;
  final validator;
  final TextEditingController? controller;
  final String? hint, label;
  final keyboardType, textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final double borderRadius;

  @override
  State<PhoneTextInputForm> createState() => _PhoneTextInputFormState();
}

class _PhoneTextInputFormState extends State<PhoneTextInputForm> {
  String? initialCountryCode;
  String? initialPhoneNumber;

  @override
  void initState() {
    super.initState();
    _initializePhoneNumber();
  }

  void _initializePhoneNumber() {
    if (widget.controller != null && widget.controller!.text.isNotEmpty) {
      final phoneNumber = widget.controller!.text;
      final parsedNumber =
          PhoneNumber.fromCompleteNumber(completeNumber: phoneNumber);
      initialCountryCode = parsedNumber.countryISOCode;
      initialPhoneNumber = parsedNumber.number;
    } else {
      initialCountryCode = 'NG'; // Default country code NG
      initialPhoneNumber = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Text(
              widget.label!,
              style: TextStyles.style14.copyWith(
                color: color344054,
              ),
            ),
          verticalSpaceTiny(),
          InkWell(
            onTap: widget.onTap,
            child: IntlPhoneField(
              cursorColor: Colors.black,
              inputFormatters: widget.inputFormatters,
              textInputAction: widget.textInputAction ?? TextInputAction.done,
              keyboardType: widget.keyboardType,
              style: TextStyles.style14,
              validator: widget.validator,
              onSaved: (val) {
                if (widget.controller != null) {
                  widget.controller!.text = val!.completeNumber;
                }
                widget.onChanged?.call(val!);
              },
              onChanged: widget.onChanged,
              initialCountryCode: initialCountryCode,
              initialValue: initialPhoneNumber,
              showCountryFlag: false,
              // countries: countries
              //     .where((c) => ['NG', 'GB'].contains(c.code))
              //     .toList(),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: white,
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
                    borderSide: const BorderSide(color: colorFF2F2F, width: 1)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: colorFF2F2F, width: 1)),
                hintText: widget.hint,
                hintStyle: TextStyles.style14.copyWith(
                  color: color667085,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
