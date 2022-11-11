import 'package:cryptospeed/providers/marketProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<MarketProvider>(
        create: (context) => MarketProvider(),
      ),
    ],
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Homepage(),
    ),
    );
  
  }
}
