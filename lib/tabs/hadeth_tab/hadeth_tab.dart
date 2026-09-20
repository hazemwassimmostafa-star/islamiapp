import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/common/app_colors.dart';
import 'package:islamiapp/gen/assets.gen.dart';
import 'package:islamiapp/gen/fonts.gen.dart';
import 'package:islamiapp/models/hadeeth_model.dart';
import 'package:islamiapp/widgets/tab_bgwidget.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}
bool isLoading = true;
final List<HadeethModel > ahadeth = [];
class _HadethTabState extends State<HadethTab> {

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) loadHadeeth();

    return Stack(
      fit: StackFit.expand,
      children: [
        QtabbgWidget(
          imagePath: Assets.images.appimg.hadethbg.path,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.appimg.quranheader.path,
              ),
              SizedBox(height: 30),
              if(isLoading)
              CircularProgressIndicator()
              else
              Expanded(
                child: LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    return CarouselSlider.builder(
                      itemCount: ahadeth.length,
                      options: CarouselOptions(
                        height: constraints.maxHeight,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      itemBuilder: (context, index, realIndex) => Card(
                        color: AppColors.goldColor,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                Assets.images.appimg.hadethcard.path,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 50.0,
                                  bottom: 60,
                                  left: 20,
                                  right: 20,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      textDirection: TextDirection.rtl,
                                      ahadeth[index].hadethName ?? "",
                                      style: TextStyle(
                                        
                                        fontSize: 24,
                                        fontFamily: FontFamily.jannah,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Text(
                                          textAlign: TextAlign.center,

                                          ahadeth[index].content.join("\n"),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: FontFamily.jannah,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> loadHadeeth() async {
    for (int i = 1; i <= 50; i++) {
      String hadeeth = await rootBundle.loadString("assets/Hadeeth/h$i.txt");

      hadeeth = hadeeth.trim();

      List<String> splitedHadeth = hadeeth.split('\n');

      ahadeth.add(
        HadeethModel( hadethName: splitedHadeth[0],content: splitedHadeth.sublist(1) ,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }
}