import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nano_health_suite/core/constants/icon_paths.dart';
import 'package:nano_health_suite/core/states/app_settings/app_settings.dart';

class PageControlPanel extends StatelessWidget {
  PageControlPanel(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  final List<String> paths = [
    IconPaths.home,
    IconPaths.cart,
    IconPaths.like,
    IconPaths.profile
  ];

  @override
  Widget build(BuildContext context) {
    var appearance = AppSettings.instance.appearance;
    return GetBuilder<AppSettings>(builder: (controller) {
      return Scaffold(
        body: navigationShell,
        backgroundColor: AppSettings.instance.appearance.background,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
          child: BottomNavigationBar(
            backgroundColor: appearance.secondaryBgColor,
            currentIndex: navigationShell.currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              for (int i = 0; i < paths.length; i++)
                BottomNavigationBarItem(
                  backgroundColor: appearance.secondaryBgColor,
                  icon: Image.asset(paths[i],
                      width: Figma.of(context).px(17.66, Axis.horizontal),
                      color: i == navigationShell.currentIndex
                          ? appearance.primary
                          : appearance.homeHintText),
                  label: '',
                ),
            ],
            onTap: _onTap,
          ),
        ),
      );
    });
  }

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
