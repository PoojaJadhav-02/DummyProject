import 'package:flutter/material.dart';

import '../theme/rtw_typography.dart';
import 'rtw_svg_icon.dart';

/// The designed iOS status bar: 402 × 48, horizontal padding 28.
class RtwStatusBar extends StatelessWidget {
  const RtwStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 48,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('9:41', style: RtwType.time),
            ExcludeSemantics(
              child: Row(
                spacing: 5,
                children: [
                  RtwSvgIcon(RtwAssets.signal, width: 18, height: 18),
                  RtwSvgIcon(RtwAssets.wifi, width: 18, height: 18),
                  RtwSvgIcon(RtwAssets.battery, width: 25, height: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}