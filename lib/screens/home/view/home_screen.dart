import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/core/l10n/l10n.dart';
import 'package:hotel_booking_app/core/service_locator/service_locator.dart';
import 'package:hotel_booking_app/screens/home/cubit/home_cubit.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      builder: (autoTabsRouterContext, child) {
        return BlocProvider<HomeCubit>(
          create: (_) => getIt<HomeCubit>()..init(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(switch (autoTabsRouterContext.tabsRouter.activeIndex) {
                0 => context.l10n.hotels,
                2 => context.l10n.favor,
                _ => '',
              }),
              centerTitle: true,
            ),
            body: child,
            bottomNavigationBar: _BuildBottomNav(),
          ),
        );
      },
    );
  }
}

class _BuildBottomNav extends StatelessWidget {
  const _BuildBottomNav();

  @override
  Widget build(BuildContext context) {
    final currentTab = context.tabsRouter;
    return BottomNavigationBar(
      currentIndex: currentTab.activeIndex,
      onTap: currentTab.setActiveIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: context.l10n.overview),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: context.l10n.search),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: context.l10n.favor),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: context.l10n.account),
      ],
    );
  }
}
