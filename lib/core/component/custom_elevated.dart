import 'package:flutter/material.dart';
import 'package:project_frame/core/utils/context_extension.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color fgColor;
  final Color? bgColor;
  final Widget child;
  final double width;
  final double radius;
  final double height;
  final double? elevation;
  final VoidCallback? onPressed;
  final double fontSize;
  final bool isEnabled;

  const CustomElevatedButton({
    super.key,
    this.fgColor = Colors.white,
    this.bgColor,
    required this.child,
    this.width = 100,
    this.radius = 10,
    this.height = 45,
    this.elevation,
    this.onPressed,
    this.fontSize = 16,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      constraints: BoxConstraints(minWidth: width),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: fontSize,
          ),
          elevation: elevation,
          foregroundColor: fgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          backgroundColor: bgColor ?? context.primaryColor,
        ),
        onPressed: isEnabled ? onPressed : null,
        child: child,
      ),
    );
  }
}
