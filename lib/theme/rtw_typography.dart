import 'package:flutter/material.dart';

import 'rtw_colors.dart';

/// Inter styles from frame `800:892`.
///
/// "Revive" is drawn at 22px Semi Bold with no extra tracking. The text box in
/// Figma is 71px wide, and this cut of Inter measures 72px at that size.
/// A 5px tracking value reported on the same text node would measure 97px, so
/// the rendered width is what this screen follows.
abstract final class RtwType {
  static const _family = 'Inter';

  static const time = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 1.2,
    color: RtwColors.ivory,
  );

  static const wordmark = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w600,
    fontSize: 22,
    height: 1.23,
    letterSpacing: 0,
    color: RtwColors.ivory,
  );

  static const wordmarkMeaning = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w500,
    fontSize: 9,
    height: 1.22,
    color: RtwColors.sage,
  );

  static const step = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w500,
    fontSize: 11,
    height: 1.18,
    color: RtwColors.green,
  );

  static const headline = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w600,
    fontSize: 36,
    height: 1.12,
    letterSpacing: -1.3,
    color: RtwColors.ivory,
  );

  static const label = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.25,
    color: RtwColors.ivory,
  );

  static const placeholder = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 1.23,
    color: RtwColors.sage,
  );

  static const input = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 1.23,
    color: RtwColors.ivory,
  );

  static const optionSelected = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w600,
    fontSize: 13,
    height: 1.23,
    color: RtwColors.ivory,
  );

  static const optionIdle = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 1.23,
    color: RtwColors.sage,
  );

  static const helper = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w400,
    fontSize: 10,
    height: 1.5,
    color: RtwColors.sage,
  );

  static const button = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.2,
    color: RtwColors.white,
  );

  static const legal = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 1.6,
    color: RtwColors.sage,
  );

  static const legalLink = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w500,
    fontSize: 11,
    height: 1.6,
    color: RtwColors.green,
  );

  static const login = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 1.23,
    color: RtwColors.sage,
  );

  static const loginLink = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w600,
    fontSize: 13,
    height: 1.23,
    color: RtwColors.green,
  );

  static const footer = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w500,
    fontSize: 9,
    height: 1.22,
    letterSpacing: 1.55,
    color: RtwColors.sage,
  );
}