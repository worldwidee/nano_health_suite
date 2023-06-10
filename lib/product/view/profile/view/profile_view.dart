import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health_suite/core/states/app_settings/app_settings.dart';
import 'package:nano_health_suite/product/view/profile/model/profile_view_model.dart';
import 'package:nano_health_suite/product/widgets/context_updater.dart';
import 'package:nano_health_suite/product/widgets/sized_button/sized_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var model = ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSettings>(builder: (controller) {
      var appearance = controller.appearance;
      var figma = Figma.of(context);
      return ContextUpdater(
        child: Padding(
          padding: figma.paddingSymmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Profile",
                style: figma.style(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: appearance.homeText,
                    fontFamily: 'Open Sans'),
              ),
              const FigmaBox(
                height: 20,
              ),
              SizedButton(
                width: double.infinity,
                height: 60,
                onPressed: () {
                  model.logout();
                },
                color: appearance.primary,
                radius: 14,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Logout",
                      style: figma.style(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: appearance.buttonText,
                          fontFamily: 'Open Sans'),
                    ),
                    const FigmaBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.logout,
                      color: appearance.buttonText,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
