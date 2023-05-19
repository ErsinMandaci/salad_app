import 'package:fruit_app/features/models/salad.dart';
import '../../locator.dart';
import '../repository/salad_repository.dart';

class SaladService {
  final _saladRepository = locator<SaladRepository>();

  Future<List<Salad>> fetchSalads() async {
    final salads = await _saladRepository.fetchSaladsFromApi();

    return salads;
  }
}
