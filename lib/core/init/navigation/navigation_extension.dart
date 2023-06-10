import 'navigation_enum.dart';

extension NavigationConstantsValue on NavigationEnums {
  String get name {
    switch (this) {
      case NavigationEnums.home:
        return 'home';
      case NavigationEnums.login:
        return 'login';
      case NavigationEnums.cart:
        return 'cart';
      case NavigationEnums.favorites:
        return 'favorites';
      case NavigationEnums.productDetail:
        return 'productDetail';
      case NavigationEnums.profile:
        return 'profile';
    }
  }

  String get route {
    switch (this) {
      case NavigationEnums.home:
        return '/home';
      case NavigationEnums.login:
        return '/login';
      case NavigationEnums.cart:
        return '/cart';
      case NavigationEnums.favorites:
        return '/favorites';
      case NavigationEnums.productDetail:
        return '/product-detail';
      case NavigationEnums.profile:
        return '/profile';
    }
  }

  NavigationEnums normalValue(String? val) {
    switch (val) {
      case '/home':
        return NavigationEnums.home;
      case '/login':
        return NavigationEnums.login;
      case '/cart':
        return NavigationEnums.cart;
      case '/favorites':
        return NavigationEnums.favorites;
      case '/product-detail':
        return NavigationEnums.productDetail;
      case '/profile':
        return NavigationEnums.profile;

      default:
        throw Exception('$val not found in $this');
    }
  }
}
