import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nano_health_suite/core/init/navigation/navigation_enum.dart';
import 'package:nano_health_suite/core/init/navigation/navigation_extension.dart';

import '../../../product/view/app_design/page_control_panel.dart';
import '../../../product/view/cart/view/cart_view.dart';
import '../../../product/view/favorites/view/favorites_view.dart';
import '../../../product/view/home/view/home_view.dart';
import '../../../product/view/login/view/login_view.dart';
import '../../../product/view/product_detail/view/product_detail_view.dart';
import '../../../product/view/profile/view/profile_view.dart';

class RouteService {
  final GlobalKey<NavigatorState> _rootNavigatorKey;
  final GlobalKey<NavigatorState> _sectionNavigatorKey;

  RouteService.instance()
      : _rootNavigatorKey = GlobalKey<NavigatorState>(),
        _sectionNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get router => GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: NavigationEnums.login.route,
        routes: <RouteBase>[
          GoRoute(
            path: NavigationEnums.login.route,
            name: NavigationEnums.login.name,
            builder: (context, state) => const LoginView(),
          ),
          GoRoute(
            path: NavigationEnums.productDetail.route,
            name: NavigationEnums.productDetail.name,
            builder: (context, state) {
              int productId = state.extra as int;
              return ProductDetailView(
                productId: productId,
              );
            },
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return PageControlPanel(navigationShell);
            },
            branches: [
              StatefulShellBranch(
                navigatorKey: _sectionNavigatorKey,
                routes: <RouteBase>[
                  GoRoute(
                    path: NavigationEnums.home.route,
                    name: NavigationEnums.home.name,
                    builder: (context, state) => const HomeView(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: NavigationEnums.cart.route,
                    name: NavigationEnums.cart.name,
                    builder: (context, state) => const CartView(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: NavigationEnums.favorites.route,
                    name: NavigationEnums.favorites.name,
                    builder: (context, state) => const FavoritesView(),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: NavigationEnums.profile.route,
                    name: NavigationEnums.profile.name,
                    builder: (context, state) => const ProfileView(),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
}
