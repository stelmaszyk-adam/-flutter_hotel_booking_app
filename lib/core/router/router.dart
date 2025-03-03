import 'package:auto_route/auto_route.dart';
import 'package:hotel_booking_app/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      children: [
        AutoRoute(path: OverviewTab.name, page: OverviewTab.page, initial: true),
        AutoRoute(path: SearchTab.name, page: SearchTab.page),
        AutoRoute(path: FavoriteTab.name, page: FavoriteTab.page),
        AutoRoute(path: AccountTab.name, page: AccountTab.page),
      ],
    ),
  ];
}
