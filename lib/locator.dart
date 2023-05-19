import 'package:fruit_app/features/repository/salad_repository.dart';
import 'package:fruit_app/features/services/salad_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void getItSetup() {
  locator.registerLazySingleton(() => SaladService());
  locator.registerLazySingleton(() => SaladRepository());

}
