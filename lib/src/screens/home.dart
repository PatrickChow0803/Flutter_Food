import 'package:flutter/material.dart';
import '../commons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'What would you like to eat?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Stack(
                  children: [
                    // moves the container(red dot) within the stack widget
                    Positioned(
                      top: 12.0,
                      right: 12.0,
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    IconButton(icon: Icon(Icons.notifications_none), onPressed: () {})
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
