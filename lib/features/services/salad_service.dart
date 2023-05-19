import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:fruit_app/features/models/salad.dart';
import '../../core/constants.dart/string_constans.dart';

class SaladService {
  Future<List<Salad>> fetchSalads() async {
    try {
      final String response =
          await rootBundle.loadString(StringConstants.baseUrl);

      final Map<String,dynamic> data = json.decode(response);
      final List<dynamic> products = data['products'];

      return products.map((e) => Salad.fromJson(e)).toList();
    } catch (e) {
      throw Exception('servis salad fetch hatasi $e');
    }
  }
}
