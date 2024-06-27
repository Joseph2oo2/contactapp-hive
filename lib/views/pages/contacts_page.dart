import 'package:contactapp/models/contact_model.dart';
import 'package:contactapp/views/pages/add_contact.dart';
import 'package:contactapp/utils/name_list.dart';
import 'package:contactapp/views/pages/profile_page.dart';
import 'package:contactapp/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../widgets/build_icon_widget.dart';
import '../widgets/build_text_feild_button.dart';
import '../widgets/build_text_widget.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({
    super.key,
  });

  @override
  State<ContactsPage> createState() => _HomePageState();
}

class _HomePageState extends State<ContactsPage> {
  int _selectedIndex = 0;
  // List<NameList> newList = [];
  final TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contactList=contactBox.values.toList();
    // newList.addAll(listModel);

    // searchController.text="Search contact"
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          fixedColor: Colors.white,
          onTap: _onItemTapped,
          selectedLabelStyle: TextStyle(color: Colors.white),
          unselectedLabelStyle: TextStyle(color: Colors.white),
          items: [
            BottomNavigationBarItem(

              icon: Icon(Icons.grade, color: Colors.white),
              label: 'Favourites',
              backgroundColor: Colors.white

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule, color: Colors.white),
              label: 'Recent',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group, color: Colors.white),
              label: 'Contacts',

            ),
          ],
          backgroundColor: Colors.grey[800],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenWidth / 40, left: screenWidth / 35),
              child: SizedBox(
                width: screenWidth / 1.05,
                child: BuildTextFeildButton(
                    hintText: "Search contacts ",
                    controller: searchController,
                    borderRadius: 30,
                    fillColor: Colors.grey[800],
                    prefixIcon: Icons.search,
                    suffixIcon1: Icons.mic_none,
                    suffixIcon2: Icons.more_vert,
                    prefixIconColor: Colors.white,
                    suffixIconColor1: Colors.white,
                    suffixIconColor2: Colors.white,
                    // onchanged: (values) {
                    //   setState(() {
                    //     newList.clear();
                    //     newList = listModel
                    //         .where((element) => element.name
                    //             .toLowerCase()
                    //             .contains(values.toLowerCase()))
                    //         .toList();
                    //   },
                    //   );
                    // },
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: screenWidth,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddContact(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth / 5),
                      child: BuildIconWidget(
                          icon: Icons.person_add_alt,
                          iconColor: Colors.blue.shade400,
                          iconSize: screenWidth / 18),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth / 15),
                      child: BuildTextWidget(
                        text: 'Create new contact',
                        color: Colors.blue.shade400,
                        fontSize: screenWidth / 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            contactList.isEmpty
                ? Center(
                    child: Text(
                    "no contacts",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ))
                : Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth / 6, top: 30),
                      child: ListView.builder(
                          itemCount:contactList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: InkWell(
                                onTap: () async{
                                  // int originalIndex = listModel.indexOf(newList[index]);
                                 await Navigator.push(
                                    context,
                                    (MaterialPageRoute(
                                      builder: (context) =>  ProfilePage(
                                        index: index,
                                      ),
                                    )),
                                  );
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    child: Text(
                                      contactList[index].name[0],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.orange,
                                  ),
                                  title: Text(
                                    contactList[index].name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
