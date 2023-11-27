import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_widget.dart';
import 'firebase_options.dart';

Screen calcScreenWidth(BuildContext context) {
  if (MediaQuery.of(context).size.width > 650) {
    return Screen.web;
  }
  return Screen.mobile;
}

enum Screen { mobile, tab, web }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
