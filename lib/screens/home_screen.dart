import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamiapp/common/app_colors.dart';
import 'package:islamiapp/gen/assets.gen.dart';
import 'package:islamiapp/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islamiapp/tabs/quran_tabs/quran_tabs.dart';
import 'package:islamiapp/tabs/radio_tabs/radio_tab.dart';
import 'package:islamiapp/tabs/tasbeh_tabs/tasbeh_tab.dart';
import 'package:islamiapp/tabs/times_tabs/times_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [QuranTabs(), HadethTab(), TasbehTab(), RadioTab(),TimesTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },

        type: BottomNavigationBarType.fixed,

        backgroundColor: AppColors.goldColor,

        selectedItemColor: Colors.white,
        unselectedItemColor: AppColors.blackColor,

        showSelectedLabels: true,
        showUnselectedLabels: false,

        items: [
          buildBottomNavigationBarItem(
            Assets.images.sVGimages.quranicon,
            'Quran',
          ),

          buildBottomNavigationBarItem(
            Assets.images.sVGimages.hadeth,
            'Hadeth',
          ),

          buildBottomNavigationBarItem(
            Assets.images.sVGimages.tathbeh,
            'Tasbeh',
          ),
          buildBottomNavigationBarItem(Assets.images.sVGimages.radio, 'Rardio'),

          buildBottomNavigationBarItem(Assets.images.sVGimages.time, 'Time'),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
    String iconPath,
    String label,
  ) {
    return BottomNavigationBarItem(
      // Unselected icon
      icon: SvgPicture.asset(
        iconPath,
        width: 26,
        height: 26,
        colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn),
      ),

      // Selected icon
      activeIcon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.blackColor.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(60),
        ),
        child: SvgPicture.asset(
          iconPath,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),

      label: label,
    );
  }
}
