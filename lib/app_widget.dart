import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/theme/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Alcoolandia',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.apptheme.copyWith(),
      routerConfig: Modular.routerConfig,
    );
  }
}
