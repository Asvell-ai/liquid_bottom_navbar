# liquid_bottom_nav_bar

An iOS-inspired liquid bottom navigation bar for Flutter with smooth tap animation, drag support, badges, glass blur, and fully customizable styling.

## 🖼️ Example Preview

Here's how the default **Liquid Bottom NavBar** looks 👇

<p align="center">
  <img src="https://raw.githubusercontent.com/Asvell-ai/liquid_bottom_navbar/main/assets/navbar.gif" width="350" alt="Liquid bottom navigation bar demo" />
</p>

## ✨ Features

- **Liquid Blob Animation**: Smooth animation based on drag velocity, expansion, and wobble.
- **Interactive Gestures**: Supports both tap and drag navigation.
- **Customizable Items**: Set unique active/inactive icons and labels for each tab.
- **Badge Support**: Easily add notification badges by item index.
- **Glassmorphism**: Built-in support for glass blur effects.
- **Deep Styling**: Control every detail - from borders and shadows to blob stretch and size.
- **Null Safe**: Fully compatible with the latest Flutter versions.

## 🚀 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  liquid_bottom_nav_bar: ^0.1.0
```

Then import it:

```dart
import 'package:liquid_bottom_nav_bar/liquid_bottom_nav_bar.dart';
```

## 🛠️ Basic Usage

```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  static const items = <LiquidNavItem>[
    LiquidNavItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Home',
    ),
    LiquidNavItem(
      icon: Icons.search_outlined,
      activeIcon: Icons.search,
      label: 'Search',
    ),
    LiquidNavItem(
      icon: Icons.favorite_border,
      activeIcon: Icons.favorite,
      label: 'Favorite',
    ),
    LiquidNavItem(
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: LiquidBottomNavBar(
        currentIndex: currentIndex,
        items: items,
        onTap: (index) => setState(() => currentIndex = index),
        onDrag: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
```

## 🎨 Styling

Use direct parameters for quick changes, or pass a reusable `LiquidNavStyle`.

```dart
LiquidBottomNavBar(
  currentIndex: currentIndex,
  items: items,
  onTap: (index) => setState(() => currentIndex = index),
  showLabel: true,
  blurSigma: 8,
  height: 72,
  style: const LiquidNavStyle(
    containerColor: Color(0xCCFFFFFF),
    liquidColor: Color(0xFF0EA5E9),
    activeIconColor: Color(0xFFFFFFFF),
    inactiveIconColor: Color(0xFF475569),
    borderRadius: BorderRadius.all(Radius.circular(28)),
    boxShadow: [
      BoxShadow(
        color: Color(0x0D000000),
        blurRadius: 18,
        offset: Offset(0, 6),
      ),
    ],
  ),
)
```

## 🔴 Badges

Pass badge counts by item index.

```dart
LiquidBottomNavBar(
  currentIndex: currentIndex,
  items: items,
  onTap: onTabChanged,
  badges: const {
    2: 4,
  },
)
```

## 🧪 Blob Tuning

You can tune the visible shape of the liquid blob using public parameters.

```dart
LiquidBottomNavBar(
  currentIndex: currentIndex,
  items: items,
  onTap: onTabChanged,
  blobBaseWidthFactor: 0.78,
  blobExpandedWidthFactor: 1.08,
  blobBaseHeight: 44,
  blobExpandedHeight: 58,
  blobStretchMultiplier: 30,
  blobMaxStretch: 38,
)
```

## 📖 API Reference

### LiquidBottomNavBar

| Parameter | Type | Description |
| --- | --- | --- |
| `currentIndex` | `int` | Selected tab index. |
| `items` | `List<LiquidNavItem>` | Navigation items. |
| `onTap` | `ValueChanged<int>?` | Called when an item is tapped. |
| `onDrag` | `ValueChanged<int>?` | Called when drag ends on the nearest item. |
| `badges` | `Map<int, int>?` | Badge counts by item index. |
| `containerColor` | `Color?` | Navigation container color. |
| `liquidColor` | `Color?` | Liquid blob color. |
| `activeIconColor` | `Color?` | Active icon color. |
| `inactiveIconColor` | `Color?` | Inactive icon color. |
| `height` | `double` | Widget height. |
| `blurSigma` | `double?` | Optional glass blur amount. |
| `animationDuration` | `Duration` | Snap animation duration. |
| `curve` | `Curve` | Snap animation curve. |

### LiquidNavItem

```dart
const LiquidNavItem(
  icon: Icons.home_outlined,
  activeIcon: Icons.home,
  label: 'Home',
)
```

## 📄 License

This project is licensed under the MIT License.

---
Created by [Asadulloh](https://github.com/asadulloh)
