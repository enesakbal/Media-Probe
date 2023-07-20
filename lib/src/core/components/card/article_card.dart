import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../config/gen/assets.gen.dart';
import '../../../config/router/app_router.dart';
import '../../../domain/entities/article/article.dart';
import '../../extension/string_extensions.dart';
import '../../extension/text_theme_extension.dart';
import '../image/base_network_image.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.article, this.isBookmarked = false});

  final Article? article;
  final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    final title = article?.title ?? '';
    final byline = article?.byline ?? '';
    final date = article?.publishedDate ?? '';
    final keywords = article?.adxKeywords?.split(';').first ?? '';
    final imageUrl = article?.imageUrl ?? '';

    return GestureDetector(
      onTap: () async => GetIt.I<AppRouter>().push(ArticleDetailRoute(
        article: article,
      )),
      child: ListTile(
        titleTextStyle: context.appTextTheme.boldDark,
        contentPadding: const EdgeInsets.all(8).r,
        minVerticalPadding: 5.r,
        title: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.appTextTheme.boldDark,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                byline,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.appTextTheme.regularDark,
              ),
              20.verticalSpacingRadius,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      keywords,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTextTheme.thinDark,
                    ),
                  ),
                  const Spacer(flex: 2),
                  Expanded(
                    flex: 5,
                    child: Text(
                      date.toDate(),
                      textAlign: TextAlign.center,
                      style: context.appTextTheme.thinDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        leading: SizedBox(
          height: 50.r,
          width: 50.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100).r,
            child: BaseNetworkImage(imageUrl: imageUrl),
          ),
        ),
        trailing: Container(
          child: Assets.icons.rightArrow.svg(width: 24.r),
        ),
      ),
    );
  }
}
