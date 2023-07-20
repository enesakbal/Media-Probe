import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/constants/path_constants.dart';
import '../../domain/entities/article/article.dart';
import '../../presentation/view/article_detail_view.dart';
import '../../presentation/view/bookmarks_view.dart';
import '../../presentation/view/home_view.dart';
import '../../presentation/view/master_view.dart';
import '../../presentation/view/splash_view.dart';

part 'app_router.gr.dart';
part 'parent_routes.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Widget,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    RedirectRoute(path: '/', redirectTo: '/splash'),
    AutoRoute(page: SplashRoute.page, path: PathConstants.splash),
    AutoRoute(
      page: MasterRoute.page,
      path: PathConstants.master,
      children: [
        AutoRoute(
          page: HomeParentRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: PathConstants.home,
            ),
            CustomRoute(
              transitionsBuilder: fadeTransition,
              durationInMilliseconds: 800,
              page: ArticleDetailRoute.page,
              path: PathConstants.articleDetail,
            ),
          ],
        ),
        AutoRoute(
          page: BookmarksParentRoute.page,
          children: [
            AutoRoute(
              page: BookmarksRoute.page,
              path: PathConstants.bookmark,
            ),
            CustomRoute(
              transitionsBuilder: fadeTransition,
              durationInMilliseconds: 800,
              page: ArticleDetailRoute.page,
              path: PathConstants.articleDetail,
            ),
          ],
        ),
      ],
    ),
  ];
}

Widget fadeTransition(
    BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  final opacity = Tween<double>(
    end: 1,
    begin: 0.2,
  ).chain(CurveTween(curve: Curves.fastOutSlowIn)).animate(animation);

  return FadeTransition(opacity: opacity, child: child);
}
