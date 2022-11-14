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
    return CryptoCurrency(id:map["id"] , symbol: map["symbol"], name: map["name"], image: map["image"], currentPrice: map["current_price"], marketCap: map["market_cap"], high24: map["high_24h"], marketCapRank: map["market_cap_rank"], low24: map["low_24h"], priceChange24: map["price_change_24h"], priceChangePercentage24:map["price_change_percentage_24h"], ath:map["ath"] , atl:map["atl"] , circulatingSupply:map["circulating_supply"] );
   }
}
