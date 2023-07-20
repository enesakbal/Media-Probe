import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseLoading extends StatelessWidget {
  const BaseLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.r,
      height: 40.r,
      child: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.black,
        strokeWidth: 2.5.r,
      ),
    );
  }
}
