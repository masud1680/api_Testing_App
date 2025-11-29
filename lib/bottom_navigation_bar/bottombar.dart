import 'package:api_learning/single_screens/Quotes.dart';
import 'package:flutter/material.dart';
class BottomSwitchScreen extends StatefulWidget {
  const BottomSwitchScreen({super.key});

  @override
  State<BottomSwitchScreen> createState() => _BottomSwitchScreenState();
}

class _BottomSwitchScreenState extends State<BottomSwitchScreen> {
  // State variable to hold the selected index
  int pageIndex = 0;

  List screen = [QuotesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[pageIndex],
      bottomNavigationBar: Theme(
        // This creates a custom theme ONLY for this widget subtree
        data: Theme.of(context).copyWith(
          // 1. Remove the ripple/splash effect
          splashColor: Colors.transparent,

          // 2. Remove the solid highlight effect that appears on hold
          highlightColor: Colors.transparent,

          // Optional: For newer Flutter versions/Material 3, you can use:
          // splashFactory: NoSplash.splashFactory,
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFFFAFAFA),
          selectedItemColor: Colors.blue,


          currentIndex: pageIndex,
          onTap: (index) {

            pageIndex = index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined),
              label: "Quotes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete_forever),
              label: "Names",
            ),
          ],
        ),
      ),

    );
  }
}
