import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_assets.dart';
import 'package:supermarket_deliveryagent_fe/core/theme/app_colors.dart';
import 'package:supermarket_deliveryagent_fe/core/utils/navigations.dart';
import 'package:supermarket_deliveryagent_fe/widgets/yellow_button.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfilePage> {
  final _nameController = TextEditingController(text: '');
  final _numberController = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _dobController = TextEditingController(text: '');

  String selectedIdType = 'Passport';
  String uploadedFileName = 'img.jpg';

  Future<void> _selectDate() async {
    DateTime initialDate = DateTime.now();
    if (_dobController.text.isNotEmpty) {
      try {
        initialDate = DateFormat("dd/MM/yyyy").parse(_dobController.text);
      } catch (e) {}
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat("dd/MM/yyyy").format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          backgroundColor: AppColors.appbarColor,
          centerTitle: false,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: GestureDetector(
              onTap: () {
                popNavigation(context);
              },
              child: Image.asset(AppAssets.arrowbackIcon),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'Edit Profile',
              style: GoogleFonts.inter(
                fontSize: 20,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.lightGreyColor,
                          child: Icon(
                            Icons.person,
                            size: 90,
                            color: AppColors.darkgrey,
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.grey,
                            child: Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    buildLabeledTextField("Name", _nameController),
                    buildLabeledTextField("Number", _numberController),
                    buildLabeledTextField("Email", _emailController),
                    Row(
                      children: [
                        Expanded(
                          child: buildLabeledTextField(
                            "Dob",
                            _dobController,
                            enabled: false,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.calendar_today,
                              color: AppColors.darkgrey,
                            ),
                            onPressed: _selectDate,
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ID",
                            style: GoogleFonts.inter(
                              color: AppColors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 48,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.green),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: selectedIdType,
                                      isExpanded: true,
                                      items: const [
                                        DropdownMenuItem(
                                          value: "Passport",
                                          child: Text("Passport"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Aadhar",
                                          child: Text("Aadhar"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Driving License",
                                          child: Text("Driving License"),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        if (value != null) {
                                          setState(() {
                                            selectedIdType = value;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  height: 48,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.mintGreen,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(uploadedFileName),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            uploadedFileName = '';
                                          });
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          size: 18,
                                          color: AppColors.darkgrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Recommended size: 800x800 pixels, PNG or JPG format",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomYellowButton(
              label: 'Save',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLabeledTextField(
    String label,
    TextEditingController controller, {
    bool enabled = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              color: AppColors.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            enabled: enabled,
            cursorColor: AppColors.primaryColor,
            style: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}
