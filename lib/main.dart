import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_frame/injection_container.dart' as ic;
import 'package:project_frame/view/main/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  ic.initGetIt();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('my', 'MM'),
      ],
      child: const MyApp(),
    ),
  );
}

