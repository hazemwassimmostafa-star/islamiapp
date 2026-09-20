import 'package:islamiapp/data/surha_names.dart';

class SuraModel {
  final String id;
  final String suraNameAr;
  final String suraNameEn;
  final String ayasCount;
  SuraModel({
    required this.suraNameAr,
    required this.suraNameEn,
    required this.ayasCount,
    required this.id,
  });

  static List<SuraModel> get allSuras {
    List<SuraModel> dataList = [];

    for (int i = 0; i < SurhaData.arabicQAuranSuras.length; i++) {
      SuraModel obj = SuraModel(
        ayasCount: SurhaData.ayaNumber[i],
        id: (1 + i).toString(),
        suraNameAr: SurhaData.arabicQAuranSuras[i],
        suraNameEn: SurhaData.englishQuranSurahs[i],
      );
      dataList.add(obj);
    }
    return dataList;
  }
}
