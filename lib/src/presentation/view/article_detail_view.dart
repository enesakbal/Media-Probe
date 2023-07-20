import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/button/bookmark_button.dart';
import '../../core/components/image/base_network_image.dart';
import '../../core/extension/extensions.dart';
import '../../domain/entities/article/article.dart';
import '../_widget/article_detail/keyword_chip.dart';
import '../bloc/get_bookmarked_articles/get_book_marked_articles_bloc.dart';

@RoutePage()
class ArticleDetailView extends StatelessWidget {
  const ArticleDetailView({
    super.key,
    required this.article,
  });

  final Article? article;

  @override
  Widget build(BuildContext context) {
    final title = article?.title ?? '';
    final abstract = article?.abstract ?? '';
    final byline = article?.byline ?? '';
    final date = article?.publishedDate ?? '';
    final keywords = article?.adxKeywords?.split(';') ?? [];
    final imageUrl = article?.imageUrl ?? '';
    final caption = article?.caption ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: [
          BookmarkIconButton(
            currentValue: context.watch<GetBookMarkedArticlesBloc>().bookmarkedList.any((e) => e.id == article?.id),
            article: article,
          ),
          15.horizontalSpaceRadius,
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* TITLE
            Text(title, style: context.appTextTheme.regularDark.copyWith(fontSize: 18.sp)),

            30.verticalSpaceFromWidth,

            //* ABSTRACT
            Text(abstract, style: context.appTextTheme.thinDark.copyWith(fontSize: 14.sp)),
            45.verticalSpaceFromWidth,

            //* BYLINE AND DATE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    byline,
                    style: context.appTextTheme.thinDark.copyWith(fontSize: 12.sp),
                  ),
                ),
                Text(
                  date.toDate(),
                  style: context.appTextTheme.thinDark.copyWith(fontSize: 12.sp),
                ),
              ],
            ),

            15.verticalSpacingRadius,
            const Divider(thickness: 1),
            25.verticalSpacingRadius,

            //* IMAGE
            SizedBox(
              height: 1.sw,
              width: 1.sw,
              child: BaseNetworkImage(
                imageUrl: imageUrl,
                showError: true,
              ),
            ),

            45.verticalSpacingRadius,

            //* CAPTION
            Text(
              caption,
              style: context.appTextTheme.thinDark.copyWith(fontSize: 14.sp),
            ),

            45.verticalSpacingRadius,

            //* KEYWORDS
            Text(
              'Keywords',
              style: context.appTextTheme.regularDark.copyWith(fontSize: 18.sp),
            ),
            20.verticalSpacingRadius,
            Wrap(
              spacing: 8,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: keywords.map((e) => KeywordChip(keyword: e)).toList(),
            ),

            ///*
            45.verticalSpacingRadius,
          ],
        ),
      ),
    );
  }
}
