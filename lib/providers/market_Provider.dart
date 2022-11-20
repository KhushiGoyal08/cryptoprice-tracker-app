import 'dart:async';
import 'package:cryptospeed/modals/cryptocurrency.dart';
import 'package:cryptospeed/modals/localStorage.dart';
import 'package:cryptospeed/pages/Markets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import '../modals/api.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CryptoCurrency> data = [];
  MarketProvider() {
    String? text;
    fetchData(text);
  }

  Future<String> fetchData(String? text) async {
    List<dynamic> _markets = await API.getMarket(text!);
    List<String> favorites = await LocalStorage.Fetchfavorite();
    List<CryptoCurrency> temp = [];
    for (var market in _markets) {
      CryptoCurrency newCrypto = CryptoCurrency.fromJSON(market);
      if (favorites.contains(newCrypto.id!)) {
        newCrypto.isFavorite = true;
      }
      temp.add(newCrypto);
    }

    data = temp;
    isLoading = false;
    notifyListeners();
   
    return text;
  }

  CryptoCurrency fetchCryptoById(String id) {
    CryptoCurrency crypto =
        data.where((element) => element.id == id).toList()[0];
    return crypto;
  }

  void Addfavorite(CryptoCurrency crypto) async {
    int indexOfCrypto = data.indexOf(crypto);
    data[indexOfCrypto].isFavorite = true;
    await LocalStorage.Addfavorite(crypto.id!);

    notifyListeners();
  }

  void Removefavorite(CryptoCurrency crypto) async {
    int indexOfCrypto = data.indexOf(crypto);
    data[indexOfCrypto].isFavorite = false;
    await LocalStorage.Removefavorite(crypto.id!);

    notifyListeners();
  }
}
