import 'package:alcoolandiajl/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
