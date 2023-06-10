import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:nano_health_suite/core/states/app_settings/app_settings.dart';
import 'package:nano_health_suite/product/functions/my_functions.dart';
import 'package:nano_health_suite/product/view/home/model/home_view_model.dart';
import 'package:nano_health_suite/product/widgets/sized_button/sized_button.dart';
import 'package:rate/rate.dart';

import '../../../model/product/product_response.dart';

class ProductView extends StatelessWidget {
  final ProductResponse product;
  final HomeViewModel model;
  const ProductView({super.key, required this.product, required this.model});

  @override
  Widget build(BuildContext context) {
    final appearance = AppSettings.instance.appearance;
    var figma = Figma.of(context);
    return Padding(
      padding: figma.paddingOnly(bottom: 20),
      child: SizedButton(
        onPressed: () {
          model.goToDetailPage(context: context, id: product.id);
        },
        height: figma.px(309, Axis.vertical),
        width: double.infinity,
        child: Column(children: [
          FigmaBox(
            width: double.infinity,
            height: figma.px(216, Axis.vertical),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.image ?? "",
                    width: double.infinity,
                    height: figma.px(216, Axis.vertical),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: figma.px(16.35, Axis.vertical),
                  right: figma.px(20.92, Axis.horizontal),
                  child: Rate(
                    iconSize: figma.px(18.59, Axis.horizontal),
                    color: appearance.detailRatingStar,
                    allowHalf: true,
                    allowClear: true,
                    initialValue: product.rating?.rate ?? 0,
                    readOnly: true,
                  ),
                ),
                Positioned(
                  bottom: figma.px(10.81, Axis.vertical),
                  left: figma.px(10.81, Axis.horizontal),
                  child: FigmaText(
                    "${amountConverter(product.price)} AED",
                    height: 32,
                    style: figma.style(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: appearance.buttonText,
                        fontFamily: 'Open Sans'),
                  ),
                )
              ],
            ),
          ),
          const FigmaBox(
            height: 17.92,
          ),
          FigmaText(
            product.title ?? "",
            height: 22,
            overflow: TextOverflow.ellipsis,
            style: figma.style(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: appearance.homeHintText,
                fontFamily: 'Open Sans'),
          ),
          const FigmaBox(
            height: 3,
          ),
          Expanded(
            child: Text(
              product.description ?? "",
              overflow: TextOverflow.ellipsis,
              style: figma.style(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: appearance.homeText,
                  fontFamily: 'Open Sans'),
            ),
          ),
        ]),
      ),
    );
  }
}
