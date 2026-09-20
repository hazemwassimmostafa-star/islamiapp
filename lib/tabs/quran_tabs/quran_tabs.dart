import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiapp/common/app_colors.dart';
import 'package:islamiapp/data/caching_keys.dart';
import 'package:islamiapp/gen/assets.gen.dart';
import 'package:islamiapp/tabs/quran_tabs/Views/most_recent.dart';
import 'package:islamiapp/tabs/quran_tabs/Views/sorah_list_view.dart';
import 'package:islamiapp/widgets/tab_bgwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTabs extends StatefulWidget {
  const QuranTabs({super.key});
  @override
  State<QuranTabs> createState() => _QuranTabsState();
}

class _QuranTabsState extends State<QuranTabs> {
  String searchText = '';
  List<int> mostRecentindices = [];
  late SharedPreferences pref;
  @override
  void initState() {
    super.initState();
    readMostRecent();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        QtabbgWidget(imagePath: Assets.images.appimg.quranbg.path),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(Assets.images.appimg.quranheader.path),
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Jannah",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.blackColor.withValues(alpha: 0.7),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14),
                      child: SvgPicture.asset(
                        Assets.images.sVGimages.quranicon,
                        width: 18,
                        height: 18,
                        colorFilter: ColorFilter.mode(
                          AppColors.goldColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),

                    hint: Text(
                      'Search Surah',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Jannah",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.goldColor),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.goldColor),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.goldColor),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                if (mostRecentindices.isNotEmpty) ...[
                  MostRecentViews(mostRecentindiceies: mostRecentindices),
                  SizedBox(height: 20),
                ],
                SorahListView(
                  searchText: searchText,
                  addToMostRecent: addToMostRecent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> addToMostRecent(int index) async {
    pref = await SharedPreferences.getInstance();

    if (mostRecentindices.contains(index)) {
      mostRecentindices.remove(index);
    }

    mostRecentindices.insert(0, index);

    if (mostRecentindices.length > 5) {
      mostRecentindices.removeLast();
    }

    final List<String> strIndex = mostRecentindices
        .map((e) => e.toString())
        .toList();

    await pref.setStringList(CachingKeys.MostRecent, strIndex);

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> readMostRecent() async {
    pref = await SharedPreferences.getInstance();

    final List<String> strIndex =
        pref.getStringList(CachingKeys.MostRecent) ?? [];

    mostRecentindices = strIndex.map((e) => int.parse(e)).toList();

    if (mounted) {
      setState(() {});
    }
  }
}
