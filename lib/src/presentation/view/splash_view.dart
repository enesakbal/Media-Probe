import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../config/gen/assets.gen.dart';
import '../../config/router/app_router.dart';
import '../../core/extension/extensions.dart';

@RoutePage()
class SplashView extends HookWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () async {
        await GetIt.I<AppRouter>().push(const MasterRoute());
      });
      return () {};
    }, []);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(100).r,
            child: Assets.icons.appIcon.image(),
          ),
          Text(
            'MEDIA PROBE',
            style: context.appTextTheme.boldDark.copyWith(
              fontSize: 24.sp,
            ),
          )
        ],
      ),
    );
  }
}
