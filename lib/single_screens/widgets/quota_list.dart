import 'dart:math';
import 'package:flutter/material.dart';

import '../Quotes.dart';

class QuotaListWidget extends StatelessWidget {
  const QuotaListWidget({
    super.key,
    required this.quotaData,
    required this.commaImg,
    required this.random,
  });

  final List quotaData;
  final List commaImg;
  final Random random;

  @override
  Widget build(BuildContext context) {
    return quotaData.isEmpty
    ? Center(child: Text("No data found!!"))
        : ListView.builder(
      padding: EdgeInsets.only(bottom: 100),

      itemCount: quotaData.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFD4D4D4),
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
          ),
          height: 110,
          width: MediaQuery.of(context).size.width,

          child: ListTile(
            leading: Image(
              image: AssetImage("${commaImg[random.nextInt(commaImg.length)]}"),
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),
            title: Text(
              '"${quotaData[index]['quote']}"',
              maxLines: 2,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            subtitle: Text(
              "${quotaData[index]['author']}",
              maxLines: 1,
              style: TextStyle(
                color: Color(0xFF9F9FA9),
                fontWeight: FontWeight.w400,
                fontSize: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}




// class QuotaListWidget extends StatelessWidget {
//   const QuotaListWidget({
//     super.key,
//     required this.quotaData,
//     required this.commaImg,
//     required this.random,
//   });
//
//   final List quotaData;
//   final List commaImg;
//   final Random random;
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//         child: ListView.builder(
//           padding: EdgeInsets.only(bottom: 100),
//
//           itemCount: quotaData.length,
//           itemBuilder: (context, index) {
//             return Container(
//               margin: EdgeInsets.only(bottom: 10),
//               decoration: BoxDecoration(
//                 color: Color(0xFFF9FAFB),
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xFFD4D4D4),
//                     spreadRadius: 1,
//                     blurRadius: 1,
//                   ),
//                 ],
//               ),
//               height: 110,
//               width: MediaQuery.of(context).size.width,
//
//               child: ListTile(
//                 leading: Image(
//                   image: AssetImage("${commaImg[random.nextInt(commaImg.length)]}"),
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.fill,
//                 ),
//                 title: Text(
//                   '"${quotaData[index]['quote']}"',
//                   maxLines: 2,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//
//                 subtitle: Text(
//                   "${quotaData[index]['author']}",
//                   maxLines: 1,
//                   style: TextStyle(
//                     color: Color(0xFF9F9FA9),
//                     fontWeight: FontWeight.w400,
//                     fontSize: 15,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ), onRefresh: () async{
//       await Future.delayed(Duration(seconds: 1));
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuotesScreen(),));
//
//
//
//     });
//   }
// }



