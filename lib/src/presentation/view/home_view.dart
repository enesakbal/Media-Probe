import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/gen/assets.gen.dart';
import '../../core/components/bottom_sheet/custom_bottom_sheet.dart';
import '../../core/components/card/article_card.dart';
import '../../core/components/loading/base_loading.dart';
import '../../core/enums/period_enums.dart';
import '../../domain/entities/article_list/article_list.dart';
import '../_widget/home/filter_bottom_sheet.dart';
import '../bloc/get_most_popular_articles/get_most_popular_articles_bloc.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<PeriodEnums> selectedPeriod = ValueNotifier(PeriodEnums.daily);

    return Scaffold(
      appBar: AppBar(
        title: const Text('NY Times Most Popular Articles'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async => filterBottomSheet(selectedPeriod: selectedPeriod).show(context),
            child: Assets.icons.filter.svg(color: Colors.white),
          ),
          15.horizontalSpace,
        ],
      ),
      body: BlocBuilder<GetMostPopularArticlesBloc, GetMostPopularArticlesState>(
        builder: (_, mostPopularArticleState) {
          return switch (mostPopularArticleState) {
            GetMostPopularArticlesSuccess() => _SuccessView(articleList: mostPopularArticleState.articleList),
            GetMostPopularArticlesError() => _ErrorView(message: mostPopularArticleState.message),
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

  final ArticleList articleList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10).r,
      itemBuilder: (_, index) {
        return ArticleCard(article: articleList.results?[index]);
      },
      separatorBuilder: (_, __) => Divider(
        thickness: 1,
        endIndent: 0.025.sw,
        indent: 0.025.sw,
      ),
      itemCount: articleList.results?.length ?? 0,
    );
  }
}
