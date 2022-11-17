class CryptoCurrency{

   String? id;
   String? symbol;
   String? name;
   String? image;
  double? currentPrice;
   double? marketCap;
   double? high24;
   double? low24;
   int? marketCapRank;
   double? priceChange24;
   double? priceChangePercentage24;
   double? circulatingSupply;
   double? ath;
   double?atl;
   CryptoCurrency({
    required this.id,required this.symbol,required this.name,required this.image,required this.currentPrice,required this.marketCap,required this.high24,required 
    this.marketCapRank,required this.low24,required this.priceChange24,required this.priceChangePercentage24,required this.ath,required this.atl,required this.circulatingSupply
   }
   
   );
   factory CryptoCurrency.fromJSON(Map<String,dynamic>map){
    return CryptoCurrency(
      id:map["id"] ,
     symbol: map["symbol"], 
    name: map["name"],
     image: map["image"], 
     currentPrice: double.parse(map["current_price"].toString()), 
    marketCap: double.parse(map["market_cap"].toString()),
     high24: double.parse(map["high_24h"].toString()), 
     marketCapRank: map["market_cap_rank"],
 low24: double.parse(map["low_24h"].toString()), 
 priceChange24: double.parse(map["price_change_24h"].toString()), 
 priceChangePercentage24:double.parse(map["price_change_percentage_24h"].toString()), 
 ath:double.parse(map["ath"].toString()) ,
  atl:double.parse(map["atl"].toString()) ,
circulatingSupply:double.parse(map["circulating_supply"].toString())
    );
   }
}
