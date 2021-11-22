import 'package:flutter/material.dart';

import '../theme.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Color? buttonColor;
  final String? textValue;
  final Color? textColor;
  final VoidCallback onTap;
  CustomPrimaryButton(
      {this.buttonColor, this.textValue, this.textColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14.0),
      elevation: 0,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(14.0),
            child: Center(
              child: Text(
                textValue!,
                style: heading5.copyWith(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
