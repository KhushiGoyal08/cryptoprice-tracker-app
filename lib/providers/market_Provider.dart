import 'dart:async';
import 'package:cryptospeed/modals/cryptocurrency.dart';
import 'package:flutter/cupertino.dart';
import '../modals/api.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CryptoCurrency> markets = [];
  MarketProvider(){
    fetchData();
  }

  void fetchData() async {
      List<dynamic> markets = await API.getMarket();
      List<CryptoCurrency> temp =[];
      for(var market in markets){
        CryptoCurrency newCrypto = CryptoCurrency.fromJSON(market);
        temp.add(newCrypto);
      }

      markets=temp;
      isLoading =false;
      notifyListeners();
      Timer(const Duration(seconds: 3),(){
        fetchData();
      });
  }
}
