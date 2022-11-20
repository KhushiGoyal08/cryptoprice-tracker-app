import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
  static Future<bool> Addfavorite(String id) async{
       SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
       List<String> favorites =sharedPreferences.getStringList("favorites") ?? [];
       favorites.add(id);
      return await sharedPreferences.setStringList("favorites", favorites);

  }
  static Future<bool> Removefavorite(String id) async{
       SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
       List<String> favorites =sharedPreferences.getStringList("favorites") ?? [];
       favorites.remove(id);
      return await sharedPreferences.setStringList("favorites", favorites);

  }
  static Future<List<String>> Fetchfavorite() async{
       SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
       
      return sharedPreferences.getStringList("favorites") ?? [];

  }

}