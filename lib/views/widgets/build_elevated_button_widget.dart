import 'package:flutter/material.dart';

class BuildElevatedButtonWidget extends StatefulWidget {
  final void Function() onPressed;
  final String text;

  const BuildElevatedButtonWidget(
      {super.key, required this.onPressed, required this.text});

  @override
  State<BuildElevatedButtonWidget> createState() =>
      _BuildElevatedButtonWidgetState();
}

class _BuildElevatedButtonWidgetState extends State<BuildElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: ElevatedButton(
            onPressed: () {
              widget.onPressed();
            },
            child:
            Text(widget.text),
            style: ElevatedButton.styleFrom(
              backgroundColor:Colors.blue[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
      ),
    );

  }
}
