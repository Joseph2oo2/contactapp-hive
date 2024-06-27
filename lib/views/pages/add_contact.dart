import 'package:contactapp/models/contact_model.dart';
import 'package:contactapp/views/pages/contacts_page.dart';
import 'package:contactapp/main.dart';
import 'package:contactapp/utils/name_list.dart';
import 'package:contactapp/views/widgets/build_elevated_button_widget.dart';
import 'package:contactapp/views/widgets/build_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../widgets/build_icon_widget.dart';
import '../widgets/build_list_tile_widget.dart';
import '../widgets/build_text_feild_button.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

   _addItemToList() {
    setState(() {
      String name = _nameController.text;
      String phone = _phoneController.text;
      ContactModel newContact = ContactModel(name: name, number: phone);
      contactBox.put(newContact.name, newContact);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: BuildTextWidget(
          text: "Create contact",
          color: Colors.white,
          fontSize: 23,
          fontWeight: FontWeight.w400,
        ),
        actions: <Widget>[
          BuildElevatedButtonWidget(
            text: "Save",
            onPressed: () async{
             await _addItemToList();
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactsPage(),));
            },
          ),
          //IconButton
          BuildIconWidget(icon: Icons.more_vert_outlined) //IconButton
        ], //<Widget>[]
        backgroundColor: Colors.black87,
        elevation: 50.0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: BuildIconWidget(
            icon: Icons.close,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: BuildIconWidget(
                    icon: Icons.add_photo_alternate, iconSize: 40),
              ),
              SizedBox(
                height: 10,
              ),
              BuildTextWidget(
                text: "Add Picture",
                color: Colors.lightBlue[500],
              ),
              SizedBox(
                height: 50,
              ),
              BuildListTileWidget(
                leading: BuildIconWidget(
                    icon: Icons.person, iconColor: Colors.white),
                title: BuildTextFeildButton(
                  controller: _nameController,
                  borderRadius: 5,
                  borderSide: BorderSide(color: Colors.white),
                  hintText: "First Name",
                  hintStyle: TextStyle(fontWeight: FontWeight.w300),
                ),
                trailing: BuildIconWidget(
                  icon: Icons.expand_more,
                  iconColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: screenWidth / 1.36,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: BuildTextFeildButton(
                    borderRadius: 5,
                    borderSide: BorderSide(color: Colors.white),
                    hintText: "Surname",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BuildListTileWidget(
                leading: BuildIconWidget(
                    icon: Icons.apartment, iconColor: Colors.white),
                title: Padding(
                  padding: const EdgeInsets.only(right: 36),
                  child: BuildTextFeildButton(
                    borderRadius: 5,
                    borderSide: BorderSide(color: Colors.white),
                    hintText: "Company",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BuildListTileWidget(
                leading:
                    BuildIconWidget(icon: Icons.phone, iconColor: Colors.white),
                title: Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: BuildTextFeildButton(
                    controller: _phoneController,
                    borderRadius: 5,
                    borderSide: BorderSide(color: Colors.white),
                    hintText: "Phone",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: screenWidth / 1.25,
                child: Padding(
                  padding: EdgeInsets.only(left: 29, right: screenWidth / 4),
                  child: BuildTextFeildButton(
                    borderRadius: 5,
                    borderSide: BorderSide(color: Colors.white),
                    hintText: "Mobile",
                    hintStyle: TextStyle(fontSize: 10),
                    label: Text("Label", style: TextStyle(color: Colors.white)),
                    suffixIcon1: Icons.arrow_drop_down,
                    suffixIconColor1: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BuildListTileWidget(
                leading:
                    BuildIconWidget(icon: Icons.email, iconColor: Colors.white),
                title: Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: BuildTextFeildButton(
                    borderRadius: 5,
                    borderSide: BorderSide(color: Colors.white),
                    hintText: "Email",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: screenWidth / 1.20,
                child: Padding(
                  padding: EdgeInsets.only(left: 36, right: screenWidth / 3.5),
                  child: BuildTextFeildButton(
                    borderRadius: 5,
                    borderSide: BorderSide(color: Colors.white),
                    hintText: "Home",
                    hintStyle: TextStyle(fontSize: 18),
                    label: Text("Label", style: TextStyle(color: Colors.white)),
                    suffixIcon1: Icons.arrow_drop_down,
                    suffixIconColor1: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BuildListTileWidget(
                leading:
                    BuildIconWidget(icon: Icons.today, iconColor: Colors.white),
                title: Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: BuildTextFeildButton(
                    borderRadius: 5,
                    borderSide: BorderSide(color: Colors.white),
                    hintText: "Significant Date",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    suffixIcon1: Icons.arrow_drop_down,
                    suffixIconColor1: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: screenWidth / 1.19,
                child: Padding(
                  padding: EdgeInsets.only(left: 37, right: screenWidth / 3.5),
                  child: BuildTextFeildButton(
                    borderRadius: 5,
                    borderSide: BorderSide(color: Colors.white),
                    hintText: "Birthday",
                    label: Text("Label", style: TextStyle(color: Colors.white)),
                    suffixIcon1: Icons.arrow_drop_down,
                    suffixIconColor1: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth / 6),
                    child: TextButton(
                        onPressed: () {}, child: Text("More feilds")),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
