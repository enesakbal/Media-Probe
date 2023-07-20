import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/bottom_sheet/custom_bottom_sheet.dart';
import '../../../core/enums/period_enums.dart';
import '../../bloc/get_most_popular_articles/get_most_popular_articles_bloc.dart';

CustomBottomSheet filterBottomSheet({required ValueNotifier<PeriodEnums> selectedPeriod}) {
  return CustomBottomSheet(
    onWillPop: () async => true,
    child: StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            _RadioTile(
              setState,
              selectedPeriod: selectedPeriod,
              value: PeriodEnums.daily,
              text: 'For Daily',
            ),
            _RadioTile(
              setState,
              selectedPeriod: selectedPeriod,
              value: PeriodEnums.weekly,
              text: 'For Weekly',
            ),
            _RadioTile(
              setState,
              selectedPeriod: selectedPeriod,
              value: PeriodEnums.monthly,
              text: 'For Mouthly',
            ),
          ],
        );
      },
    ),
  );
}

class _RadioTile extends StatelessWidget {
  const _RadioTile(
    this.setState, {
    required this.selectedPeriod,
    required this.value,
    required this.text,
  });

  final ValueNotifier<PeriodEnums> selectedPeriod;
  final void Function(void Function()) setState;
  final PeriodEnums value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio<PeriodEnums>(
          value: value,
          groupValue: selectedPeriod.value,
          onChanged: (value) async {
            setState(() {
              selectedPeriod.value = value ?? PeriodEnums.daily;
            });
            context.read<GetMostPopularArticlesBloc>().add(OnGetMostPopularArticles(value ?? PeriodEnums.daily));
          },
        ),
        Expanded(child: Text(text, textAlign: TextAlign.center))
      ],
    );
  }
}
