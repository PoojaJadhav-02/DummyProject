import 'package:flutter/material.dart';

import '../theme/rtw_colors.dart';
import '../theme/rtw_typography.dart';
import 'glass_surface.dart';
import 'rtw_svg_icon.dart';

enum Gender { male, female }

class GenderSelector extends StatelessWidget {
  const GenderSelector({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final Gender value;
  final ValueChanged<Gender> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 7,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender', style: RtwType.label),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: GenderOption(
                label: 'Male',
                iconAsset: RtwAssets.mars,
                selected: value == Gender.male,
                onTap: () => onChanged(Gender.male),
              ),
            ),
            Expanded(
              child: GenderOption(
                label: 'Female',
                iconAsset: RtwAssets.venus,
                selected: value == Gender.female,
                onTap: () => onChanged(Gender.female),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GenderOption extends StatelessWidget {
  const GenderOption({
    required this.label,
    required this.iconAsset,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final String label;
  final String iconAsset;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final iconColor = selected ? RtwColors.green : RtwColors.sage;
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: GlassSurface(
        height: 40,
        radius: 14,
        fill: selected ? RtwColors.green16 : RtwColors.green5,
        border: selected ? RtwColors.green : RtwColors.green5,
        kind: selected ? GlassKind.selected : GlassKind.field,
        onTap: onTap,
        padding: selected
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          spacing: selected ? 8 : 10,
          mainAxisAlignment: selected
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            RtwSvgIcon(iconAsset, width: 16, height: 16, color: iconColor),
            Text(
              label,
              style: selected ? RtwType.optionSelected : RtwType.optionIdle,
            ),
          ],
        ),
      ),
    );
  }
}