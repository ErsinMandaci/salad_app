import 'package:fruit_app/features/services/salad_service.dart';
import 'package:fruit_app/locator.dart';

import '../models/salad.dart';

class SaladRepository {
  final SaladService _saladService = locator<SaladService>();

  Future<List<Salad>> getSalads() async {
    final salads = await _saladService.fetchSalads();
    return salads;
  }


    // Future<List<Salad>> filteredSalads(String id) async {

    //   final getSalads = 
    // }

}
