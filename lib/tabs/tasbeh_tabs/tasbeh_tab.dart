import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiapp/gen/assets.gen.dart';
import 'package:islamiapp/widgets/tab_bgwidget.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int tasbehCount = 0;
  int currentTasbehIndex = 0;
  double turns = 0;

  final List<String> tasbehList = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          QtabbgWidget(imagePath: Assets.images.appimg.tasbehbg.path),

          SafeArea(
            child: Column(
              children: [
               
                Image.asset(
                  Assets.images.appimg.quranheader.path,
                  width: double.infinity,
                  height: 135,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 10),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Jannah',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double sebhaSize = constraints.maxWidth - 30;

                      if (sebhaSize > constraints.maxHeight) {
                        sebhaSize = constraints.maxHeight;
                      }

                      return Center(
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: increaseTasbeh,
                          child: SizedBox.square(
                            dimension: sebhaSize,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                AnimatedRotation(
                                  turns: turns,
                                  duration: const Duration(milliseconds: 250),
                                  curve: Curves.easeOut,
                                  alignment: Alignment.center,
                                  child: SizedBox.square(
                                    dimension: sebhaSize,
                                    child: SvgPicture.asset(
                                      Assets.images.sVGimages.sebha,

                                      fit: BoxFit.contain,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),

                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 250,
                                      ),
                                      child: Text(
                                        tasbehList[currentTasbehIndex],
                                        key: ValueKey(currentTasbehIndex),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Jannah',
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      '$tasbehCount',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Jannah',
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void increaseTasbeh() {
    setState(() {
      if (tasbehCount == 30) {
        tasbehCount = 1;
        currentTasbehIndex++;

        if (currentTasbehIndex == tasbehList.length) {
          currentTasbehIndex = 0;
        }
      } else {
        tasbehCount++;
      }

      turns += 1 / 30;
    });
  }
}
