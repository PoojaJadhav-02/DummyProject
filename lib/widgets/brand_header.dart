import 'package:flutter/material.dart';

import '../theme/rtw_colors.dart';
import '../theme/rtw_typography.dart';
import 'glass_surface.dart';
import 'rtw_svg_icon.dart';

/// Brand row from frame `800:902`. The back control and wordmark are placed
/// at the same offsets Figma uses; they are not centered in the screen.
class BrandHeader extends StatelessWidget {
  const BrandHeader({this.onBack, super.key});

  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 28,
            top: 14,
            child: Semantics(
              button: true,
              label: 'Back',
              child: GlassSurface(
                width: 38,
                height: 38,
                radius: 100,
                fill: RtwColors.white5,
                border: RtwColors.white15,
                kind: GlassKind.panel,
                onTap: onBack,
                child: const Center(
                  child: RtwSvgIcon(
                    RtwAssets.chevronLeft,
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
            ),
          ),
          const Positioned(left: 79, top: 13, child: _Identity()),
        ],
      ),
    );
  }
}

class _Identity extends StatelessWidget {
  const _Identity();

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(RtwAssets.emblem),
          width: 38,
          height: 38,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          semanticLabel: 'Revive the World',
        ),
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Revive', style: RtwType.wordmark),
            Text(' THE WORLD', style: RtwType.wordmarkMeaning),
          ],
        ),
      ],
    );
  }
}