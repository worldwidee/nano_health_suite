// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
part 'favorites_view_model.g.dart';

class FavoritesViewModel = _FavoritesViewModelBase with _$FavoritesViewModel;

abstract class _FavoritesViewModelBase with Store {}
