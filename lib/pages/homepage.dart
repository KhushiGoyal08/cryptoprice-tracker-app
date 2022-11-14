import 'package:cryptospeed/modals/cryptocurrency.dart';
import 'package:cryptospeed/pages/DetailsPage.dart';
import 'package:cryptospeed/providers/market_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ignore: non_constant_identifier_names
  late List Currencies;

  @override
  

  Widget build(BuildContext context) {
    ThemeProvider themeProvider =Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            
            children: [
              const Text("Welcome Back",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Text("Crypto Today",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  IconButton(
                    onPressed: () {
                      themeProvider.toggleTheme();
                    },
                  icon: (themeProvider.themeMode == ThemeMode.light) ?  const Icon(Icons.dark_mode)
                 :  const Icon(Icons.light_mode),
                  ),
                ],
              ),
              const SizedBox(
                  height: 20,
              ),
              Expanded(
                child: Consumer<MarketProvider>(
                  builder: (context,marketProvider,child){
                      if(marketProvider.isLoading==true){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                      }
                      else{
                        if(marketProvider.markets.length>0){
                             return ListView.builder(
                              physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics(),
                              ),
                              itemCount: marketProvider.markets.length,
                              itemBuilder: (context, index) {
                                CryptoCurrency currentCrypto= marketProvider.markets[index];
                                 return ListTile(

                                  // onTap: (() {
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder:(context)=>const DetailsPage() ,
                                  //       ),
                                  //   );
                                  // }),
                                  contentPadding: const EdgeInsets.all(0),
                                  leading:  CircleAvatar(
                                    
                                    backgroundImage: NetworkImage(currentCrypto.image!),
                                  ),
                                  title: Text( currentCrypto.marketCapRank.toString() + currentCrypto.name!),
                                     subtitle: Text(currentCrypto.symbol!.toUpperCase(),
                                        
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("₹${currentCrypto.currentPrice!.toStringAsFixed(4)}",
                                      style: const TextStyle(
                                        color: Color(0xff0395eb),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),),
                                      Builder(builder: (context){
                                        double priceChange =currentCrypto.priceChange24!;
                                        double priceChangePercentage =currentCrypto.priceChangePercentage24!;
                                        if(priceChange<0)
                                        {
                                          return Text("${priceChangePercentage.toStringAsFixed(2)}%{${priceChange.toStringAsFixed(4)}}",
                                          style: const TextStyle(
                                            color: Colors.red,
                                          ),
                                          );
                                        }
                                        else {
                                          return Text("${priceChangePercentage.toStringAsFixed(2)}%{+${priceChange.toStringAsFixed(4)}}",
                                          style: const TextStyle(
                                            color: Colors.green,
                                          ),
                                          );
                                        }

                                      },
                                      )
                                    ],
                                  ),
                                  );

                              } ,
                               );
                        }
                        else{
                          return const Text("Data not Found");
                        }

                      }
                  },
                  ),
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }

}