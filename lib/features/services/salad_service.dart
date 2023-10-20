import 'package:fruit_app/features/models/salad.dart';
import 'package:fruit_app/features/repository/salad_repository.dart';
import 'package:fruit_app/locator.dart';

final class SaladService {
    
  final _saladRepository = GetItSetup.locator<SaladRepository>();

  Future<List<Salad>> fetchSalads() async {
    final salads = await _saladRepository.fetchSaladsFromApi();

    return salads;
  }
}
