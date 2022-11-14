import 'package:demotask/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextFieldType textFieldType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Function(dynamic val)? onEditing;

  const CustomAppTextField(
      {Key? key,
      required this.textEditingController,
      required this.textFieldType,
      this.validator,
      this.textInputAction = TextInputAction.done,
      this.onEditing})
      : super(key: key);

  @override
  State<CustomAppTextField> createState() => _CustomAppTextFieldState();
}

class _CustomAppTextFieldState extends State<CustomAppTextField> {
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChange);

    _focusNode.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 58,
          decoration: BoxDecoration(
            color: AppColor.kAppbarColor.withOpacity(0.20),
            borderRadius: BorderRadius.circular(10),
            border:
                isFocused ? Border.all(color: Colors.black) : const Border(),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            cursorColor: Colors.black,
            onChanged: widget.onEditing,
            controller: widget.textEditingController,
            focusNode: _focusNode,
            validator: getValidation(),
            keyboardType: getKeyboardType(),
            maxLength: getMaxLength,
            buildCounter: (BuildContext context,
                    {required int currentLength,
                    required bool isFocused,
                    required int? maxLength}) =>
                null,
            inputFormatters: getTextInputFormatter,
            textInputAction: widget.textInputAction,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                label: Text(
                  getLabelText(),
                  style: TextStyle(
                      color:
                          isFocused ? Colors.black : const Color(0xff939598)),
                ),
                labelStyle: TextStyle(
                  color: isFocused ? Colors.black : const Color(0xff939598),
                ),
                border: InputBorder.none),
          ),
        )
      ],
    );
  }

  int? get getMaxLength {
    switch (widget.textFieldType) {
      case TextFieldType.mobileNumber:
        return 10;
      case TextFieldType.otpType:
        return 6;
      default:
        return null;
    }
  }

  List<TextInputFormatter>? get getTextInputFormatter {
    switch (widget.textFieldType) {
      case TextFieldType.otpType:
      case TextFieldType.mobileNumber:
        return [FilteringTextInputFormatter.digitsOnly];
      default:
        return null;
    }
  }

  String getLabelText() {
    switch (widget.textFieldType) {
      case TextFieldType.mobileNumber:
        return "Mobile number";
      case TextFieldType.otpType:
        return "Enter a OTP";
      default:
        return "";
    }
  }

  TextInputType getKeyboardType() {
    switch (widget.textFieldType) {
      case TextFieldType.mobileNumber:
      case TextFieldType.otpType:
        return TextInputType.phone;
    }
  }

  getValidation() {
    switch (widget.textFieldType) {
      case TextFieldType.mobileNumber:
        return (val) =>
            val!.trim().isEmpty ? "Please enter a mobile number" : null;
      case TextFieldType.otpType:
        return widget.validator;

      default:
        return null;
    }
  }
}

enum TextFieldType {
  mobileNumber,
  otpType,
}
