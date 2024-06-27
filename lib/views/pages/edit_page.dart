import 'package:contactapp/main.dart';
import 'package:contactapp/models/contact_model.dart';
import 'package:contactapp/views/pages/contacts_page.dart';
import 'package:contactapp/utils/name_list.dart';
import 'package:contactapp/views/pages/profile_page.dart';

import 'package:flutter/material.dart';

import '../widgets/build_elevated_button_widget.dart';
import '../widgets/build_icon_widget.dart';
import '../widgets/build_list_tile_widget.dart';
import '../widgets/build_text_feild_button.dart';
import '../widgets/build_text_widget.dart';

class EditPage extends StatefulWidget {

  final int index;

  const EditPage({super.key,  required this.index,});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController nameController=TextEditingController();
  final TextEditingController numberController=TextEditingController();






  @override
  void initState() {
    super.initState();
    nameController.text = contactList[widget.index].name;
    numberController.text = contactList[widget.index].number;
  }



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: BuildTextWidget(
          text: "Edit contact",
          fontSize: 23,
          fontWeight: FontWeight.w400,
        ),
        actions: <Widget>[
          BuildElevatedButtonWidget(
            text: "Save",
            onPressed: () async {
               setState(() {
                ContactModel editContact=ContactModel(name: nameController.text, number: numberController.text);
                 contactBox.putAt(widget.index, editContact);
                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactsPage(),));
              });
            },
          ),
          //IconButton
          BuildIconWidget(icon: Icons.more_vert_outlined) //IconButton
        ], //<Widget>[]
        backgroundColor: Colors.black87,
        elevation: 50.0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: BuildIconWidget(
            icon: Icons.close,
          ),
        ),
      ),

      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.green,
              child: BuildTextWidget(
                  text: contactList[widget.index].name[0], fontSize: 80,color:Colors.black,fontWeight: FontWeight.w400,),
            ),
          ),

          SizedBox(height: 40,),



          BuildListTileWidget(
            leading: BuildIconWidget(
                icon: Icons.person, iconColor: Colors.white),
            title: Padding(
              padding:  EdgeInsets.only(right: 30),
              child: BuildTextFeildButton(
                controller: nameController,
                borderRadius: 5,
                borderSide: BorderSide(color: Colors.white),
                label: Text("Name", style: TextStyle(color: Colors.white)),
                hintStyle: TextStyle(fontWeight: FontWeight.w300,),
              ),
            ),

          ),

          SizedBox(height: 30,),


          BuildListTileWidget(
            leading: BuildIconWidget(
                icon: Icons.phone, iconColor: Colors.white),
            title: Padding(
              padding:  EdgeInsets.only(right: 30),
              child: BuildTextFeildButton(
                controller: numberController,
                borderRadius: 5,
                borderSide: BorderSide(color: Colors.white),
                label: Text("Phone", style: TextStyle(color: Colors.white)),
                hintStyle: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),

          ),
        ],
      ),
    );
  }
}
