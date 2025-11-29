import 'dart:math';

import 'package:api_learning/api/get_api.dart';
import 'package:api_learning/single_screens/widgets/name_list.dart';

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NamesScreen extends StatefulWidget {
  const NamesScreen({super.key});

  @override
  State<NamesScreen> createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> {
  bool isLoading = true;
  final random = Random();

  List NameData = [];

  getData() async {
    isLoading = true;
    setState(() {});
    var apiData = await NamesApi.getNamesDataFromApi();
    NameData = apiData['data'];
    // print(quotaData);
    isAlphabetButtonClick = false;
    isLoading = false;
    setState(() {});
  }

  bool isAlphabetButtonClick = false;
  getAlphabetData(alphabetValue) async {
    isLoading = true;
    setState(() {});
    var apiData = await NamesApi.getNamesDataAlphabetFromApi(alphabetValue);
    NameData = apiData['data'];
    // print(NameData);
    isAlphabetButtonClick = true;
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
  List SearchNameData = [];

  // notes search and only match add queryResultNotes list
  void queryFindNotes() {
    for (dynamic singleMap in NameData) {
      if (singleMap["gender"].toLowerCase().contains(
        searchController.text.toLowerCase(),
      )) {
        SearchNameData.add(singleMap);
      } else if (singleMap["name_bn"].toLowerCase().contains(
        searchController.text.toLowerCase(),
      )) {
        SearchNameData.add(singleMap);
      } else if (singleMap["name_en"].toLowerCase().contains(
        searchController.text.toLowerCase(),
      )) {
        SearchNameData.add(singleMap);
      } else if (singleMap["bn_meaning"].toLowerCase().contains(
        searchController.text.toLowerCase(),
      )) {
        SearchNameData.add(singleMap);
      } else if (singleMap["religion"]["title"].toLowerCase().contains(
        searchController.text.toLowerCase(),
      )) {
        SearchNameData.add(singleMap);
      }
    }
  }

  // working for alphabet buttons search names
  List<String> alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];
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
            "Baby Names",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            // spacing: 20,
            children: [
              SizedBox(height: 10),
              // alphabet find Circle
              SizedBox(
                height: 38,
                child: ListView.builder(

                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: alphabet.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(CircleBorder()),
                          backgroundColor: WidgetStatePropertyAll(Colors.blue),
                          overlayColor: WidgetStatePropertyAll(Colors.yellow)
                        ),
                        onPressed: () {

                          getAlphabetData(alphabet[index]);
                        }, child: Text(
                        "${alphabet[index]}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      ),
                    );
                  },
                ),
              ),
              // Search box
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: SearchBar(
                  controller: searchController,
                  onChanged: (value) {
                    searchLength = searchController.text.length;
                    SearchNameData.clear();
                    queryFindNotes();
                    searchController.text.isEmpty
                        ? SearchNameData.clear()
                        : null;
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
                  hintText: "Search...",
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
                          ? NameListWidget(
                              nameData: NameData,
                              random: random,
                              isAlphabetButtonClick: isAlphabetButtonClick,
                            )
                          : NameListWidget(
                              nameData: SearchNameData,
                              random: random,
                              isAlphabetButtonClick: isAlphabetButtonClick,
                            ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
