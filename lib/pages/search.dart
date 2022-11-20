import 'package:cryptospeed/pages/homepage.dart';
import 'package:cryptospeed/providers/market_Provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    String? text = '';
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
      ),
      child: Expanded(
        child: Column(
          children: [
            TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: ((value) {
                text=value;
                Provider.of<MarketProvider>(context, listen: false)
                        .fetchData(text);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Homepage())));
              }),
              onChanged: (c) => text = c,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    Provider.of<MarketProvider>(context, listen: false)
                        .fetchData(text);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Homepage())));
                  },
                  icon: const Icon(Icons.search),
                ),
                border: const OutlineInputBorder(),
                hintText: "Number of currency",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
