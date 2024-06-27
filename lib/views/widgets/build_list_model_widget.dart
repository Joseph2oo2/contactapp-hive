import 'package:contactapp/utils/name_list.dart';
import 'package:contactapp/views/pages/profile_page.dart';
import 'package:flutter/material.dart';

class BuildListModelWidget extends StatelessWidget {
  const BuildListModelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth / 6, top: 30),
      child: ListView.builder(

          itemCount: listModel.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Text(
                    listModel[index].name[0],
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.orange,
                ),
                title: Text(
                  listModel[index].name,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }),
    );
  }
}
