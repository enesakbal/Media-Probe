// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeParentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeParentRouter(),
      );
    },
    BookmarksParentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookmarksParentRouter(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    ArticleDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArticleDetailView(
          key: args.key,
          article: args.article,
        ),
      );
    },
    BookmarksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookmarksView(),
      );
    },
    MasterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MasterView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
  };
}

/// generated route for
/// [HomeParentRouter]
class HomeParentRoute extends PageRouteInfo<void> {
  const HomeParentRoute({List<PageRouteInfo>? children})
      : super(
          HomeParentRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeParentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookmarksParentRouter]
class BookmarksParentRoute extends PageRouteInfo<void> {
  const BookmarksParentRoute({List<PageRouteInfo>? children})
      : super(
          BookmarksParentRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarksParentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ArticleDetailView]
class ArticleDetailRoute extends PageRouteInfo<ArticleDetailRouteArgs> {
  ArticleDetailRoute({
    Key? key,
    required Article? article,
    List<PageRouteInfo>? children,
  }) : super(
          ArticleDetailRoute.name,
          args: ArticleDetailRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleDetailRoute';

  static const PageInfo<ArticleDetailRouteArgs> page =
      PageInfo<ArticleDetailRouteArgs>(name);
}

class ArticleDetailRouteArgs {
  const ArticleDetailRouteArgs({
    this.key,
    required this.article,
  });

  final Key? key;

  final Article? article;

  @override
  String toString() {
    return 'ArticleDetailRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [BookmarksView]
class BookmarksRoute extends PageRouteInfo<void> {
  const BookmarksRoute({List<PageRouteInfo>? children})
      : super(
          BookmarksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MasterView]
class MasterRoute extends PageRouteInfo<void> {
  const MasterRoute({List<PageRouteInfo>? children})
      : super(
          MasterRoute.name,
          initialChildren: children,
        );

  static const String name = 'MasterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
