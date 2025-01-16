import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ion_web/common/consts/dimension.dart';
import 'package:ion_web/common/extensions/context_extension.dart';

class HoverTextButton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  HoverTextButton({
    super.key,
    required this.label,
    this.onTap,
  });

  final _isHovering = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isHovering,
      builder: (context, value, child) {
        return MouseRegion(
          onEnter: (_) {
            _isHovering.value = true;
          },
          onExit: (_) {
            _isHovering.value = false;
          },
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              spacing: Dimension.m,
              children: [
                Text(
                  label,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: value
                        ? context.colorScheme.primary
                        : context.colorScheme.surface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Visibility(
                  visible: value,
                  child: Icon(
                    Icons.arrow_right_alt,
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
