import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:fruit_app/core/constants.dart/string_constans.dart';
import 'package:fruit_app/features/models/salad.dart';

final class SaladRepository {
  Future<List<Salad>> fetchSaladsFromApi() async {
    final response = await rootBundle.loadString(StringConstants.baseUrl);
    final decodeData = json.decode(response);

    if (decodeData is Map<String, dynamic> && decodeData['products'] is List<dynamic>) {
      final productsList = decodeData['products'] as List<dynamic>;
      return productsList.map((product) => Salad.fromJson(product as Map<String, dynamic>)).toList();
    } else {
      throw Exception('repository salad fetch excetion : $response');
    }
  }
}
