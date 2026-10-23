import 'package:flutter/material.dart';
import '../theme/rtw_colors.dart';
import '../theme/rtw_typography.dart';
import 'glass_surface.dart';

class AccountField extends StatelessWidget {
  const AccountField({
    required this.label,
    required this.hint,
    required this.controller,
    this.focusNode,
    this.prefix,
    this.suffix,
    this.helper,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.textCapitalization = TextCapitalization.none,
    this.onSubmitted,
    super.key,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;
  final String? helper;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 7,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: RtwType.label),
        GlassSurface(
          height: 48,
          radius: 14,
          fill: RtwColors.green5,
          border: RtwColors.green5,
          kind: GlassKind.field,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            spacing: 10,
            children: [
              ?prefix,
              Expanded(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  autofillHints: autofillHints,
                  textCapitalization: textCapitalization,
                  onSubmitted: onSubmitted,
                  cursorColor: RtwColors.green,
                  cursorHeight: 16,
                  style: RtwType.input,
                  maxLines: 1,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: RtwType.placeholder,
                  ),
                ),
              ),
              ?suffix,
            ],
          ),
        ),
        if (helper != null) Text(helper!, style: RtwType.helper),
      ],
    );
  }
}