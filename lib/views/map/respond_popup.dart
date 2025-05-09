import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_colors.dart';

void showReasonDialog(BuildContext context) {
  String selectedReason = 'Customer Not Responding';
  TextEditingController otherReasonController = TextEditingController();
  bool isOtherSelected = false;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.all(16),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectedReason,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: isOtherSelected,
                      onChanged: (value) {
                        setState(() {
                          isOtherSelected = true;
                        });
                      },
                    ),
                    Text(
                      "Other",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                if (isOtherSelected)
                  TextField(
                    controller: otherReasonController,
                    decoration: InputDecoration(
                      hintText: 'Reason',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        String reason =
                            isOtherSelected
                                ? otherReasonController.text
                                : selectedReason;

                        // You can handle submission here
                        print("Submitted reason: $reason");

                        Navigator.pop(context);
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
