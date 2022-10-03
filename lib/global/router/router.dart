import 'package:auto_route/auto_route.dart';
import 'package:twenty_four_online_interview_test/features/authentication/view/authentication_view.dart';
import 'package:twenty_four_online_interview_test/features/add_or_edit_wish/view/add_or_edit_wish_view.dart';
import 'package:twenty_four_online_interview_test/features/home/view/home_view.dart';
import 'package:twenty_four_online_interview_test/features/sign_in/view/sign_in_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AutoRoute(
      name: 'AuthenticationRouter',
      page: AuthenticationView,
      initial: true,
      children: [
        AutoRoute(
          page: SignInView,
        ),
        AutoRoute(
          name: 'HomeRouter',
          page: HomeView,
        ),
      ],
    ),
    AutoRoute(
      page: AddOrEditWishView,
    ),
  ],
)
class $AppRouter {}
