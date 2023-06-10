// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:nano_health_suite/core/init/navigation/navigation_enum.dart';
import 'package:nano_health_suite/core/init/navigation/navigation_extension.dart';
import 'package:nano_health_suite/product/init/extensions/response_model.dart';
import 'package:nano_health_suite/product/service/general/general_service.dart';

import '../../../../core/states/app_settings/app_settings.dart';
import '../../../init/enum/service_status.dart';
import '../../../model/product/product_response.dart';
import '../../../widgets/bottom_sheet/error_bottom_sheet.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final GeneralService _generalService = AppSettings.instance.generalService;

  List<ProductResponse>? products;

  @observable
  ServiceStatus serviceStatus = ServiceStatus.waiting;

  Future<void> goToDetailPage(
      {required BuildContext context, required int? id}) async {
    if (id == null) {
      ErrorBottomSheet.unknownErr(context: context);
      return;
    }
    context.goNamed(NavigationEnums.productDetail.name, extra: id);
  }

  @action
  Future<void> fetchProducts({required BuildContext context}) async {
    serviceStatus = ServiceStatus.onProcess;
    var response = await _generalService.getProducts();
    switch (response.responseType) {
      case ResponseType.hasData:
        serviceStatus = ServiceStatus.success;
        products = response.data!.products;
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
        ErrorBottomSheet.listenConnection(
            context: context,
            onConnected: () {
              fetchProducts(context: context);
            });
        break;
      case ResponseType.unknown:
        serviceStatus = ServiceStatus.failed;
        ErrorBottomSheet.unknownErr(context: context);
        break;
    }
  }
}
