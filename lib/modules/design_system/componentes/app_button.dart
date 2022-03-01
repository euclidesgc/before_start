import '../design_sistem.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? labelColor;
  final void Function()? onPressed;

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.primary,
    this.labelColor = AppColors.onPrimary,
  }) : super(key: key);

  const AppButton.secondary({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.secondary,
    this.labelColor = AppColors.onSecondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
          child: Text(label),
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: labelColor,
          )),
    );
  }
}
