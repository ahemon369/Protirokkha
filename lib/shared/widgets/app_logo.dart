import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final Color? color;

  const AppLogo({
    super.key,
    this.size = 100,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final logoColor = color ?? Theme.of(context).colorScheme.primary;
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: logoColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: logoColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Shield shape
          Icon(
            Icons.shield,
            size: size * 0.6,
            color: Colors.white,
          ),
          // Fist icon on top
          Positioned(
            bottom: size * 0.25,
            child: Icon(
              Icons.back_hand,
              size: size * 0.35,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
