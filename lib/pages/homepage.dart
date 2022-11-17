import 'package:cryptospeed/modals/cryptocurrency.dart';
import 'package:cryptospeed/pages/DetailsPage.dart';
import 'package:cryptospeed/pages/favorites.dart';
import 'package:cryptospeed/providers/market_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'Markets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  // ignore: non_constant_identifier_names
   late List Currencies;
   TabController? viewcontroller;
 
   @override
  void initstate() {
    viewcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Crypto Today",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      themeProvider.toggleTheme();
                    },
                    icon: (themeProvider.themeMode == ThemeMode.light)
                        ? const Icon(Icons.dark_mode)
                        : const Icon(Icons.light_mode),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TabBar(
                controller: viewcontroller,
                tabs: const [
                  Tab(
                    child: Text("Markets"),
                  ),
                  Tab(
                    child: Text("Favorites"),
                  ),
                ],
              ),
              const TabBarView(
                children:[ 
                  Market(),
                  Favorites(),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
