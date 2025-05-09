import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_assets.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_colors.dart';
import 'package:supermarket_deliveryagent_fe/views/home/dashedline.dart';

class CurrentOrdersPage extends StatelessWidget {
  const CurrentOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = List.generate(
      3,
      (index) => {
        'name': 'John Doe',
        'orderNo': '#552214566',
        'pickupDistance': index == 1 ? '0 km' : '1.5km',
        'deliveryDistance': '2.5km',
      },
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            color: Colors.orange[100],
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Orders: ${orders.length}",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                Container(height: 20, width: 1.5, color: AppColors.grey),
                Text(
                  "Completed: 3",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                Container(height: 20, width: 1.5, color: AppColors.grey),
                Text(
                  "Pending: 2",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Order cards list
          ...orders.map((order) => buildOrderCard(order)).toList(),
        ],
      ),
    );
  }

  Widget buildOrderCard(Map<String, String> order) {
    return Card(
      color: AppColors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order['name'] ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            Text(
              'order_no ${order['orderNo']}',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Row(
                  children: [
                    Image.asset(AppAssets.fromIcon, width: 16, height: 16),
                    const SizedBox(width: 4),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          const TextSpan(text: 'Pickup '),
                          TextSpan(
                            text: order['pickupDistance'],
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                const Expanded(child: DashedLine(height: 1)),
                const SizedBox(width: 8),
                Row(
                  children: [
                    Image.asset(AppAssets.vehicleIcon, width: 20, height: 20),
                    const SizedBox(width: 4),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          const TextSpan(text: 'Deliver '),
                          TextSpan(
                            text: order['deliveryDistance'],
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: AppColors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset(AppAssets.acceptIcon, width: 20, height: 20),
                    const SizedBox(width: 4),
                    InkWell(onTap: () {}, child: const Text('Accept')),
                  ],
                ),
                Container(height: 20, width: 1.5, color: AppColors.grey),
                Row(
                  children: [
                    Image.asset(AppAssets.rejectIcon, width: 20, height: 20),
                    const SizedBox(width: 4),
                    InkWell(onTap: () {}, child: const Text('Reject')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
