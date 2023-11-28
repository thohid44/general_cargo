import 'package:flutter/material.dart';
import 'package:general_cargo/screen/view/book_now_page.dart';
import 'package:general_cargo/screen/view/percel_rate_page.dart';
import 'package:general_cargo/screen/view/tracking_page.dart';
import 'package:get/get.dart';

import '../../Pages/Auth/view/login_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // List of pages to be displayed
  final List<Widget> _pages = [
TrackingPage(), 
    BookNowPage(),
  ParcelRatePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text("General Cargo"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(LoginPage());
                },
                icon: Icon(Icons.arrow_forward))
          ],
        ),
      body: _pages[_currentIndex], // Display the selected page

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Track Now ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Book Now',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Parcel Rate',
          ),
        ],
      ),
    );
  }
}
