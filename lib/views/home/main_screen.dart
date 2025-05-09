import 'package:flutter/material.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_colors.dart';
import 'package:supermarket_deliveryagent_fe/views/bottombar/bottomnavbar.dart';
import 'package:supermarket_deliveryagent_fe/views/home/home_screen.dart';
import 'package:supermarket_deliveryagent_fe/views/orders/order.dart';
import 'package:supermarket_deliveryagent_fe/views/profile/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> _pages = [HomePage(), OrdersPage(), ProfilePage()];

  void _onBottomBarTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cloudGrey,
      body: IndexedStack(index: selectedIndex, children: _pages),
      bottomNavigationBar: BottomBar(
        selectedIndex: selectedIndex,
        onItemSelected: _onBottomBarTap,
      ),
    );
  }
}
