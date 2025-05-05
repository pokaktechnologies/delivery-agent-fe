import 'package:flutter/material.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_colors.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<_BottomBarItemModel> items = [
      _BottomBarItemModel(icon: Icons.home, text: 'Home'),
      _BottomBarItemModel(icon: Icons.shopping_bag, text: 'Orders'),
      _BottomBarItemModel(icon: Icons.person_outlined, text: 'Profile'),
    ];

    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length, (index) {
          return GestureDetector(
            onTap: () => onItemSelected(index),
            child: SingleBottomBarItem(
              icon: items[index].icon,
              text: items[index].text,
              isSelected: selectedIndex == index,
            ),
          );
        }),
      ),
    );
  }
}

class SingleBottomBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  const SingleBottomBarItem({
    super.key,
    required this.icon,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: isSelected ? AppColors.primaryColor : AppColors.grey,
          ),

          const SizedBox(height: 2),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? AppColors.primaryColor : AppColors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomBarItemModel {
  final IconData icon;
  final String text;

  _BottomBarItemModel({required this.icon, required this.text});
}
