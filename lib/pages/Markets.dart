

import 'package:cryptospeed/Widgets/Cryptocurrency.dart';
import 'package:flutter/cupertino.dart';
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
                                 return CryptoList(currentCrypto: currentCrypto);

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