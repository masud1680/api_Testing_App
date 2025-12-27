import 'dart:math';

import 'package:api_learning/api/get_api.dart';
import 'package:flutter/material.dart';

class AddQuota extends StatefulWidget {
  const AddQuota({super.key});

  @override
  State<AddQuota> createState() => _AddQuotaState();
}

class _AddQuotaState extends State<AddQuota> {

  TextEditingController quotaController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add quota POST"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              TextField(
                controller: authorController,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Author",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              TextField(
                controller: quotaController,maxLines: 10,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Enter Quota",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),

              InkWell(
                onTap: () async {
                  var quota = quotaController.text;
                  var author = authorController.text;

                  var a = await CategoryQuotaApi.postQuotasData(quota, author);

                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
