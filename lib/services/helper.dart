import 'package:azshop/services/config.dart';
import 'package:flutter/services.dart' as the_bundle;

import '../models/sneaker_model.dart';
import 'package:http/http.dart' as http;

// this class fetches data from the json file and return it to the app
class Helper {
  static var client = http.Client();
  
  // Male
  Future<List<Sneakers>> getMaleSneakers() async {
    var url = Uri.http(Config.apiUrl, Config.sneakers);

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final maleList = sneakersFromJson(response.body);
      var male =
          maleList.where((element) => element.category == "Men's Running");
      return male.toList();
    } else {
      throw Exception("Failed get snakers List");
    }
  }

// Female
  Future<List<Sneakers>> getFemaleSneakers() async {
    var url = Uri.http(Config.apiUrl, Config.sneakers);

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final femaleList = sneakersFromJson(response.body);
      var female =
          femaleList.where((element) => element.category == "Women's Running");
      return female.toList();
    } else {
      throw Exception("Failed get snakers List");
    }
  }

// Kids
  Future<List<Sneakers>> getKidsSneakers() async {
    var url = Uri.http(Config.apiUrl, Config.sneakers);

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final kidsList = sneakersFromJson(response.body);
      var kids =
          kidsList.where((element) => element.category == "Kid's Running");
      return kids.toList();
    } else {
      throw Exception("Failed get snakers List");
    }
  }

  Future<List<Sneakers>> search(String searchQuery) async {
    var url = Uri.http(Config.apiUrl, "${Config.search}$searchQuery");

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final results = sneakersFromJson(response.body);
      
      return results;
    } else {
      throw Exception("Failed get snakers List");
    }
  }

}
