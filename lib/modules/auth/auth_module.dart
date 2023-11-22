import 'package:flutter_modular/flutter_modular.dart';

import 'auth_page.dart';

class AuthModule extends Module{
  @override
  void routes(r) {
    r.child('/', child: (context) => const AuthPage());
  }
}