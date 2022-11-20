import 'package:cryptospeed/modals/cryptocurrency.dart';
import 'package:cryptospeed/providers/market_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/DetailsPage.dart';


class CryptoList extends StatelessWidget {
  final CryptoCurrency currentCrypto;
  const CryptoList({super.key, required this.currentCrypto});

  @override
  Widget build(BuildContext context) {
  MarketProvider marketProvider= Provider.of<MarketProvider>(context,listen: true);

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
                                  
                                  contentPadding: const EdgeInsets.all(15),
                                  leading:  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(currentCrypto.image!),
                                  ),
                                  title: Row(
                                    children: [
                                      
                                    Flexible(
                                       child: Text( currentCrypto.marketCapRank.toString() + "\n"+ currentCrypto.name!,
                                 // overflow:TextOverflow.ellipsis ,                      
                                       ),
                                    ),
                                     (currentCrypto.isFavorite==false) ? GestureDetector(
                                        onTap: () {
                                          marketProvider.Addfavorite(currentCrypto);
                                          
                                        },
                                        child:const Icon(CupertinoIcons.heart,
                                        size: 20,
                                        ) ,
                                      ):
                                      GestureDetector(
                                        onTap: () {
                                          marketProvider.Removefavorite(currentCrypto);
                                          
                                        },
                                        child:const Icon(CupertinoIcons.heart_fill,
                                        color: Colors.red,
                                        size: 20,
                                        ) ,
                                      ),
                                    ],
                                  ),
                                     subtitle: Text(currentCrypto.symbol!.toUpperCase(),
                                        
                                  ),
                                  trailing: Column(
                                   // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      // GestureDetector(
                                      //   onTap: () {
                                          
                                      //   },
                                      //   child:const Icon(CupertinoIcons.heart) ,
                                      // ),
                                    
                                    Container(
                                       child: 
                                         Text("₹${currentCrypto.currentPrice!.toStringAsFixed(4)}",
                                          style: const TextStyle(
                                            color: Color(0xff0395eb),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                          ),
                                       
                                     ),
                                      
                                      Container(
                                        child:
                                          Builder(builder: (context){
                                            double priceChange =currentCrypto.priceChange24!;
                                            double priceChangePercentage =currentCrypto.priceChangePercentage24!;
                                            if(priceChange<0)
                                            {
                                              return
                                                
                                               Text("${priceChangePercentage.toStringAsFixed(2)}%{${priceChange.toStringAsFixed(4)}}",
                                              style: const TextStyle(
                                                color: Colors.red,
                                              ),
                                              
                                              );
                                            }
                                            else {
                                              return
                                                Text("${priceChangePercentage.toStringAsFixed(2)}%{+${priceChange.toStringAsFixed(4)}}",
                                                
                                              style: const TextStyle(
                                                color: Colors.green,
                                              ),
                                              
                                              );
                                            }
                                  
                                          },
                                          ),
                                        
                                      ),
                                      // Container(
                                      //   child:
                                      //     GestureDetector(
                                      //       onTap: () {
                                              
                                      //       },
                                      //       child:const Icon(CupertinoIcons.heart) ,
                                      //     ),
                                        
                                      // ),
                                    ],
                                  ),
                                  );
  }
}