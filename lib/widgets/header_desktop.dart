import 'package:flutter/material.dart';
import 'package:sami_4th_task/widgets/site_logo.dart';
import 'package:sami_4th_task/constants/nav_items.dart';
import 'package:sami_4th_task/constants/colors.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: CustomColor.bgLight1,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SiteLogo(onTap: () {}),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 30), // More spacing
              child: InkWell(
                onTap: () {
                  onNavMenuTap(i);
                },
                child: Text(
                  navTitles[i],
                  style: TextStyle(
                    fontSize: 18, // Larger font for better readability
                    fontWeight: FontWeight.bold, // Bold text
                    color: CustomColor.whitePrimary, // Text color
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
