import 'package:alcoolandiajl/core/repositories/upload_repository.dart';
import 'package:alcoolandiajl/core/services/plant_service.dart';
import 'package:alcoolandiajl/features/home/home_guard.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/home/home_module.dart';
import 'features/profile/profile_module.dart';
import 'features/theme/theme_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(() => PlantService());
    i.addSingleton(() => UploadRepository());
  }

  @override
  void routes(r) {
    r.module('/', module: HomeModule(), guards: [HomeGuard()]);
    r.module('/theme', module: ThemeModule());
    r.module('/profile', module: ProfileModule());
  }
}
