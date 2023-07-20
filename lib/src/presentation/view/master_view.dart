import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../config/gen/assets.gen.dart';
import '../../config/router/app_router.dart';
import '../../core/components/bottom_navigation/bottom_navigation.dart';

@RoutePage()
class MasterView extends StatelessWidget {
  const MasterView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      resizeToAvoidBottomInset: true,
      
      routes: const [
        HomeRoute(),
        BookmarksRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigation(
          selectedIndex: tabsRouter.activeIndex,
          onTabSelected: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationItem(icon: Assets.icons.home.path),
            BottomNavigationItem(icon: Assets.icons.bookmark.path),
          ],
        );
      },
    );
  }
}
