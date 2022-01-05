import 'package:flutter/material.dart';
import 'package:get/get.dart';

// TextField that takes TextEditingController from the main controller(ex:LoginController) to controll text from outside to be indebendent widget
class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    this.focus,
    required this.controller,
    this.function,
    this.hint = '',
    this.spaceAfter = true,
    this.inputType,
    this.maxLength,
    this.registerFocus = false,
    this.isPass = false,
    this.onTap,
    this.disableInput = false,
    this.borderColor,
    this.validate,
    this.suffixIcon,
  }) : super(key: key);

  final FocusNode? focus;
  final Function? function;
  final String hint;
  final bool spaceAfter;
  final TextInputType? inputType;
  final int? maxLength;
  final bool registerFocus;
  final bool isPass;
  final Function? onTap;
  final bool disableInput;
  final Color? borderColor;
  final String? Function(String?)? validate;
  final Widget? suffixIcon;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelStyle: borderColor != null ? TextStyle(color: borderColor) : null,
            hintStyle: borderColor != null ? TextStyle(color: borderColor) : null,
            labelText: hint.tr,
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 80,
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
            enabledBorder: borderColor != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: borderColor!,
                      width: 2.0,
                    ),
                  )
                : null,
            focusedBorder: borderColor != null
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: borderColor!,
                      width: 2.0,
                    ),
                  )
                : null,
          ),
          textInputAction: TextInputAction.next,
          autofocus: registerFocus,
          keyboardType: inputType,
          obscureText: isPass,
          showCursor: disableInput,
          readOnly: disableInput,
          maxLength: maxLength,
          onFieldSubmitted: (v) async {
            FocusScope.of(context).requestFocus(focus);
            try {
              await function!();
            } catch (e) {}
          },
          validator: validate,
        ),
        if (spaceAfter)
          const SizedBox(
            height: 16,
          ),
      ],
    );
  }
}
