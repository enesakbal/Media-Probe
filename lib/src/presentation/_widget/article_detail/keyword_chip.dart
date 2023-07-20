import 'package:flutter/material.dart';

import '../../../core/extension/extensions.dart';

class KeywordChip extends StatelessWidget {
  const KeywordChip({super.key, required this.keyword});
  final String keyword;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RawChip(
        onPressed: () {},
        backgroundColor: Colors.grey.shade500,
        labelStyle: context.appTextTheme.regularWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        label: Text(keyword),
      ),
    );
  }
}
