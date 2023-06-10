// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:nano_health_suite/core/constants/icon_paths.dart';
import 'package:nano_health_suite/product/view/product_detail/model/product_detail_view_model.dart';
import 'package:nano_health_suite/product/widgets/sized_button/sized_button.dart';

import '../../../../core/states/app_settings/app_settings.dart';
import '../../../init/enum/service_status.dart';
import '../../../widgets/context_updater.dart';
import 'product_detail_content.dart';
import 'product_image_view.dart';

class ProductDetailView extends StatefulWidget {
  final int productId;
  const ProductDetailView({super.key, required this.productId});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  var model = ProductDetailViewModel();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => model.init(productId: widget.productId, context: context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContextUpdater(
      child: GetBuilder<AppSettings>(
        builder: (controller) {
          final appearance = controller.appearance;
          var figma = Figma.of(context);
          return WillPopScope(
            onWillPop: () async {
              context.goNamed("home");
              return false;
            },
            child: Scaffold(
              backgroundColor: appearance.background,
              body: Observer(
                builder: (context) => switch (model.serviceStatus) {
                  ServiceStatus.failed => const Center(
                      child: Icon(
                        Icons.warning,
                        color: Colors.orangeAccent,
                        size: 50,
                      ),
                    ),
                  ServiceStatus.onProcess =>
                    const Center(child: CircularProgressIndicator()),
                  ServiceStatus.waiting => const SizedBox(),
                  ServiceStatus.success => LiquidPullToRefresh(
                      showChildOpacityTransition: false,
                      color: Colors.transparent,
                      onRefresh: () async {
                        model.fetchProduct(context: context);
                      },
                      child: ListView(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: ProductImageView(model: model),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Observer(builder: (context) {
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 100),
                                    height: figma.px(model.isOpened ? 355 : 245,
                                        Axis.vertical),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: appearance.secondaryBgColor,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(figma.px(
                                                30, Axis.horizontal)))),
                                    child: Column(children: [
                                      TextButton(
                                          style: TextButton.styleFrom(
                                            minimumSize: Size.zero,
                                            padding: figma.paddingAll(10),
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                          ),
                                          onPressed: () {
                                            model.changeSheetStatus();
                                          },
                                          child: Icon(
                                            model.isOpened
                                                ? Icons.keyboard_arrow_down
                                                : Icons.keyboard_arrow_up,
                                            color: appearance.primary,
                                            size: 20,
                                          )),
                                      FigmaBox(
                                        height: 54.76,
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            const FigmaBox(
                                              width: 14,
                                            ),
                                            SizedButton(
                                              onPressed: () {},
                                              width:
                                                  figma.px(56, Axis.horizontal),
                                              height: figma.px(
                                                  54.76, Axis.vertical),
                                              color:
                                                  appearance.secondaryBgColor,
                                              radius: 20,
                                              boxShadow: const [
                                                BoxShadow(
                                                    blurRadius: 15,
                                                    color: Color(0xFF406B7F99),
                                                    offset: Offset(0, 0))
                                              ],
                                              child: Image.asset(
                                                IconPaths.share,
                                                color: appearance.primary,
                                                width: figma.px(
                                                    15.67, Axis.horizontal),
                                              ),
                                            ),
                                            const FigmaBox(
                                              width: 39.17,
                                            ),
                                            Expanded(
                                              child: SizedButton(
                                                onPressed: () {},
                                                width: double.infinity,
                                                height: figma.px(
                                                    54.76, Axis.vertical),
                                                color: appearance.primary,
                                                radius: 43,
                                                child: Text(
                                                  "Order Now",
                                                  style: figma.style(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          appearance.buttonText,
                                                      fontFamily: 'Open Sans'),
                                                ),
                                              ),
                                            ),
                                            const FigmaBox(
                                              width: 14.97,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: ProductDetailContent(
                                          product: model.product!,
                                          isOpened: model.isOpened,
                                        ),
                                      )
                                    ]),
                                  );
                                }),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
