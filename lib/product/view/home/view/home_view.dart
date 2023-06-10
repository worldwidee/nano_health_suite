import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nano_health_suite/product/init/enum/service_status.dart';
import 'package:nano_health_suite/product/view/home/model/home_view_model.dart';

import '../../../../core/states/app_settings/app_settings.dart';
import '../../../widgets/context_updater.dart';
import 'product_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var model = HomeViewModel();

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => model.fetchProducts(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContextUpdater(
      child: GetBuilder<AppSettings>(
        builder: (controller) {
          final appearance = controller.appearance;
          var figma = Figma.of(context);
          return Column(
            children: [
              FigmaContainer(
                height: 107,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: appearance.secondaryBgColor,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(35))),
                alignment: Alignment.center,
                child: Stack(children: [
                  Center(
                    child: Text(
                      "All Products",
                      style: figma.style(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: appearance.credentialText,
                          fontFamily: 'Open Sans'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Switch(
                        value: controller.appearance.name == "dark",
                        onChanged: (value) {
                          controller.changeTheme();
                        }),
                  )
                ]),
              ),
              Expanded(
                child: Observer(builder: (context) {
                  switch (model.serviceStatus) {
                    case ServiceStatus.waiting:
                      return const SizedBox();
                    case ServiceStatus.failed:
                      return const Center(
                        child: Icon(
                          Icons.warning,
                          color: Colors.orangeAccent,
                          size: 50,
                        ),
                      );
                    case ServiceStatus.onProcess:
                      return const Center(child: CircularProgressIndicator());
                    case ServiceStatus.success:
                      return model.products != null
                          ? Padding(
                              padding: figma.paddingSymmetric(horizontal: 26),
                              child: ListView.builder(
                                itemBuilder: (context, index) => ProductView(
                                    model: model,
                                    product: model.products![index]),
                                itemCount: model.products!.length,
                              ),
                            )
                          : const SizedBox();
                  }
                }),
              )
            ],
          );
        },
      ),
    );
  }
}
