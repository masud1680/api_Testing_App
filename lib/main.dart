import 'package:api_learning/bottom_navigation_bar/bottombar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: QuotesScreen(),
    home: BottomSwitchScreen(),
    builder: EasyLoading.init(),
  ));
}

