import 'package:flutter/material.dart';

class BuildIconWidget extends StatefulWidget {
  final IconData icon;
  final  Color? iconColor;
  final double? iconSize;
  const BuildIconWidget({super.key, required this.icon, this.iconColor, this.iconSize});

  @override
  State<BuildIconWidget> createState() => _BuildIconWidgetState();
}

class _BuildIconWidgetState extends State<BuildIconWidget> {
  @override
  Widget build(BuildContext context) {
    return  Icon(widget.icon,color: widget.iconColor,size: widget.iconSize,);
  }
}
