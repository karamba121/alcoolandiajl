import 'package:alcoolandiajl/core/repositories/products_repository.dart';
import 'package:alcoolandiajl/modules/auth/auth_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(ProductsRepository.new);
  }

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
    r.module('/auth', module: AuthModule());
  }
}
