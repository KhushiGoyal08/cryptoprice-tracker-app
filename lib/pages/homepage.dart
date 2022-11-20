import 'package:cryptospeed/modals/cryptocurrency.dart';
import 'package:cryptospeed/pages/DetailsPage.dart';
import 'package:cryptospeed/pages/search.dart';
import 'package:cryptospeed/providers/market_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'Markets.dart';
import 'favorites.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ignore: non_constant_identifier_names
  late List Currencies;
  int selectedIndex = 0;
  PageController pagecontroller = PageController();

  @override
  void OnTapped(int index) {
    setState(() {
      selectedIndex = index;
      //updatecolor(index);
    });
    pagecontroller.jumpToPage(index);
  }

  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);
    // Color? colour = (themeProvider.themeMode == ThemeMode.light)
    //    ? Colors.blue
    //    : const Color.fromARGB(255, 129, 244, 188);
    // void updatecolor( int index){
    //   setState(){
    //   colour = (themeProvider.themeMode == ThemeMode.light)
    //     ? Colors.blue
    //     : const Color.fromARGB(255, 129, 244, 188);
    //   }
    // }
    return Scaffold(
      body: PageView(
        controller: pagecontroller,
        children: [
          SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                 
                  const Search(),
                  const Market(),
                ],
              ),
            ),
          ),
          // Container(
          //   child: Search(),
          // ),
          Container(
            child: const Favorites(),
          ),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: (themeProvider.themeMode == ThemeMode.light)
            ? Colors.blue
            : const Color.fromARGB(255, 129, 244, 188),
        unselectedItemColor: Colors.grey,
        onTap: OnTapped,
      ),
    );
  }
}
