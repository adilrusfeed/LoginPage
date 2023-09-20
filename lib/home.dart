// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.purple,
          title: Text('Home'),
          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => LoginScreen(), // Fixed the typo here
          //       ),
          //     );
          //   },
          //   // icon: Icon(Icons.arrow_back),
          // ),
          actions: [
            // Add a Signout button to the AppBar
            IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(
                Icons.exit_to_app,
              ),
              tooltip: 'Signout',
            ),
          ],
        ),
        body: SizedBox(
          child: Card(
            child: ListView.builder(
              itemCount: 21,
              itemBuilder: (context, index) {
                // Increment the index by 1 to start from 1
                int itemIndex = index + 1;
                return ListTile(
                  title: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'),
                      ),
                      SizedBox(
                        width: 10,
                        height: 50,
                      ),
                      Text('Item $itemIndex'), // Use itemIndex instead of index
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => LoginScreen()), (route) => false);
  }
}
