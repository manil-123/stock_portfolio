import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';
import 'package:share_portfolio/core/theme/theme_data.dart';

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
      style: PortfolioTheme.textTheme.bodyMedium!
          .copyWith(color: AppColors.primary),
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0, // Set minimum width to zero
          minHeight: 0, // Set minimum height to zero
        ),
        labelStyle: PortfolioTheme.textTheme.bodyMedium!
            .copyWith(color: AppColors.primary, fontSize: 14),
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
