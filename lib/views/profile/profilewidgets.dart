import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_assets.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_colors.dart';

Widget buildStatusSwitch() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(AppAssets.activeIcon),
            const SizedBox(width: 8),
            Text(
              'Active Status',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        Switch(
          value: true,
          activeColor: AppColors.primaryColor,
          onChanged: (val) {},
        ),
      ],
    ),
  );
}

Widget buildExpandableItem(
  String imagePath,
  String title, {
  bool expandable = true,
  bool isExpanded = false,
  VoidCallback? onTap,
  Widget? content,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        InkWell(
          onTap: expandable ? onTap : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(imagePath, width: 24, height: 24),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                if (expandable)
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 25,
                  ),
              ],
            ),
          ),
        ),
        if (expandable && isExpanded)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:
                  title == 'Settings' ? AppColors.white : AppColors.mintGreen,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),

            child: content,
          ),
      ],
    ),
  );
}

// Widget buildPerformanceContent() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         "Total Orders: 50",
//         style: GoogleFonts.inter(
//           fontWeight: FontWeight.w500,
//           fontSize: 14,
//           color: AppColors.black,
//         ),
//       ),
//       Text(
//         "On-Time Rate: 88%",
//         style: GoogleFonts.inter(
//           fontWeight: FontWeight.w500,
//           fontSize: 14,
//           color: AppColors.black,
//         ),
//       ),
//       Text(
//         "Rating: 4.7",
//         style: GoogleFonts.inter(
//           fontWeight: FontWeight.w500,
//           fontSize: 14,
//           color: AppColors.black,
//         ),
//       ),
//       Text(
//         "Days Worked: 30",
//         style: GoogleFonts.inter(
//           fontWeight: FontWeight.w500,
//           fontSize: 14,
//           color: AppColors.black,
//         ),
//       ),
//     ],
//   );
// }
Widget buildPerformanceContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildPerformanceRow("Total Orders", "50"),
      buildPerformanceRow("On-Time Rate", "88%"),
      buildPerformanceRow("Rating", "4.7"),
      buildPerformanceRow("Days Worked", "30"),
    ],
  );
}

Widget buildPerformanceRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
      ],
    ),
  );
}

Widget buildSummaryContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildSummaryRow("Assigned", "05"),
      buildSummaryRow("Completed", "03"),
      buildSummaryRow("Pending", "02"),
      buildSummaryRow("Current Rate", "100%"),
    ],
  );
}

Widget buildSummaryRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
      ],
    ),
  );
}
