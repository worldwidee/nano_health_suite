import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nano_health_suite/core/states/app_settings/app_settings.dart';

import '../../../../core/constants/image_paths.dart';

class LoginBanner extends StatelessWidget {
  const LoginBanner({super.key});

  @override
  Widget build(BuildContext context) {
    var appearance = AppSettings.instance.appearance;
    var figma = Figma.of(context);
    return FigmaContainer(
      width: double.infinity,
      height: 411,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: appearance.gradientColors)),
      child: Stack(children: [
        Center(
          child: Image.asset(
            ImagePaths.loginLogo,
            width: figma.px(240.45, Axis.horizontal),
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          left: figma.px(36, Axis.horizontal),
          bottom: figma.px(30, Axis.vertical),
          child: Text(
            "Log In",
            style: figma.style(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: appearance.buttonText,
                fontFamily: 'SF Pro Display'),
          ),
        )
      ]),
    );
  }
}
