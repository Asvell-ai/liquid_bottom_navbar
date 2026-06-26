import 'package:flutter/widgets.dart';

/// Signature for a builder that creates the icon widget for a navigation item.
///
/// [isActive] is `true` when this item is the currently selected one.
/// [progress] ranges from 0.0 (inactive color) to 1.0 (active color).
/// [color] is the resolved color lerped between [LiquidNavStyle.inactiveIconColor]
/// and [LiquidNavStyle.activeIconColor] at the given [progress].
typedef LiquidNavIconBuilder = Widget Function(
  bool isActive,
  double progress,
  Color color,
);

/// Model for a single navigation item.
@immutable
class LiquidNavItem {
  const LiquidNavItem({
    this.icon,
    this.activeIcon,
    this.inactiveIcon,
    this.label,
    this.semanticLabel,
    this.iconWidget,
    this.activeIconWidget,
    this.inactiveIconWidget,
    this.iconBuilder,
  }) : assert(
         icon != null || iconBuilder != null || iconWidget != null,
         'Provide at least one of icon, iconBuilder, or iconWidget',
       );

  /// Default icon.
  final IconData? icon;

  /// Icon used for active state. Falls back to [icon].
  final IconData? activeIcon;

  /// Icon used for inactive state. Falls back to [icon].
  final IconData? inactiveIcon;

  /// Optional item label.
  final String? label;

  /// Optional semantic label for accessibility.
  final String? semanticLabel;

  /// Widget override for the icon.
  ///
  /// Takes priority over [icon]. The widget is constrained to the navbar's
  /// [iconSize]. Color is NOT automatically applied — manage colors inside
  /// your widget, or use [iconBuilder] to receive the resolved color.
  final Widget? iconWidget;

  /// Widget override for the active state.
  ///
  /// Takes priority over [iconWidget], [activeIcon], and [icon].
  final Widget? activeIconWidget;

  /// Widget override for the inactive state.
  ///
  /// Takes priority over [iconWidget], [inactiveIcon], and [icon].
  final Widget? inactiveIconWidget;

  /// Full-control icon builder.
  ///
  /// When set, [icon], [activeIcon], [inactiveIcon], [iconWidget],
  /// [activeIconWidget], and [inactiveIconWidget] are ignored entirely.
  ///
  /// Receives the current selection state, transition progress, and the
  /// resolved color so you can tint SVGs, images, or custom widgets:
  ///
  /// ```dart
  /// iconBuilder: (isActive, progress, color) => SvgPicture.asset(
  ///   isActive ? 'home_active.svg' : 'home.svg',
  ///   color: color,
  ///   width: 20,
  ///   height: 20,
  /// ),
  /// ```
  final LiquidNavIconBuilder? iconBuilder;
}
