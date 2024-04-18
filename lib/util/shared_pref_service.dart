import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _operationsKey = 'operations';

  static Future<void> saveOperations(
      List<Map<String, dynamic>> operations) async {
    final prefs = await SharedPreferences.getInstance();
    final String operationsJson = json.encode(operations);
    await prefs.setString(_operationsKey, operationsJson);
  }

  static Future<List<Map<String, dynamic>>> loadOperations() async {
    final prefs = await SharedPreferences.getInstance();
    final String? operationsJson = prefs.getString(_operationsKey);
    if (operationsJson != null) {
      final List<dynamic> operationsList = json.decode(operationsJson);
      return operationsList
          .map((operationMap) => Map<String, dynamic>.from(operationMap))
          .toList();
    } else {
      return [];
    }
  }
}
