import 'dart:ui';

import 'package:flutter/material.dart';

class HeaderBar extends StatefulWidget {
  const HeaderBar({super.key});

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: AppBar(
          title: Image.asset('assets/images/Sprout_logo.jpg',fit: BoxFit.contain,),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                size: 40.0,
                color: Colors.blueAccent,
              ),
              onPressed: () {
                //-------Need to Write the Logic----------
              },),
            IconButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              onPressed: () {

              },
            )
          ],
          backgroundColor: Colors.white10,
        ),
    );
    // return const Scaffold(
    //   body: SafeArea(
    //     child: Row(
    //       children: <Widget>[
    //         Image(image: AssetImage('assets/images/Sprout_logo.jpg')),
    //       ],
    //     ),
    //   ),
    // );

  }
}
