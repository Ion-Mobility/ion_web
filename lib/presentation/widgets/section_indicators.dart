import 'package:flutter/material.dart';
import 'package:ion_web/common/extensions/context_extension.dart';

import '../../common/consts/dimension.dart';

class SectionIndicators extends StatelessWidget {
  final int index;
  final int? selectedPage;
  final Color? activeColor;

  const SectionIndicators({
    required this.index,
    this.selectedPage,
    super.key,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: index != 0 && index < 4,
      child: Container(
        width: 4,
        margin: EdgeInsets.only(
          left: Dimension.xl,
        ),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 4,
              height: 28,
              child: Material(
                color: selectedPage == index
                    ? activeColor
                    : context.colorScheme.surface.withAlpha(45),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: Dimension.xs,
          ),
          itemCount: 4,
        ),
      ),
    );
  }
}
