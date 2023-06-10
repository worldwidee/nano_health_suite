import 'package:flutter/material.dart';

import '../../core/states/app_settings/app_settings.dart';

class ContextUpdater extends StatelessWidget {
  final Widget child;
  const ContextUpdater({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    AppSettings.instance.updateContext(context);
    return child;
  }
}
