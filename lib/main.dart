import 'package:contactapp/models/contact_model.dart';
import 'package:contactapp/utils/name_list.dart';
import 'package:contactapp/views/pages/add_contact.dart';
import 'package:contactapp/views/pages/edit_page.dart';
import 'package:contactapp/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'views/pages/contacts_page.dart';
 late Box<ContactModel> contactBox;
 late List<ContactModel> contactList;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ContactModelAdapter());
  contactBox=await Hive.openBox<ContactModel>('contacts');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, });


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Contact App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
           iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white))
      ),
      home: ContactsPage(),
    );
  }
}



