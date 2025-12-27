import 'dart:developer';

import 'package:api_learning/api/get_api.dart';
import 'package:api_learning/single_screens/widgets/add_quota.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CategoryQuota extends StatefulWidget {
  const CategoryQuota({super.key});

  @override
  State<CategoryQuota> createState() => _CategoryQuotaState();
}

class _CategoryQuotaState extends State<CategoryQuota>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);

  bool isLoading = true;
  List qData = [];

  getQuotaData() async {
    isLoading = true;
    setState(() {});
    var responseData = await CategoryQuotaApi.getQuotasData();
    if (responseData['status'] == "Success") {
      qData = responseData['data'];

    }else if(responseData['status'] == "Error"){
      qData = [];
    }
    // print(qData);

    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getQuotaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Category Quota GET"),
      ),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : qData.isEmpty
          ? Center(child: Text("No data Found!!"))
          : ListView.builder(
              itemCount: qData.length,
              itemBuilder: (context, index) {
                return Slidable(
                  controller: controller,
                  // Specify a key if the Slidable is dismissible.
                  key: const ValueKey(1),

                  // The start action pane is the one at the left or the top side.
                  startActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: const ScrollMotion(),

                    // All actions are defined in the children parameter.
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                        onPressed: (context) async {
                          var quotaId = qData[index]['id'];
                          await CategoryQuotaApi.deleteQuotasData(quotaId);
                          await getQuotaData();
                          // setState(() {});
                        },

                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          log("======");
                        },
                        backgroundColor: const Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.share,
                        label: 'Share',
                      ),
                    ],
                  ),

                  // The end action pane is the one at the right or the bottom side.
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {}),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        flex: 2,
                        onPressed: (context) {
                          log("======");
                        },
                        backgroundColor: const Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                        label: 'Archive',
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          log("======");
                        },
                        backgroundColor: const Color(0xFF0392CF),
                        foregroundColor: Colors.white,
                        icon: Icons.save,
                        label: 'Update',
                      ),
                    ],
                  ),

                  // The child of the Slidable is what the user sees when the
                  // component is not dragged.
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: Text(
                        "${qData[index]['id']}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    title: Text(
                      "${qData[index]['quote']}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "${qData[index]['author']}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                );
              },
            ),

      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddQuota()),
          ).then((value) => getQuotaData());
        },
        child: CircleAvatar(radius: 30, child: Icon(Icons.add, size: 40)),
      ),
    );
  }
}
