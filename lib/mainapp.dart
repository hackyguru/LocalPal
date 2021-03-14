import 'dart:ui';
import 'package:chatApp/helper/Constants.dart';
import 'package:chatApp/helper/authenticate.dart';
import 'package:chatApp/helper/helperfunction.dart';
import 'package:chatApp/services/auth.dart';
import 'package:chatApp/services/database.dart';
import 'package:chatApp/views/Conversation_screen.dart';
import 'package:chatApp/views/loginpage.dart';
import 'package:chatApp/views/search.dart';
import 'package:chatApp/widget/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'routes.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  PageController _pageController = PageController();
  int _index;

  @override
  void initState() {
    super.initState();
    _index = 0;
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
            controller: _pageController,
            children: pages.values.toList(),
            onPageChanged: (int index) {
              setState(() {
                _index = index;
                _pageController.jumpToPage(index);
              });
            }),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        index: _index,
        items: pages.keys.toList(),
        color: Color(0xFFEF5A4C),
        buttonBackgroundColor: Color(0xFFEF5A4C),
        backgroundColor: Color(0xFFFFEEED),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int index) {
          setState(() {
            _index = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
