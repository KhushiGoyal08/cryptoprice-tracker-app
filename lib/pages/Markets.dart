

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modals/cryptocurrency.dart';
import '../providers/market_Provider.dart';
import 'DetailsPage.dart';

class Market extends StatefulWidget {
  const Market({super.key});

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return         Expanded(
                child: Consumer<MarketProvider>(
                  builder: (context,marketProvider,child){
                      if(marketProvider.isLoading==true){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                      }
                      else{
                        if(marketProvider.data.length>0){
                             return ListView.separated(
                              separatorBuilder: (context,index)=>const Divider(
                                color: Colors.grey,
                              ),
                              physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics(),
                              ),
                              itemCount: marketProvider.data.length,
                              itemBuilder: (context, index) {
                                CryptoCurrency currentCrypto= marketProvider.data[index];
                                 return ListTile(

                                  onTap: (() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:(context)=> DetailsPage(
                                          id: currentCrypto.id!,
                                        ) ,
                                        ),
                                    );
                                  }),
                                  
                                  contentPadding: const EdgeInsets.all(10),
                                  leading:  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(currentCrypto.image!),
                                  ),
                                  title: Text( currentCrypto.marketCapRank.toString() + "\n"+ currentCrypto.name!),
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
              );
  }
}