// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductDetailViewModel on _ProductDetailViewModelBase, Store {
  late final _$isOpenedAtom =
      Atom(name: '_ProductDetailViewModelBase.isOpened', context: context);

  @override
  bool get isOpened {
    _$isOpenedAtom.reportRead();
    return super.isOpened;
  }

  @override
  set isOpened(bool value) {
    _$isOpenedAtom.reportWrite(value, super.isOpened, () {
      super.isOpened = value;
    });
  }

  late final _$serviceStatusAtom =
      Atom(name: '_ProductDetailViewModelBase.serviceStatus', context: context);

  @override
  ServiceStatus get serviceStatus {
    _$serviceStatusAtom.reportRead();
    return super.serviceStatus;
  }

  @override
  set serviceStatus(ServiceStatus value) {
    _$serviceStatusAtom.reportWrite(value, super.serviceStatus, () {
      super.serviceStatus = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_ProductDetailViewModelBase.init', context: context);

  @override
  Future<void> init({required int productId, required BuildContext context}) {
    return _$initAsyncAction
        .run(() => super.init(productId: productId, context: context));
  }

  late final _$fetchProductAsyncAction =
      AsyncAction('_ProductDetailViewModelBase.fetchProduct', context: context);

  @override
  Future<void> fetchProduct({required BuildContext context}) {
    return _$fetchProductAsyncAction
        .run(() => super.fetchProduct(context: context));
  }

  late final _$_ProductDetailViewModelBaseActionController =
      ActionController(name: '_ProductDetailViewModelBase', context: context);

  @override
  void changeSheetStatus() {
    final _$actionInfo = _$_ProductDetailViewModelBaseActionController
        .startAction(name: '_ProductDetailViewModelBase.changeSheetStatus');
    try {
      return super.changeSheetStatus();
    } finally {
      _$_ProductDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isOpened: ${isOpened},
serviceStatus: ${serviceStatus}
    ''';
  }
}
