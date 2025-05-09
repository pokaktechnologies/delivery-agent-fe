import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_colors.dart';

class CustomYellowButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomYellowButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.orange,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
