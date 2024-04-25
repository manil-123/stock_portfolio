import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatter;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.labelText,
    this.keyboardType,
    this.validator,
    this.readOnly,
    this.enabled,
    this.inputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.name,
      inputFormatters: inputFormatter,
      readOnly: readOnly ?? false,
      enabled: enabled ?? true,
      style: const TextStyle(
        fontSize: 14,
      ),
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0, // Set minimum width to zero
          minHeight: 0, // Set minimum height to zero
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
