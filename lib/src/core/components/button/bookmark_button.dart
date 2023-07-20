import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/gen/assets.gen.dart';
import '../../../domain/entities/article/article.dart';
import '../../../presentation/bloc/add_bookmark_article/add_bookmark_article_bloc.dart';
import '../../../presentation/bloc/delete_bookmark_article/delete_bookmark_article_bloc.dart';
import '../../../presentation/bloc/get_bookmarked_articles/get_book_marked_articles_bloc.dart';

class BookmarkIconButton extends HookWidget {
  const BookmarkIconButton({
    super.key,
    required this.currentValue,
    required this.article,
  });
  final bool? currentValue;
  final Article? article;

  @override
  Widget build(BuildContext context) {
    final isSelected = useState<bool>(currentValue ?? false);

    return MultiBlocListener(
      listeners: [
        BlocListener<AddBookmarkArticleBloc, AddBookmarkArticleState>(
          listener: (context, addBookmarkArticleState) {
            return switch (addBookmarkArticleState) {
              AddBookmarkArticleSuccess() =>
                context.read<GetBookMarkedArticlesBloc>().add(const OnGetBookMarkedArticles()),
              _ => null
            };
          },
        ),
        BlocListener<DeleteBookmarkArticleBloc, DeleteBookmarkArticleState>(
          listener: (context, deleteBookmarkArticleState) {
            return switch (deleteBookmarkArticleState) {
              DeleteBookmarkArticleSuccess() =>
                context.read<GetBookMarkedArticlesBloc>().add(const OnGetBookMarkedArticles()),
              _ => null
            };
          },
        ),
      ],
      child: GestureDetector(
        onTap: () {
          if (isSelected.value) {
            context.read<DeleteBookmarkArticleBloc>().add(OnDeleteBookmarkArticle(article ?? Article()));
          } else {
            context.read<AddBookmarkArticleBloc>().add(OnAddBookmarkArticle(article ?? Article()));
          }
          isSelected.value = !isSelected.value;
        },
        child: isSelected.value
            ? Assets.icons.bookmarkFilled.svg(height: 25.r)
            : Assets.icons.bookmarkEmpty.svg(height: 25.r),
      ),
    );
  }
}
