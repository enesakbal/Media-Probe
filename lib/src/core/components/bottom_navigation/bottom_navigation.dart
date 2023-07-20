import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/gen/colors.gen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    required this.items,
    required this.onTabSelected,
    required this.selectedIndex,
    super.key,
  });

  final List<BottomNavigationItem> items;
  final ValueChanged<int> onTabSelected;
  final int selectedIndex;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 0.1.r,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: List.generate(
            widget.items.length,
            (index) => TabItemBottomNavigation(
              index: index,
              item: widget.items[index],
              onPressed: widget.onTabSelected,
              color: widget.selectedIndex == index ? AppColors.blue : AppColors.grey,
              isSelected: widget.selectedIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}

class TabItemBottomNavigation extends StatelessWidget {
  const TabItemBottomNavigation({
    required this.item,
    required this.index,
    required this.onPressed,
    required this.color,
    required this.isSelected,
    super.key,
  });

  final BottomNavigationItem item;
  final int index;
  final ValueChanged<int> onPressed;
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final height = 1.sw < 385 ? 50.r : 35.r;
    final iconSize = 1.sw < 385 ? 27.5.r : 20.r;

    return Expanded(
      child: SizedBox(
        height: height,
        child: PhysicalModel(
          color: Colors.white,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => onPressed(index),
            child: Column(
              children: [
                Container(
                  color: isSelected ? color : null,
                  height: 2.r,
                  width: 30.r,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 1,
                  ).r,
                  child: SvgPicture.asset(
                    item.icon,
                    height: iconSize,
                    width: iconSize,
                    colorFilter: ColorFilter.mode(
                      color,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavigationItem {
  BottomNavigationItem({required this.icon});

  final String icon;
}
