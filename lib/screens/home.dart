import 'package:flutter/material.dart';
import 'package:flutterapp/about_us.dart';
import 'package:flutterapp/screens/post_screen.dart';
import 'package:flutterapp/screens/profile.dart';
import 'package:flutterapp/services/user_service.dart';

import 'login.dart';
import 'post_form.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromRGBO(233, 228, 241, 1.0),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              logout().then((value) => {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Login()),
                        (route) => false)
                  });
            },
          )
        ],
      ),
      // Add a drawer property here
      drawer: Drawer(
        // Add a ListView to the drawer
        child: ListView(
          // Remove any padding from the ListView
          padding: EdgeInsets.zero,
          children: [
            // Add a DrawerHeader with your app name and logo
            DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(233, 228, 241, 1.0)),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/official2.png',
                    width: 90,
                    height: 90,
                    // You can adjust the width and height as needed
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Recipe App',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            // Add a ListTile for each page you want to navigate to
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: Text('Home Page'),
              onTap: () {
                // Navigate to the home page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
                // Close the drawer
                Navigator.maybePop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
              ),
              title: Text('About This App'),
              onTap: () {
                // Navigate to the about us page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUs(),
                  ),
                );
                // Close the drawer
                Navigator.maybePop(context);
              },
            ),
          ],
        ),
      ),

      body: currentIndex == 0 ? PostScreen() : Profile(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PostForm(
                    title: 'Add new post',
                  )));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // notchMargin: 5,
        // elevation: 10,
        // padding: EdgeInsets.only(top: 22),
        // clipBehavior: Clip.antiAlias,
        // shape: CircularNotchedRectangle(),
        // child: BottomNavigationBar(
        //   items: [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        //     BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
        //   ],
        //   currentIndex: currentIndex,
        //   onTap: (val) {
        //     setState(() {
        //       currentIndex = val;
        //     });
        //   },
        // ),
        notchMargin: 5,
        elevation: 10,
        padding: EdgeInsets.only(top: 22, left: 25, right: 25),
        clipBehavior: Clip.antiAlias,
        shape:
            CircularNotchedRectangle(), // This creates the rounded corners effect
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Customize the color as needed
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)), // Adjust the radius as needed
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile')
            ],
            currentIndex: currentIndex,
            onTap: (val) {
              setState(() {
                currentIndex = val;
              });
            },
          ),
        ),
      ),
    );
  }
}
