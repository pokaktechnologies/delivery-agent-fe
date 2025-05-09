import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_assets.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_colors.dart';
import 'package:supermarket_deliveryagent_fe/core/utils/navigations.dart';
import 'package:supermarket_deliveryagent_fe/views/profile/profilewidgets.dart';
import 'package:supermarket_deliveryagent_fe/views/profile/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isPerformanceExpanded = false;
  bool isSummaryExpanded = false;
  bool isSettingsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cloudGrey,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          "Profile",
          style: GoogleFonts.inter(
            fontSize: 20,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                child: Icon(Icons.notifications, color: AppColors.black),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            buildProfileCard(),
            const SizedBox(height: 16),
            buildStatusSwitch(),
            const SizedBox(height: 10),
            buildExpandableItem(
              AppAssets.performanceIcon,
              'Performance',
              isExpanded: isPerformanceExpanded,
              onTap: () {
                setState(() {
                  isPerformanceExpanded = !isPerformanceExpanded;
                });
              },
              content: buildPerformanceContent(),
            ),
            buildExpandableItem(
              AppAssets.summaryIcon,
              'Todays Summary',
              isExpanded: isSummaryExpanded,
              onTap: () {
                setState(() {
                  isSummaryExpanded = !isSummaryExpanded;
                });
              },
              content: buildSummaryContent(),
            ),
            buildExpandableItem(
              AppAssets.contactIcon,
              'Contact Admin',
              expandable: false,
            ),
            buildExpandableItem(
              AppAssets.settingIcon,
              'Settings',
              isExpanded: isSettingsExpanded,
              onTap: () {
                setState(() {
                  isSettingsExpanded = !isSettingsExpanded;
                });
              },
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    'Change Password',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Log Out',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget buildProfileCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const CircleAvatar(
                  radius: 45.0,
                  backgroundImage: AssetImage('assets/your_image.png'),
                ),
                const SizedBox(height: 10),
                Text(
                  'ALEN JOHN',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '+91 234 567 8901',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  'Alenjohn@Gmail.Com',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                'Personal Details',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: InkWell(
                onTap: () {
                  pushNavigation(context, const EditProfilePage());
                },
                child: Image.asset(AppAssets.editIcon, width: 25, height: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
