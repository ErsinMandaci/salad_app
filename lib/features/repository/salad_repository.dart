import 'dart:convert';

import 'package:flutter/services.dart';

import '../../core/constants.dart/string_constans.dart';
import '../models/salad.dart';

class SaladRepository {
  Future<List<Salad>> fetchSaladsFromApi() async {
    try {
      final String response =
          await rootBundle.loadString(StringConstants.baseUrl);

      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> products = data['products'];

      return products.map((e) => Salad.fromJson(e)).toList();
    } catch (e) {
      throw Exception('repository salad fetch hatasi $e');
    }
  }
}
