import 'package:api_learning/bottom_navigation_bar/bottombar.dart';
import 'package:api_learning/single_screens/quotes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: QuotesScreen(),
    home: BottomSwitchScreen(),
  ));
}