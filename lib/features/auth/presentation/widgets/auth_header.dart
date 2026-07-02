import 'package:flutter/material.dart';
import 'package:pasar_malam/core/constants/app_colors.dart';

class AuthHeader extends StatelessWidget {
  final IconData? icon;
  final String? imageAsset;
  final String title;
  final String subtitle;
  final Color? iconColor;

  const AuthHeader({
    super.key,
    this.icon,
    this.imageAsset,
    required this.title,
    required this.subtitle,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: Center(
            child: imageAsset != null
                ? Transform.rotate(
                    angle: -0.22, // sekitar -13°
                    child: Image.asset(
                      imageAsset!,
                      width: 170,
                      fit: BoxFit.contain,
                    ),
                  )
                : Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: (iconColor ?? AppColors.accentDeep)
                          .withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon ?? Icons.person,
                      size: 50,
                      color: iconColor ?? AppColors.accentDeep,
                    ),
                  ),
          ),
        ),

        const SizedBox(height: 8),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            letterSpacing: -.5,
          ),
        ),

        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ],
    );
  }
}