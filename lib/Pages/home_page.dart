import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: Text("General Cargo", 
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            margin: EdgeInsets.all(10),
            child: Text("Status Update",
            style: TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.bold
            ),), 

            

          )
        ],
      ),
    );
  }
}