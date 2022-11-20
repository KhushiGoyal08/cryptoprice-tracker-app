import 'package:cryptospeed/Widgets/Cryptocurrency.dart';
import 'package:cryptospeed/modals/cryptocurrency.dart';
import 'package:cryptospeed/providers/market_Provider.dart';
import 'package:cryptospeed/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketProvider>(
      builder: (context, MarketProvider, child) {
        List<CryptoCurrency> favorites = MarketProvider.data
            .where((element) => element.isFavorite == true)
            .toList();
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                "Favorites",
                style: TextStyle(
                  color: (Provider.of<ThemeProvider>(context, listen: true)
                              .themeMode ==
                          ThemeMode.light)
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
              ),
              itemCount: favorites.length,
              itemBuilder:((context, index) {
                CryptoCurrency currentCrypto=favorites[index];
                return CryptoList(currentCrypto: currentCrypto);

                
              }
              ) ,
            ),
          ),
        );
      },
    );
    // Expanded(
    //   child: Container(
    //     child: const Text("Favorites will show Here"),
    //   ),

    // );
  }
}
