import 'package:alcoolandiajl/const.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeGuard extends RouteGuard {
  HomeGuard() : super(redirectTo: '/theme/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return localUser.containsKey('darkmode');
  }
}
