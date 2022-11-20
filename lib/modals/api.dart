import 'dart:convert';

import 'package:http/http.dart' as http;
 
class API{
  static Future<List<dynamic>> getMarket(String coin) async{
    try{
    Uri uri= Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=$coin&page=1&sparkline=false");
    var response = await http.get(uri);
    var decodeResponse =jsonDecode(response.body);

    List<dynamic> data =decodeResponse as List<dynamic>;
    return data;
    } catch(ex){
      return[];
    }
 }

//  Future<Map<String,dynamic>> chart() async{
//   Uri url =Uri.parse("https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=inr&days=7");
//   var respond = await http.get(url);
//   var decode =jsonDecode(respond.body);
//     Map<String,dynamic> Query = decode as Map<String,dynamic>;
//     return Query;
//    }
}