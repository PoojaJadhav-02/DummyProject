import 'package:flutter/material.dart';

abstract final class RtwAssets {
  static const emblem = 'assets/icons/rtw_emblem.png';
  static const signal = 'assets/icons/ios_signal.svg';
  static const wifi = 'assets/icons/ios_wifi.svg';
  static const battery = 'assets/icons/ios_battery.svg';
  static const chevronLeft = 'assets/icons/chevron_left.svg';
  static const mail = 'assets/icons/mail.svg';
  static const mars = 'assets/icons/mars.svg';
  static const venus = 'assets/icons/venus.svg';
  static const lock = 'assets/icons/lock.svg';
  static const eyeOff = 'assets/icons/eye_off.svg';
  static const eye = 'assets/icons/eye.svg';
  static const arrowRight = 'assets/icons/arrow_right.svg';
}

class RtwSvgIcon extends StatelessWidget {
  const RtwSvgIcon(
      this.asset, {
        required this.width,
        required this.height,
        this.color,
        super.key,
      });

  final String asset;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // These files are PNG bytes saved with a .svg extension.
    return Image.asset(
      asset,
      width: width,
      height: height,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
      color: color,
      colorBlendMode: BlendMode.srcIn,
    );
  }
}