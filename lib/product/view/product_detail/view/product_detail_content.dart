import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nano_health_suite/core/states/app_settings/app_settings.dart';
import 'package:rate/rate.dart';

import '../../../model/product/product_response.dart';

class ProductDetailContent extends StatelessWidget {
  final ProductResponse product;
  final bool isOpened;
  const ProductDetailContent(
      {super.key, required this.product, required this.isOpened});

  @override
  Widget build(BuildContext context) {
    final appearance = AppSettings.instance.appearance;
    var figma = Figma.of(context);
    return Padding(
      padding: figma.paddingSymmetric(horizontal: 20),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const FigmaBox(
            height: 14.48,
          ),
          FigmaText(
            "Description",
            height: 16,
            style: figma.style(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: appearance.detailHintText,
                fontFamily: 'Open Sans'),
          ),
          const FigmaBox(
            height: 8,
          ),
          FigmaBox(
            width: double.infinity,
            height: 110,
            child: Text(
              product.description ?? "",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: figma.style(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: appearance.detailText,
                  fontFamily: 'Open Sans'),
            ),
          ),
          if (isOpened)
            const FigmaBox(
              height: 4.76,
            ),
          if (isOpened)
            FigmaContainer(
              height: 98,
              width: double.infinity,
              color: appearance.detailRatingArea,
              child: Stack(
                children: [
                  Positioned(
                    left: figma.px(4, Axis.horizontal),
                    top: figma.px(10, Axis.vertical),
                    child: Text(
                      "Reviews(${product.rating?.count ?? 0})",
                      style: figma.style(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: appearance.detailRatingTitle,
                          fontFamily: 'Open Sans'),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: figma.paddingOnly(top: 15),
                      child: Row(children: [
                        const FigmaBox(width: 21),
                        Text(
                          "${product.rating?.rate ?? 0}",
                          style: figma.style(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: appearance.detailRating,
                              fontFamily: 'Open Sans'),
                        ),
                        const FigmaBox(width: 30),
                        Rate(
                          iconSize: figma.px(25.53, Axis.horizontal),
                          color: appearance.detailRatingStar,
                          allowHalf: true,
                          allowClear: true,
                          initialValue: product.rating?.rate ?? 0,
                          readOnly: true,
                        )
                      ]),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
