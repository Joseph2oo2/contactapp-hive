import 'package:flutter/material.dart';
import 'package:contactapp/views/pages/edit_page.dart';

class BuildTextFeildButton extends StatefulWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final double? borderRadius;

  final IconData? suffixIcon1;
  final IconData? suffixIcon2;
  final Color? suffixIconColor1;
  final Color? suffixIconColor2;
  final double? fontSize;
  final  Color? fillColor;
  final  TextStyle? hintStyle;
  final double ?borderSideWidth;
  final Color? prefixIconColor;
  final  BorderSide?  borderSide;
  final Widget? label;
  final TextEditingController? controller;
   final Function(String)? onchanged;


  BuildTextFeildButton(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.fillColor,
      this.suffixIcon1,
      this.suffixIconColor1,
      this.fontSize,
      this.borderRadius,
      this.suffixIcon2,
      this.suffixIconColor2,
        this.hintStyle,
        this.borderSideWidth,
        this.prefixIconColor, this.borderSide, this.label, this.controller, this.onchanged});

  @override
  State<BuildTextFeildButton> createState() => _BuildTextFeildButtonState();
}

class _BuildTextFeildButtonState extends State<BuildTextFeildButton> {

  @override
  Widget build(BuildContext context) {

    return TextField(
      // cursorColor: Colors.grey,
      controller:widget.controller,
      textAlign: TextAlign.start,
      // maxLength: 1,
      //
      onChanged: (values){
        widget.onchanged!(values);
      },
      style: TextStyle(
        fontSize: widget.fontSize,
        color: Colors.white,
      ),
      decoration: InputDecoration(

        label: widget.label,
        floatingLabelBehavior:FloatingLabelBehavior.always,
        prefixIcon:  widget.prefixIcon !=null? Icon(widget.prefixIcon,color: widget.prefixIconColor,):null,
        hintText: widget.hintText,


        suffixIcon: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(widget.suffixIcon1, color: widget.suffixIconColor1),
              onPressed: () {
                // Handle search icon tap
              },
            ),
            IconButton(
              icon: Icon(widget.suffixIcon2, color: widget.suffixIconColor2),
              onPressed: () {
                // Handle clear icon tap
              },
            ),
          ],
        ),
        counterText: '',
        filled: true,
        fillColor: widget.fillColor,
        hintStyle: TextStyle(color:Colors.white),
        enabledBorder:OutlineInputBorder(
             borderSide:widget.borderSide??BorderSide.none,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
