

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/common/app_colors.dart';
import 'package:islamiapp/gen/assets.gen.dart';
import 'package:islamiapp/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});
  static const String routeName = '/SurahDetails';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;

    if (ayat.isEmpty) loadSuraContent(suraModel.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(suraModel.suraNameEn),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.images.appimg.suradetilbg.path,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 50,
          children: [
            Center(
              child: Text(
                suraModel.suraNameAr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.goldColor,
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  RichText(
                    text: TextSpan(
                      children: 
                      List.generate(ayat.length, ((index) =>TextSpan(text: ayat[index]+'( ${index+1} )' ) ))
                      // ayat.map((e)=>TextSpan(text: e+ '*')).toList(),

                      
                      ,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.goldColor,
                        fontSize: 20,
                        height: 2,
                      ),
                      
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraContent(String id) async {
    String data = await rootBundle.loadString(
      'assets/suras/$id.txt',
    );
    ayat = data.trim().split('\n');
    setState(() {});
  }
}