import 'package:flutter/material.dart';
import 'package:islamiapp/common/app_colors.dart';
import 'package:islamiapp/gen/assets.gen.dart';
import 'package:islamiapp/models/sura_model.dart';

class MostRecentViews extends StatelessWidget {
  List<int> mostRecentindiceies = [];
  MostRecentViews({super.key, required this.mostRecentindiceies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Most Recently",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Jannah",
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 150,

          child: ListView.builder(
            itemCount: mostRecentindiceies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              int suraIndex =mostRecentindiceies[index];
                SuraModel sura = SuraModel.allSuras[suraIndex];
              return Card(
              
                margin: EdgeInsets.symmetric(horizontal: 5),
                color: AppColors.goldColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Text(
                            sura.suraNameEn,
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: "Jannah",
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            sura.suraNameAr,
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: "Jannah",
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                         "${sura.ayasCount} Versses" ,
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: "Jannah",
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        Assets.images.appimg.mostrecent.path,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
