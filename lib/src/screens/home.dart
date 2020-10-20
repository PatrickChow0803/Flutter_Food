import 'package:flutter/material.dart';
import 'package:flutter_food/src/widgets/custom_text.dart';
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
                  child: CustomText(
                    text: 'What would you like to eat?',
                    size: 18,
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
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: white, boxShadow: [
                  BoxShadow(
                    color: grey[300],
                    offset: Offset(1, 1),
                    blurRadius: 4,
                  ),
                ]),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: red,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: 'Find food or restaurants',
                      border: InputBorder.none,
                    ),
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: red,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                color: red[50],
                                offset: Offset(4, 6),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Image.asset(
                                'images/salad.png',
                                width: 50,
                              )),
                        ),
                        SizedBox(height: 10),
                        CustomText(
                          text: 'Salad',
                          size: 14,
                          colors: black,
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
