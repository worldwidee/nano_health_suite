import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nano_health_suite/core/init/navigation/route_service.dart';
import 'package:nano_health_suite/core/states/app_settings/app_settings.dart';
import 'package:nano_health_suite/core/states/app_user/app_user.dart';

Future<void> main() async {
  Figma.setup(deviceWidth: 375, deviceHeight: 812);
  AppSettings.init();
  await AppSettings.instance.setup();
  AppUser.init;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouteService.instance().router,
    );
  }
}
