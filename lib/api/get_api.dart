import 'dart:convert';

import 'package:http/http.dart' as http;

class QuotaApi{

 static getDataFromApi()async{

    var url = Uri.parse("https://appapi.coderangon.com/api/slider");
    var response = await http.get(url);
    return jsonDecode(response.body);

  }
}
