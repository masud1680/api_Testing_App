import 'dart:convert';

import 'package:http/http.dart' as http;

class QuotaApi{

 static getQuotesDataFromApi()async{

    var url = Uri.parse("https://appapi.coderangon.com/api/slider");
    var response = await http.get(url);
    return jsonDecode(response.body);

  }



}

class NamesApi{

static getNamesDataFromApi()async{
var baseUrl = "https://appapi.coderangon.com/api/names/";
  var url = Uri.parse(baseUrl);
  var response = await http.get(url);
  return jsonDecode(response.body);

}
static getNamesDataAlphabetFromApi(alphabetValue)async{

  var url = Uri.parse("https://appapi.coderangon.com/api/names/${alphabetValue}");
  var response = await http.get(url);
  return jsonDecode(response.body);

}
}
