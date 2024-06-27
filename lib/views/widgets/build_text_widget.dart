import 'package:flutter/material.dart';

class BuildTextWidget extends StatefulWidget {
  final String text;
  final Color? color ;
  final  double? fontSize;
  final FontWeight? fontWeight;
  const BuildTextWidget({super.key, required this.text, this.color, this.fontSize, this.fontWeight});

  @override
  State<BuildTextWidget> createState() => _BuildTextWidgetState();
}

class _BuildTextWidgetState extends State<BuildTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.color, fontSize: widget.fontSize, fontWeight: widget.fontWeight),
    );
  }
}
