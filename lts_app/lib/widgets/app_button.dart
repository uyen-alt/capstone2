import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color? btnBackground;
  final Color? colorText;

  const AppButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.btnBackground,
      this.colorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: btnBackground ?? const Color(0x4069b6fa),
        ),
        child: Text(title,
            style: TextStyle(
                color: colorText ?? const Color(0xCC088afc),
                fontSize: 18.0,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
