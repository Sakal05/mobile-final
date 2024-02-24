import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About This App',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromRGBO(233, 228, 241, 1.0),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
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
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page'),
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
                Navigator.maybePop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About This App'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUs(),
                  ),
                );
                Navigator.maybePop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // margin: EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  'assets/images/official2.png',
                  width: 400,
                  height: 400,
                ),
              ),
              SizedBox(height: 0), // Add spacing between logo and paragraphs
              // First paragraph with custom icon
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red), // Using heart icon
                    SizedBox(width: 18),
                    Expanded(
                      child: Text(
                        'This app is developed by a group of PIU students who love to share their recipes with the world.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              // Second paragraph with custom icon
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.language,
                        color: Colors.green), // Using globe icon
                    SizedBox(width: 18),
                    Expanded(
                      child: Text(
                        'You can find delicious and easy-to-make food recipes from different people all around the world.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              // Third paragraph with custom icon
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.explore,
                        color: Colors.blue), // Using compass icon
                    SizedBox(width: 18),
                    Expanded(
                      child: Text(
                        'We hope you enjoy using our app and discover new dishes to try out.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height:
                      32), // Add spacing between paragraphs and contact info
              // Contact information
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    'piurecipes@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.phone, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    '+855 23 456 789',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
