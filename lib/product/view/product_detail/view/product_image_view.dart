import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:nano_health_suite/core/states/app_settings/app_settings.dart';
import 'package:nano_health_suite/product/view/product_detail/model/product_detail_view_model.dart';

import '../../../../core/constants/icon_paths.dart';
import '../../../functions/my_functions.dart';
import '../../../widgets/sized_button/sized_button.dart';

class ProductImageView extends StatelessWidget {
  final ProductDetailViewModel model;
  const ProductImageView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final appearance = AppSettings.instance.appearance;
    var figma = Figma.of(context);
    return Stack(children: [
      Observer(builder: (context) {
        return Image.network(
          model.product!.image ?? "",
          height: figma.px(model.isOpened ? 568 : 678, Axis.vertical),
          fit: BoxFit.cover,
        );
      }),
      Positioned(
        top: figma.px(40, Axis.vertical),
        left: figma.px(9, Axis.horizontal),
        child: SizedButton(
          onPressed: () {
            context.goNamed("home");
          },
          radius: 12,
          color: appearance.secondaryBgColor,
          width: figma.px(40, Axis.horizontal),
          height: figma.px(40, Axis.horizontal),
          child: Image.asset(
            IconPaths.back,
            color: appearance.detailBackBtn,
            width: figma.px(16, Axis.horizontal),
          ),
        ),
      ),
      Positioned(
        top: figma.px(40, Axis.vertical),
        right: figma.px(9, Axis.horizontal),
        child: SizedButton(
          onPressed: () {},
          radius: 12,
          color: appearance.secondaryBgColor,
          width: figma.px(40, Axis.horizontal),
          height: figma.px(40, Axis.horizontal),
          child: Image.asset(
            IconPaths.popup,
            color: appearance.detailBackBtn,
            height: figma.px(21.9, Axis.vertical),
          ),
        ),
      ),
      Positioned(
        top: figma.px(110, Axis.vertical),
        left: figma.px(9, Axis.horizontal),
        child: Text(
          "Detail",
          style: figma.style(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: appearance.buttonText,
              fontFamily: 'Open Sans'),
        ),
      ),
      Positioned(
        bottom: figma.px(115, Axis.vertical),
        left: figma.px(25, Axis.horizontal),
        child: FigmaText(
          "${amountConverter(model.product!.price)} AED",
          height: 38,
          style: figma.style(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: appearance.detailPriceText,
              fontFamily: 'Open Sans'),
        ),
      )
    ]);
  }
}
