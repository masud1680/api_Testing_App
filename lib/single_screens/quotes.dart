import 'dart:math';

import 'package:api_learning/api/get_api.dart';
import 'package:api_learning/single_screens/widgets/quota_list.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  bool isLoading = true;
  final random = Random();
  List commaImg = [
    "assets/quota_icons/comma_icon_01.png",
    "assets/quota_icons/comma_icon_02.png",
    "assets/quota_icons/comma_icon_03.png",
    "assets/quota_icons/comma_icon_04.png",
  ];
  List quotaData = [];
  getData() async {
    isLoading = true;
    setState(() {});
    var apiData = await QuotaApi.getQuotesDataFromApi();
    quotaData = apiData['data'];
    // print(quotaData);

    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getData();
  }

  //  working start for search box
  TextEditingController searchController = TextEditingController();
  int searchLength = 0;
  List SearchQuotaData = [];


  // notes search and only match add queryResultNotes list
  void queryFindNotes() {
    for (dynamic singleMap in quotaData) {
      if (singleMap["quote"].toLowerCase().contains(
        searchController.text.toLowerCase(),
      ) ||
          singleMap["author"].toLowerCase().contains(
            searchController.text.toLowerCase(),
          )) {
        SearchQuotaData.add(singleMap);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));

        getData();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFE4E4E7),
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            "Motivation Quotes",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            spacing: 20,
            children: [
              // Search box
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SearchBar(
                  controller: searchController,
                  onChanged: (value) {
                    searchLength = searchController.text.length;
                    SearchQuotaData.clear();
                    queryFindNotes();
                    searchController.text.isEmpty ? SearchQuotaData.clear() : null;
                    setState(() {});

                  },
                  shape: WidgetStatePropertyAll(
                    ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  constraints: BoxConstraints(minHeight: 45),
                  keyboardType: TextInputType.text,
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20),
                  ),
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  leading: Icon(
                    Icons.search,
                    color: Color(0xFF9F9FA9),
                    size: 30,
                  ),
                  hintText: "Search authors & quotes",
                  hintStyle: WidgetStateProperty.all(
                    TextStyle(
                      color: Color(0xFF9F9FA9),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  shadowColor: WidgetStatePropertyAll(
                    Color.lerp(Colors.white, Colors.blue, 0.0),
                  ),
                ),
              ),

              isLoading
                  ?
                    // ? Center(child: Text("Loading........"))
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Skeletonizer.zone(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 10,
                                ),
                                leading: Bone.circle(size: 48),
                                title: Bone.text(words: 2),
                                subtitle: Bone.text(),
                                // trailing: Bone.icon(),
                                focusColor: Colors.red,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  // Card
                   : Expanded(
                      child: searchLength == 0
                          ? QuotaListWidget(
                        quotaData: quotaData,
                        commaImg: commaImg,
                        random: random,
                      )
                          : QuotaListWidget(
                              quotaData: SearchQuotaData,
                              commaImg: commaImg,
                              random: random,
                            ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
