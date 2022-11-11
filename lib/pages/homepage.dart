import 'package:cryptospeed/modals/cryptocurrency.dart';
import 'package:cryptospeed/providers/marketProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late List Currencies;

  @override
  

  Widget build(BuildContext context) {
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
              const Text("Crypto Today",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
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
                                parent: AlwaysScrollableScrollPhysics()
                              ),
                              itemCount: marketProvider.markets.length,
                              itemBuilder: (context, index) {
                                CryptoCurrency currentCrypto= marketProvider.markets[index];
                                 return ListTile(
                                  leading:  CircleAvatar(
                                    
                                    backgroundImage: NetworkImage(currentCrypto.image!),
                                  ),
                                  title: Text(currentCrypto.name!),
                                     subtitle: Text(currentCrypto.symbol!.toUpperCase(),
                                        
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("₹"+currentCrypto.currentPrice!.toStringAsFixed(4),
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
                                          return Text("$priceChangePercentage");
                                        }
                                        else {
                                          return Text("");
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
                          return Text("Data not Found");
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