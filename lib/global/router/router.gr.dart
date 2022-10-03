// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../features/authentication/view/authentication_view.dart' as _i1;
import '../../features/home/cubit/home_cubit.dart' as _i7;
import '../../features/home/models/wish_model.dart' as _i8;
import '../../features/add_or_edit_wish/view/add_or_edit_wish_view.dart' as _i2;
import '../../features/home/view/home_view.dart' as _i4;
import '../../features/sign_in/view/sign_in_view.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AuthenticationRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthenticationView(),
      );
    },
    AddOrEditWishRoute.name: (routeData) {
      final args = routeData.argsAs<AddOrEditWishRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.AddOrEditWishView(
          key: args.key,
          homeCubit: args.homeCubit,
          wish: args.wish,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignInView(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeView(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          AuthenticationRouter.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              SignInRoute.name,
              path: 'sign-in-view',
              parent: AuthenticationRouter.name,
            ),
            _i5.RouteConfig(
              HomeRouter.name,
              path: 'home-view',
              parent: AuthenticationRouter.name,
            ),
          ],
        ),
        _i5.RouteConfig(
          AddOrEditWishRoute.name,
          path: '/add-or-edit-wish-view',
        ),
      ];
}

/// generated route for
/// [_i1.AuthenticationView]
class AuthenticationRouter extends _i5.PageRouteInfo<void> {
  const AuthenticationRouter({List<_i5.PageRouteInfo>? children})
      : super(
          AuthenticationRouter.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AuthenticationRouter';
}

/// generated route for
/// [_i2.AddOrEditWishView]
class AddOrEditWishRoute extends _i5.PageRouteInfo<AddOrEditWishRouteArgs> {
  AddOrEditWishRoute({
    _i6.Key? key,
    required _i7.HomeCubit homeCubit,
    _i8.WishModel? wish,
  }) : super(
          AddOrEditWishRoute.name,
          path: '/add-or-edit-wish-view',
          args: AddOrEditWishRouteArgs(
            key: key,
            homeCubit: homeCubit,
            wish: wish,
          ),
        );

  static const String name = 'AddOrEditWishRoute';
}

class AddOrEditWishRouteArgs {
  const AddOrEditWishRouteArgs({
    this.key,
    required this.homeCubit,
    this.wish,
  });

  final _i6.Key? key;

  final _i7.HomeCubit homeCubit;

  final _i8.WishModel? wish;

  @override
  String toString() {
    return 'AddOrEditWishRouteArgs{key: $key, homeCubit: $homeCubit, wish: $wish}';
  }
}

/// generated route for
/// [_i3.SignInView]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: 'sign-in-view',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.HomeView]
class HomeRouter extends _i5.PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: 'home-view',
        );

  static const String name = 'HomeRouter';
}
