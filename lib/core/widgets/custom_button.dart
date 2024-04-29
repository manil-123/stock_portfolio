import 'package:flutter/material.dart';
import 'package:share_portfolio/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color color;
  final double? height;
  final BorderRadius? borderRadius;
  final Function()? onPressed;
  final EdgeInsets? padding;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final MainAxisAlignment? mainAxisAlignment;
  final bool centerAlignWidget;
  final bool hasBorder;
  final Color? textColor;
  final bool? isDisabled;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.color = AppColors.green,
    this.borderRadius,
    this.padding,
    this.height,
    this.prefixWidget,
    this.suffixWidget,
    this.mainAxisAlignment,
    this.hasBorder = false,
    this.centerAlignWidget = true,
    this.textColor,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        height: height ?? 58,
        width: double.infinity,
      ),
      child: ElevatedButton(
        onPressed: (isDisabled ?? false) ? null : onPressed,
        statesController: MaterialStatesController(),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          disabledBackgroundColor: AppColors.grey,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            side: hasBorder
                ? const BorderSide(color: AppColors.green, width: 1)
                : BorderSide.none,
            borderRadius: borderRadius ?? BorderRadius.circular(14),
          ),
        ),
        child: centerAlignWidget
            ? FittedBox(
                child: IconTextRow(
                mainAxisAlignment: mainAxisAlignment,
                prefixWidget: prefixWidget,
                text: text,
                suffixWidget: suffixWidget,
                textColor: textColor,
                isDisabled: isDisabled ?? false,
              ))
            : IconTextRow(
                mainAxisAlignment: mainAxisAlignment,
                prefixWidget: prefixWidget,
                text: text,
                suffixWidget: suffixWidget,
                textColor: textColor,
                isDisabled: isDisabled ?? false,
              ),
      ),
    );
  }
}

class IconTextRow extends StatelessWidget {
  const IconTextRow({
    super.key,
    required this.mainAxisAlignment,
    required this.prefixWidget,
    required this.text,
    required this.suffixWidget,
    required this.isDisabled,
    this.textColor,
  });

  final MainAxisAlignment? mainAxisAlignment;
  final Widget? prefixWidget;
  final String text;
  final Widget? suffixWidget;
  final Color? textColor;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ??
          (prefixWidget == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.start),
      children: [
        if (prefixWidget != null)
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: prefixWidget!,
          ),
        Padding(
          padding: EdgeInsets.zero,
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: isDisabled
                      ? AppColors.primary
                      : textColor ?? AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
          ),
        ),
        if (suffixWidget != null)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: suffixWidget!,
          ),
      ],
    );
  }
}
