import 'dart:async';
import 'package:cryptospeed/modals/cryptocurrency.dart';
import 'package:flutter/cupertino.dart';
import '../modals/api.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CryptoCurrency> data = [];
  MarketProvider(){
    fetchData();
  }

  void fetchData() async {
      List<dynamic> _markets = await API.getMarket();
      List<CryptoCurrency> temp =[];
      for(var market in _markets){
        CryptoCurrency newCrypto = CryptoCurrency.fromJSON(market);
        temp.add(newCrypto);
      }

      data=temp;
      isLoading =false;
      notifyListeners();
      Timer(const Duration(seconds: 3),(){
        fetchData();
      });
  }
  
  CryptoCurrency fetchCryptoById(String id){
    CryptoCurrency crypto = data.where((element) => element.id==id).toList()[0];
    return crypto;
  }

}
