import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/config/router/app_router.dart';
import 'src/core/enums/period_enums.dart';
import 'src/core/theme/app_theme.dart';
import 'src/injector.dart' as di;
import 'src/presentation/bloc/add_bookmark_article/add_bookmark_article_bloc.dart';
import 'src/presentation/bloc/delete_bookmark_article/delete_bookmark_article_bloc.dart';
import 'src/presentation/bloc/get_bookmarked_articles/get_book_marked_articles_bloc.dart';
import 'src/presentation/bloc/get_most_popular_articles/get_most_popular_articles_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //?

  /// Initializing the dependency injection.
  await di.init();

  /// Loading the environment variables.
  await dotenv.load();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              di.injector<GetMostPopularArticlesBloc>()..add(const OnGetMostPopularArticles(PeriodEnums.daily)),
        ),
        BlocProvider(
            create: (context) => di.injector<GetBookMarkedArticlesBloc>()..add(const OnGetBookMarkedArticles())),
        BlocProvider(create: (context) => di.injector<AddBookmarkArticleBloc>()),
        BlocProvider(create: (context) => di.injector<DeleteBookmarkArticleBloc>()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 800),
          useInheritedMediaQuery: true,
          builder: (context, _) {
            return MaterialApp.router(
              theme: AppTheme().theme,

              //* router
              routerDelegate: AutoRouterDelegate(
                di.injector<AppRouter>(),
              ),
              routeInformationParser: di.injector<AppRouter>().defaultRouteParser(),
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }
}
