import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/rental.dart';

class SharedPreferencesService {
  static const String _rentedBoatKey = 'vending_machines';

  Future<void> saveRentedBoat(List<Rental> rentedBoat) async {
    final prefs = await SharedPreferences.getInstance();
    final rentedBoatJson =
        jsonEncode(rentedBoat.map((vm) => vm.toJson()).toList());
    await prefs.setString(_rentedBoatKey, rentedBoatJson);
  }

  Future<List<Rental>> getRentedBoat() async {
    final prefs = await SharedPreferences.getInstance();
    final rentedBoatJson = prefs.getString(_rentedBoatKey);
    if (rentedBoatJson != null) {
      final List<dynamic> rentedBoatList = jsonDecode(rentedBoatJson);
      return rentedBoatList.map((json) => Rental.fromJson(json)).toList();
    }
    return [];
  }
}
