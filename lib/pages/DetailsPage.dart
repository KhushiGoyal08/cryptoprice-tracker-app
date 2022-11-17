import 'package:cryptospeed/modals/cryptocurrency.dart';
import 'package:cryptospeed/providers/market_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  const DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Widget titleAndDetail(String title, String detail,CrossAxisAlignment crossAxisAlignment) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(detail,
        style: const TextStyle(
          fontSize: 17,
        ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 20,
          ),
          child: Consumer<MarketProvider>(
            builder: (context, marketProvider, child) {
              CryptoCurrency currentcrypto =
                  marketProvider.fetchCryptoById(widget.id);
              return ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(currentcrypto.image!),
                    ),
                    title: Text(
                      "${currentcrypto.name!}(${currentcrypto.symbol!.toUpperCase()})",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      "₹${currentcrypto.currentPrice}",
                      style: const TextStyle(
                        color: Color(0xff0395eb),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleAndDetail("Market Cap",
                          "₹${currentcrypto.marketCap!.toStringAsFixed(4)}",CrossAxisAlignment.start),
                           titleAndDetail("Market Cap Rank",
                          "₹${currentcrypto.marketCapRank!.toStringAsFixed(4)}",CrossAxisAlignment.end),
                    ],
                  ),
                   const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleAndDetail("Low 24h",
                          "₹${currentcrypto.low24!.toStringAsFixed(4)}",CrossAxisAlignment.start),
                           titleAndDetail("High 24h",
                          "₹${currentcrypto.high24!.toStringAsFixed(4)}",CrossAxisAlignment.end),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleAndDetail("Circulating Supply",
                          "₹${currentcrypto.circulatingSupply!.toStringAsFixed(4)}",CrossAxisAlignment.start),
                         
                    ],
                  ),
                   const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleAndDetail("All Time Low",
                          "₹${currentcrypto.atl!.toStringAsFixed(4)}",CrossAxisAlignment.start),
                           titleAndDetail("All Time High",
                          "₹${currentcrypto.ath!.toStringAsFixed(4)}",CrossAxisAlignment.end),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
