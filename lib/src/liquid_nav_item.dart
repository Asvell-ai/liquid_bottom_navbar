import 'package:flutter/widgets.dart';

/// Model for a single navigation item.
@immutable
class LiquidNavItem {
  const LiquidNavItem({
    required this.icon,
    this.activeIcon,
    this.inactiveIcon,
    this.label,
    this.semanticLabel,
  });

  /// Default icon.
  final IconData icon;

  /// Icon used for active state. Falls back to [icon].
  final IconData? activeIcon;

  /// Icon used for inactive state. Falls back to [icon].
  final IconData? inactiveIcon;

  /// Optional item label.
  final String? label;

  /// Optional semantic label for accessibility.
  final String? semanticLabel;
}
