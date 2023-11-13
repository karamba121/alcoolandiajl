import 'package:flutter_modular/flutter_modular.dart';

import 'theme_page.dart';

class ThemeModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const ThemePage());
  }
}
