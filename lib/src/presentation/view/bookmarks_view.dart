import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/card/article_card.dart';
import '../../core/components/loading/base_loading.dart';
import '../../core/extension/text_theme_extension.dart';
import '../../domain/entities/article/article.dart';
import '../bloc/get_bookmarked_articles/get_book_marked_articles_bloc.dart';

@RoutePage()
class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        centerTitle: true,
      ),
      body: BlocBuilder<GetBookMarkedArticlesBloc, GetBookMarkedArticlesState>(
        builder: (_, getBookMarkedArticlesState) {
          return switch (getBookMarkedArticlesState) {
            GetBookMarkedArticlesSuccess() => _SuccessView(articleList: getBookMarkedArticlesState.list),
            GetBookMarkedArticlesError() => _ErrorView(message: getBookMarkedArticlesState.message),
            GetBookMarkedArticlesEmpty() => Center(
                child: Text(getBookMarkedArticlesState.message, style: context.appTextTheme.regularDark),
              ),
            _ => const Center(child: BaseLoading())
          };
        },
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView({
    required this.articleList,
  });

  final List<Article>? articleList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10).r,
      itemBuilder: (_, index) {
        return ArticleCard(article: articleList?[index]);
      },
      separatorBuilder: (_, __) => Divider(
        thickness: 1,
        endIndent: 0.025.sw,
        indent: 0.025.sw,
      ),
      itemCount: articleList?.length ?? 0,
    );
  }
}
