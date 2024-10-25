import 'package:flutter/material.dart';

class CircleAvatarSection extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final IconData? icon;
  final double radius;
  final VoidCallback? onTap;

  const CircleAvatarSection({
    super.key,
    this.imagePath,
    this.title,
    this.icon,
    required this.radius,
    this.onTap,
  }) : assert(imagePath != null || icon != null,
            'Either imagePath or icon must be provided.');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: radius,
            child: imagePath != null
                ? ClipOval(
                    child: Image.asset(
                      imagePath!,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(icon, size: radius),
          ),
          const SizedBox(height: 4.0),
          Text(
            title ?? '',
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
