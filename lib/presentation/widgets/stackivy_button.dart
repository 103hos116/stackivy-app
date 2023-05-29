import 'package:flutter/material.dart';

import '../../style/app_style.dart';
import '../../style/colors.dart';

class StackivyButton extends StatelessWidget {
  final Color? backgroundColor;
  final String? title;
  final void Function() onPressed;
  final Color? borderColor;
  final Color? titleColor;
  final Widget? child;

  const StackivyButton({
    Key? key,
    this.title,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.titleColor,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor ?? kPrimaryColor,
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90),
        ),
        side: BorderSide(
          color: borderColor ?? kPrimaryColor,
          width: 1.0,
        ),
      ),
      child: child ??
          Text(
            title ?? '',
            style: StackivyStyle.bold(
              color: titleColor ?? Colors.white,
              fontSize: 15.0,
            ),
          ),
    );
  }
}
