import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nano_health_suite/core/init/navigation/navigation_enum.dart';
import 'package:nano_health_suite/core/init/navigation/navigation_extension.dart';
import 'package:nano_health_suite/core/states/app_user/app_user.dart';

import '../../../product/view/app_design/page_control_panel.dart';
import '../../../product/view/cart/view/cart_view.dart';
import '../../../product/view/favorites/view/favorites_view.dart';
import '../../../product/view/home/view/home_view.dart';
import '../../../product/view/login/view/login_view.dart';
import '../../../product/view/product_detail/view/product_detail_view.dart';
import '../../../product/view/profile/view/profile_view.dart';
import 'custom_transition_route.dart';

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
            redirect: (BuildContext context, GoRouterState state) =>
                AppUser.instance.isUserLogged ? "/home" : null,
            pageBuilder: (context, state) {
              return buildPageWithDefaultTransition(
                  context: context, state: state, child: const LoginView());
            },
          ),
          GoRoute(
            path: NavigationEnums.productDetail.route,
            name: NavigationEnums.productDetail.name,
            redirect: (BuildContext context, GoRouterState state) =>
                AppUser.instance.isUserLogged ? null : '/login',
            pageBuilder: (context, state) {
              int productId = state.extra as int;
              return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: ProductDetailView(
                    productId: productId,
                  ));
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
                    redirect: (BuildContext context, GoRouterState state) =>
                        AppUser.instance.isUserLogged ? null : '/login',
                    pageBuilder: (context, state) {
                      return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: const HomeView());
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: NavigationEnums.cart.route,
                    name: NavigationEnums.cart.name,
                    redirect: (BuildContext context, GoRouterState state) =>
                        AppUser.instance.isUserLogged ? null : '/login',
                    pageBuilder: (context, state) {
                      return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: const CartView());
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: NavigationEnums.favorites.route,
                    name: NavigationEnums.favorites.name,
                    redirect: (BuildContext context, GoRouterState state) =>
                        AppUser.instance.isUserLogged ? null : '/login',
                    pageBuilder: (context, state) {
                      return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: const FavoritesView());
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                    path: NavigationEnums.profile.route,
                    name: NavigationEnums.profile.name,
                    redirect: (BuildContext context, GoRouterState state) =>
                        AppUser.instance.isUserLogged ? null : '/login',
                    pageBuilder: (context, state) {
                      return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: const ProfileView());
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      );
}
