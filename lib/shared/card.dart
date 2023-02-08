import 'package:flutter/material.dart';

/// A widget that will mimic a mobile device UI on web
///
class WhiteCard extends StatelessWidget {
  final Widget child;

  const WhiteCard({required this.child, super.key});

  static const double _cardsPadding = 10;
  static const double _cardMargin = 35;
  static const double _maxCardWidth = 470;
  static const double _borderRadius = 40;
  static final Color _pageBackground = Colors.black.withOpacity(0.8);

  final BoxDecoration _boxDecoration = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(_borderRadius),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _pageBackground,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.all(_cardMargin),
          decoration: _boxDecoration,
          constraints: const BoxConstraints(maxWidth: _maxCardWidth),
          padding: const EdgeInsets.all(_cardsPadding),
          width: double.infinity,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_borderRadius),
            child: child,
          ),
        ),
      ),
    );
  }
}
