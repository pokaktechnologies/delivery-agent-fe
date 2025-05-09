import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_colors.dart';
import 'package:supermarket_deliveryagent_fe/views/orders/current_ordercard.dart';
import 'package:supermarket_deliveryagent_fe/views/orders/delivered_ordercard.dart';
import 'package:supermarket_deliveryagent_fe/views/orders/processing_ordercard.dart';
import 'package:supermarket_deliveryagent_fe/views/orders/undelivered_ordercard.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.cloudGrey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: AppColors.primaryColor,
                automaticallyImplyLeading: false,
                titleSpacing: 16,
                centerTitle: false,
                title: Text(
                  "Orders",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      child: Icon(Icons.notifications, color: AppColors.black),
                    ),
                  ),
                ],
              ),
              Container(
                color: AppColors.white,
                child: TabBar(
                  isScrollable: true,
                  labelColor: AppColors.orange,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: AppColors.green,
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.radio_button_checked),
                          SizedBox(width: 4),
                          Text(
                            "Current",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.delivery_dining),
                          SizedBox(width: 4),
                          Text(
                            "Processing",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.check_circle_outline),
                          SizedBox(width: 4),
                          Text(
                            "Delivered",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.cancel_outlined),
                          SizedBox(width: 4),
                          Text(
                            "Undelivered",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (_, i) => const CurrentOrdersPage(),
                  ),
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (_, i) => const ProcessingOrderCard(),
                  ),
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (_, i) => const DeliveredOrderCard(),
                  ),
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (_, i) => const UndeliveredOrderCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
