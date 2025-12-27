import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class QuotaApi {
  static getQuotesDataFromApi() async {
    var url = Uri.parse("https://appapi.coderangon.com/api/slider");
    var response = await http.get(url);
    return jsonDecode(response.body);
  }
}

class NamesApi {
  static getNamesDataFromApi() async {
    var baseUrl = "https://appapi.coderangon.com/api/names/";
    var url = Uri.parse(baseUrl);
    var response = await http.get(url);
    return jsonDecode(response.body);
  }

  static getNamesDataAlphabetFromApi(alphabetValue) async {
    var url = Uri.parse(
      "https://appapi.coderangon.com/api/names/${alphabetValue}",
    );
    var response = await http.get(url);
    return jsonDecode(response.body);
  }
}

class CategoryQuotaApi {
  static  getQuotasData() async {
 try{
   var url = Uri.parse('https://appapi.coderangon.com/api/quotations/3');
   var response = await http.get(url);
   // log("=============${response.body}===========");
   return jsonDecode(response.body);
 }catch(error){
   log("Error is : $error");
 }
  }

  static Future<void> postQuotasData( String quote, String author) async {
    try {
      var url = Uri.parse('https://appapi.coderangon.com/api/quotations');
      var headers = {"Accept": "Application/json"};
      var body = {"category_id" : "3", "quote": quote, "author": author};
      var response = await http.post(url, headers: headers, body: body);
      if(response.statusCode == 201){
        EasyLoading.showSuccess('Quota Created Successfully');
        return jsonDecode(response.body);
      }else{
        EasyLoading.showError('${response.statusCode}');

      }


    } catch (error) {
      EasyLoading.showError('$error');
    }
  }

  static putQuotasData(int categoryId, String quota, String author) async {
    try {
      var url = Uri.parse(
        'https://appapi.coderangon.com/api/quotations/$categoryId',
      );
      var headers = {"Accept": "Application/json"};
      var body = {"quote": quota, "author": author};

      var response = await http.put(url, headers: headers, body: body);
      return jsonDecode(response.body);
    } catch (error) {
      log("Error is : $error");
    }
  }

  static deleteQuotasData(int quotaId) async {
    try {
      var url = Uri.parse(
        'https://appapi.coderangon.com/api/quotations/$quotaId',
      );
      var response = await http.delete(url);

      if(response.statusCode == 200){
        EasyLoading.showSuccess('Quota Deleted Successfully');

      }else{
        EasyLoading.showError('${response.statusCode}');

      }
      return jsonDecode(response.body);


    } catch (error) {
      EasyLoading.showError('$error');
    }
  }
}
