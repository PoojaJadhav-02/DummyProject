import 'package:flutter/material.dart';

import '../theme/rtw_colors.dart';
import '../theme/rtw_typography.dart';
import 'rtw_svg_icon.dart';

/// Instance of the "Let's begin" component, variant Property 1=Default.
/// This screen shows the label "Next".
class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    required this.label,
    this.onPressed,
    this.iconAsset = RtwAssets.arrowRight,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final String iconAsset;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: RtwColors.lime,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: RtwColors.green16),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 58,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text(label, style: RtwType.button),
              RtwSvgIcon(iconAsset, width: 22, height: 22),
            ],
          ),
        ),
      ),
    );
  }
}