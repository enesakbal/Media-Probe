import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    required this.child,
    this.onWillPop,
    this.padding,
    super.key,
  });
  final Widget child;
  final EdgeInsets? padding;
  final Future<bool> Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop ?? () async => false,
      child: Container(
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              indent: .30.sw,
              endIndent: .30.sw,
              thickness: 2.5,
              color: Colors.black,
            ),
            15.verticalSpacingRadius,
            child,
            15.verticalSpacingRadius,
          ],
        ),
      ),
    );
  }
}

extension CustomSheetExtension on CustomBottomSheet {
  Future<T?> show<T>(BuildContext context, {bool enableDrag = true}) {
    return showModalBottomSheet<T>(
      context: context,
      enableDrag: enableDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: const Radius.circular(20).r,
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: padding ??
              EdgeInsets.fromLTRB(
                0.05.sw,
                0.0125.sw,
                0.05.sw,
                0.05.sw,
              ).r,
          child: this,
        );
      },
    );
  }
}
