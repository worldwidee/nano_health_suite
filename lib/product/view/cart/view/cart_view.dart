import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/states/app_settings/app_settings.dart';
import '../../../widgets/context_updater.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
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
                "My Cart",
                style: figma.style(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: appearance.homeText,
                    fontFamily: 'Open Sans'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
