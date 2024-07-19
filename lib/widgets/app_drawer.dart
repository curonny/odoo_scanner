import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
              accountName:  Text(
                "Ronny Montano",
                style:  TextStyle(fontSize: 20),
              ),
              accountEmail:  Text("r.montano@binhex.cloud",
                  style:  TextStyle(fontSize: 15)),
              ),
        ],
      ),
    );
  }

  
}