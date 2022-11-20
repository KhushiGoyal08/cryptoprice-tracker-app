import 'package:cryptospeed/constants/themes.dart';
import 'package:cryptospeed/pages/homepage.dart';
import 'package:cryptospeed/providers/market_Provider.dart';
import 'package:cryptospeed/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider<MarketProvider>(
        create: (context) => MarketProvider(),
      ),
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
      ),
    ],
     child: Consumer<ThemeProvider>(
      builder: (context, themeProvider, child){
         return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme:lightTheme,
      darkTheme: DarkTheme,
      home: const Homepage(),
    );
     },
     ),
    
    );
  
  }
}
