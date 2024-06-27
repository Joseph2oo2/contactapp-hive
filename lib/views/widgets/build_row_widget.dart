import 'package:flutter/material.dart';

import 'build_icon_widget.dart';
import 'build_text_widget.dart';

class BuildRowWidget extends StatefulWidget {
  final IconData icons;
  final String text;
  const BuildRowWidget({super.key, required this.icons, required this.text});

  @override
  State<BuildRowWidget> createState() => _BuildRowWidgetState();
}

class _BuildRowWidgetState extends State<BuildRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 25,
              child: BuildIconWidget(icon:widget.icons,),
            ),
            SizedBox(height: 5,),
            BuildTextWidget(text:widget.text,fontSize: 15,color: Colors.white,)
          ],
        )
      ],
    );
  }
}
