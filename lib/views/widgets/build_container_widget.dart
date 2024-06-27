import 'package:flutter/material.dart';


import 'build_icon_widget.dart';
import 'build_text_widget.dart';

class BuildContainerWidget extends StatefulWidget {
  final String? titletext;
  const BuildContainerWidget({super.key, this.titletext});

  @override
  State<BuildContainerWidget> createState() => _BuildContainerWidgetState();
}

class _BuildContainerWidgetState extends State<BuildContainerWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return  Container(
      height: 130,
      width: screenWidth / 1.1,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: BuildTextWidget(
              text: "Contact info",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 20,),

          ListTile(
            leading: BuildIconWidget(icon: Icons.phone,iconSize: 28,iconColor: Colors.white),
            title: BuildTextWidget(text: widget.titletext??"",fontSize: 20,color: Colors.white),
            subtitle: BuildTextWidget(text: "Mobile.Default",fontSize: 15,color: Colors.white,),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BuildIconWidget(icon: Icons.video_call,iconSize: 30,iconColor: Colors.white),
                SizedBox(width: 15,),
                BuildIconWidget(icon: Icons.message,iconSize: 30,iconColor: Colors.white),

              ],
            ),

          )
        ],
      ),
    );
  }
}
