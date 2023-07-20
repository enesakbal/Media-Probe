import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/gen/colors.gen.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blue,
          centerTitle: false,
          elevation: 4,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            color: Colors.white,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),

        scaffoldBackgroundColor: Colors.white,
      );
}
