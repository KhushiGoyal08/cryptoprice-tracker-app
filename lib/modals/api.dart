import 'dart:convert';

import 'package:http/http.dart' as http;
 
class API{
  static Future<List<dynamic>> getMarket() async{
    try{
    Uri uri= Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false");
    var response = await http.get(uri);
    var decodeResponse =jsonDecode(response.body);

    List<dynamic> data =decodeResponse as List<dynamic>;
    return data;
    } catch(ex){
      return[];
    }
 }
}