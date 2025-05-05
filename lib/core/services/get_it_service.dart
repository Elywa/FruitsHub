import 'package:fruits_hub/core/services/fire_base_service.dart';
import 'package:fruits_hub/features/auth/data/repos%20impl/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FireBaseService>(FireBaseService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      fireBaseService:
          getIt<
            FireBaseService
          >(), // Registering FireBaseService as a dependency
    ),
  );
}
