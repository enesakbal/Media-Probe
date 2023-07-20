import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/gen/assets.gen.dart';
import '../loading/base_loading.dart';

class BaseNetworkImage extends StatelessWidget {
  const BaseNetworkImage({super.key, required this.imageUrl, this.showError = false});

  final String? imageUrl;

  final bool showError;

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      imageUrl ?? '',
      fit: BoxFit.cover,
      cacheRawData: true,
      printError: false,
      loadStateChanged: (ExtendedImageState state) {
        return switch (state.extendedImageLoadState) {
          LoadState.loading => const ColoredBox(
              color: Colors.grey,
              child: BaseLoading(),
            ),
          LoadState.completed => ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              fit: BoxFit.cover,
            ),
          LoadState.failed => ColoredBox(
              color: Colors.grey,
              child: InkWell(
                onTap: () => state.reLoadImage(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.retry.svg(fit: BoxFit.scaleDown),
                    if (showError) ...[
                      15.verticalSpacingRadius,
                      Text(state.lastException.toString()),
                    ]
                  ],
                ),
              ),
            )
        };
      },
    );
  }
}
