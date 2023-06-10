// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'cart_view_model.g.dart';

class CartViewModel = _CartViewModelBase with _$CartViewModel;

abstract class _CartViewModelBase with Store {}
