import 'package:contactapp/main.dart';
import 'package:contactapp/views/pages/edit_page.dart';
import 'package:contactapp/utils/name_list.dart';

import 'package:flutter/material.dart';
import '../widgets/build_container_widget.dart';
import '../widgets/build_icon_widget.dart';
import '../widgets/build_row_widget.dart';
import '../widgets/build_text_widget.dart';
import 'contacts_page.dart';

class ProfilePage extends StatefulWidget {
  final int index;

  ProfilePage({
    super.key,
    required this.index,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

     deleteContact() {
      setState(() {
        contactBox.deleteAt(widget.index);
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: BuildIconWidget(
            icon: Icons.arrow_back,
            iconSize: 25,
          ),
        ),
        actions: [
          InkWell(
              onTap: () async {
                await Navigator.push(
                    context,
                    (MaterialPageRoute(
                      builder: (context) => EditPage(
                        index: widget.index,
                      ),
                    )));
              },
              child: BuildIconWidget(icon: Icons.edit_outlined, iconSize: 20)),
          SizedBox(
            width: 25,
          ),
          BuildIconWidget(icon: Icons.star_border_outlined, iconSize: 20),
          SizedBox(
            width: 25,
          ),
          PopupMenuButton(
            onSelected: (value) async {
               await showDialog(
                context: context,
                builder: await (context) =>
                    AlertDialog(
                      content: Text("Are you sure to delete"),
                      actions: [
                         TextButton(onPressed: ()async{
                         await  deleteContact();
                           Navigator.push(context, MaterialPageRoute(builder: (context) => ContactsPage(),));
                         }, 
                             child: Text("yes")),
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                          },
                            child: Text("No"))
                ],),
              );
              
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Delete"),
                  value: '1',
                ),
              ];
            },
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: CircleAvatar(
                  backgroundColor: Colors.yellow,
                  radius: screenWidth / 4.5,
                  child: BuildTextWidget(
                      text: contactList[widget.index].name[0],
                      fontSize: screenWidth / 4,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: BuildTextWidget(
                text: contactList[widget.index].name,
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: BuildRowWidget(icons: Icons.phone, text: "Call")),
                Expanded(
                    child: BuildRowWidget(
                        icons: Icons.message_rounded, text: "Text")),
                Expanded(
                    child:
                        BuildRowWidget(icons: Icons.video_call, text: "Video")),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            BuildContainerWidget(titletext: contactList[widget.index].number),
            Divider(
              color: Colors.white30,
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(right: screenWidth / 1.8),
              child: BuildTextWidget(
                text: "Contact settings",
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: BuildIconWidget(
                icon: Icons.block,
                iconColor: Colors.white,
              ),
              title: BuildTextWidget(
                text: "Block number",
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            ListTile(
              leading: BuildIconWidget(
                icon: Icons.voicemail,
                iconColor: Colors.white,
              ),
              title: BuildTextWidget(
                text: "Divert to voicemail",
                color: Colors.white,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
