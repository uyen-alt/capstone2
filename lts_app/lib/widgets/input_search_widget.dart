import 'package:flutter/material.dart';

class InputSearchWidget extends StatefulWidget {
  final String? hint;
  final double marginHorizontal;
  final double marginVertical;
  final TextEditingController? controller;
  final Color? baseColor;
  final Color? errorColor;
  final TextInputType? inputType;
  final bool obscureText;
  final Icon? iconLeading;

  const InputSearchWidget({
    super.key,
    this.hint,
    this.controller,
    this.baseColor,
    this.errorColor,
    this.marginHorizontal = 16.0,
    this.marginVertical = 8.0,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.iconLeading,
  });

  @override
  InputSearchWidgetState createState() => InputSearchWidgetState();
}

class InputSearchWidgetState extends State<InputSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.symmetric(
        horizontal: widget.marginHorizontal,
        vertical: widget.marginVertical,
      ),
      color: const Color(0x66e0e0e0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: widget.baseColor,
              fontWeight: FontWeight.w400,
            ),
            icon: widget.iconLeading,
            border: InputBorder.none,
            hintText: widget.hint,
          ),
        ),
      ),
    );
  }
}
