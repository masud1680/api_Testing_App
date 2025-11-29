import 'dart:math';
import 'package:flutter/material.dart';

import '../Quotes.dart';

class NameListWidget extends StatelessWidget {
  const NameListWidget({
    super.key,
    required this.nameData,
    required this.random, required this.isAlphabetButtonClick,

  });

  final List nameData;
  final Random random;
  final bool isAlphabetButtonClick;

  @override
  Widget build(BuildContext context) {
    return nameData.isEmpty
        ? Center(child: Text("No data found!!"))
        : ListView.builder(
            padding: EdgeInsets.only(bottom: 100),

            itemCount: nameData.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFFF8F7F2),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFD4D4D4),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                height: 200,
                width: MediaQuery.of(context).size.width,

                // card vertically 2 part
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //1st part
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          // bangle name & gender card
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // bangle name
                              Text(
                                "${nameData[index]['name_bn']}",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              //gender card
                              Card(
                                color: Colors.blue,
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 2,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 2,
                                    children: [
                                      // icon
                                      Icon(
                                        nameData[index]['gender'] == "Boy"
                                            ? Icons.boy
                                            : Icons.girl,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      Text(
                                        "${nameData[index]['gender']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "*${nameData[index]['name_en']}*",
                            maxLines: 1,
                            style: TextStyle(
                              color: Color(0xFF9F9FA9),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(color: Colors.grey, height: 1),

                    //2nd part
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //bn_meaning meaning
                        Flexible(
                          child: Text(
                            "${nameData[index]['bn_meaning']}",
                            maxLines: 1,
                            style: TextStyle(
                              color: Color(0xFF737373),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),

                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 2,
                            children: [
                              //Religion icon
                              Card(
                                color: Colors.blue,
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: isAlphabetButtonClick ? Icon(
                                    nameData[index]['religion']==
                                            "Islam"
                                        ? Icons.mosque_rounded
                                        : nameData[index]['religion']==
                                              "Hinduism"
                                        ? Icons.temple_hindu_outlined
                                        : nameData[index]['religion']==
                                              "Christianity"
                                        ? Icons.church_outlined
                                        : Icons.ac_unit_outlined,
                                    color: Colors.white,
                                  ) : Icon(
                                    nameData[index]['religion']['title'] ==
                                        "Islam"
                                        ? Icons.mosque_rounded
                                        : nameData[index]['religion']['title'] ==
                                        "Hinduism"
                                        ? Icons.temple_hindu_outlined
                                        : nameData[index]['religion']['title'] ==
                                        "Christianity"
                                        ? Icons.church_outlined
                                        : Icons.ac_unit_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              //Religion name
                              Text(
                                isAlphabetButtonClick ? "${nameData[index]['religion']}" : "${nameData[index]['religion']['title']}",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Color(0xFF737373),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
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
