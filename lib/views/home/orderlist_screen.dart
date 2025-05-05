import 'package:flutter/material.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_assets.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_colors.dart';
import 'package:supermarket_deliveryagent_fe/views/home/dashedline.dart';

class HomeOrderCard extends StatelessWidget {
  const HomeOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const Text(
              'order_no #552214566',
              style: TextStyle(
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
                    const Text('Pickup 1.5km'),
                  ],
                ),
                const SizedBox(width: 8),
                const Expanded(child: DashedLine(height: 1)),
                const SizedBox(width: 8),
                Row(
                  children: [
                    Image.asset(AppAssets.vehicleIcon, width: 20, height: 20),
                    const SizedBox(width: 4),
                    const Text('Deliver 2.5km'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: AppColors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Accept'),
                Container(height: 20, width: 1.5, color: AppColors.grey),
                const Text('Reject'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
