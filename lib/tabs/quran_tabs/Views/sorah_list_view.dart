import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamiapp/gen/assets.gen.dart';
import 'package:islamiapp/models/sura_model.dart';
import 'package:islamiapp/tabs/quran_tabs/sura_details_screen.dart';

class SorahListView extends StatelessWidget {
  const SorahListView({
    super.key,
    required this.searchText,
    required this.addToMostRecent,
  });
  final String searchText;
  final void Function(int) addToMostRecent;

  @override
  Widget build(BuildContext context) {
    List<SuraModel> suras = SuraModel.allSuras;

    suras = suras
        .where(
          (element) =>
              element.suraNameAr.contains(searchText) ||
              element.suraNameEn.contains(searchText),
        )
        .toList(); // for (var i = 0; i < suras.length; i++) {
    //   suras[i].suraNameEn.contains(searchText);
    // }

    return suras.isEmpty
        ? Expanded(
            child: Center(
              child: Text(
                'No Surs Found',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Jannah",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sorah List",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Jannah",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    itemCount: suras.length,
                    itemBuilder: (context, index) =>
                        drawSurahTile(context, suras[index],index),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(color: Colors.white, endIndent: 44, indent: 44),
                  ),
                ),
              ],
            ),
          );
  }

  Widget drawSurahTile(BuildContext context, SuraModel suraModel ,index) {
    return ListTile(
      onTap: () {
        addToMostRecent(index);
        Navigator.of(
          context,
        ).pushNamed(SuraDetailsScreen.routeName, arguments: suraModel);
      },
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.all(0),
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(Assets.images.sVGimages.suraNumber),
          Text(
            (suraModel.id),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      title: Text(
        suraModel.suraNameEn,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        '${suraModel.ayasCount} Verses',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      trailing: Text(
        suraModel.suraNameAr,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
