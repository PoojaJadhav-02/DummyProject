import 'dart:ui';

import 'package:flutter/material.dart';

/// Which Figma Glass setting a surface uses.
///
/// Flutter has no refraction or dispersion, so each kind keeps the inspected
/// tint and border, then adds a backdrop blur and a light sheen aimed the
/// same way as the Figma light angle.
enum GlassKind {
  /// Back button and form card.
  /// Radius 24, refraction 0.18, depth 18, light 315°, intensity 0.65,
  /// dispersion 0.2, splay 0.01.
  panel(
    blur: 14,
    sheen: 0.07,
    begin: Alignment(-0.9, -1),
    end: Alignment(0.7, 1),
  ),

  /// Inputs and the unselected gender option.
  /// Radius 4, refraction 0.8, depth 20, light -45°, intensity 0.8,
  /// dispersion 0.5, splay 0.
  field(
    blur: 6,
    sheen: 0.045,
    begin: Alignment(0.15, -1),
    end: Alignment(-0.15, 0.8),
  ),

  /// Selected gender option.
  /// Radius 51, refraction 0.5, depth 100, light -45°, intensity 0.8,
  /// dispersion 1, splay 0.01.
  selected(
    blur: 12,
    sheen: 0.1,
    begin: Alignment(0.2, -1),
    end: Alignment(-0.4, 1),
  );

  const GlassKind({
    required this.blur,
    required this.sheen,
    required this.begin,
    required this.end,
  });

  final double blur;
  final double sheen;
  final Alignment begin;
  final Alignment end;
}

class GlassSurface extends StatelessWidget {
  const GlassSurface({
    required this.fill,
    required this.border,
    required this.radius,
    required this.child,
    this.kind = GlassKind.field,
    this.width,
    this.height,
    this.padding = EdgeInsets.zero,
    this.onTap,
    super.key,
  });

  final Color fill;
  final Color border;
  final double radius;
  final Widget child;
  final GlassKind kind;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radiusValue = BorderRadius.circular(radius);
    Widget content = Padding(padding: padding, child: child);

    if (onTap != null) {
      content = Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: radiusValue,
          child: SizedBox.expand(child: content),
        ),
      );
    }

    return ClipRRect(
      borderRadius: radiusValue,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: kind.blur, sigmaY: kind.blur),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: radiusValue,
            border: Border.all(color: border),
          ),
          child: SizedBox(
            width: width,
            height: height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(child: ColoredBox(color: fill)),
                Positioned.fill(
                  child: IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: kind.begin,
                          end: kind.end,
                          colors: [
                            Colors.white.withValues(alpha: kind.sheen),
                            const Color(0x00FFFFFF),
                          ],
                          stops: const [0, 0.62],
                        ),
                      ),
                    ),
                  ),
                ),
                if (width == null)
                  SizedBox(width: double.infinity, child: content)
                else
                  content,
              ],
            ),
          ),
        ),
      ),
    );
  }
}