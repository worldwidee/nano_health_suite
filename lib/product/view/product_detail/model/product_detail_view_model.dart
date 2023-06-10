// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nano_health_suite/product/init/extensions/response_model.dart';

import '../../../../core/states/app_settings/app_settings.dart';
import '../../../init/enum/service_status.dart';
import '../../../model/product/product_response.dart';
import '../../../service/general/general_service.dart';
import '../../../widgets/bottom_sheet/error_bottom_sheet.dart';
part 'product_detail_view_model.g.dart';

class ProductDetailViewModel = _ProductDetailViewModelBase
    with _$ProductDetailViewModel;

abstract class _ProductDetailViewModelBase with Store {
  final GeneralService _generalService = AppSettings.instance.generalService;

  ProductResponse? product;

  @observable
  bool isOpened = false;

  @observable
  ServiceStatus serviceStatus = ServiceStatus.waiting;

  late int productId;

  @action
  void changeSheetStatus() {
    isOpened = !isOpened;
  }

  @action
  Future<void> init(
      {required int productId, required BuildContext context}) async {
    this.productId = productId;
    await fetchProduct(context: context);
  }

  @action
  Future<void> fetchProduct({required BuildContext context}) async {
    serviceStatus = ServiceStatus.onProcess;
    var response = await _generalService.getProduct(productId.toString());
    switch (response.responseType) {
      case ResponseType.hasData:
        serviceStatus = ServiceStatus.success;
        product = response.data!;
        break;
      case ResponseType.errorModelWithData:
        serviceStatus = ServiceStatus.failed;
        ErrorBottomSheet.customView(
            title: "Something Went Wrong",
            message: "Something went wrong during login process",
            context: context);
        break;
      case ResponseType.errorModelWithoutData:
        serviceStatus = ServiceStatus.failed;
        ErrorBottomSheet.customView(
            title: "Something Went Wrong",
            message: "Something went wrong during login process",
            context: context);
        break;
      case ResponseType.noConnection:
        serviceStatus = ServiceStatus.failed;
        ErrorBottomSheet.listenConnection(context: context, onConnected: () {});
        break;
      case ResponseType.unknown:
        serviceStatus = ServiceStatus.failed;
        ErrorBottomSheet.unknownErr(context: context);
        break;
    }
  }
}
