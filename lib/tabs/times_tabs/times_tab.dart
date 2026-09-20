import 'package:flutter/material.dart';
import 'package:islamiapp/common/app_colors.dart';
import 'package:islamiapp/gen/assets.gen.dart';
import 'package:islamiapp/widgets/azkar_card.dart';

class TimesTab extends StatelessWidget {
  const TimesTab({super.key});

  static const prayers = [
    ('Sunrise', '05:04', 'AM'),
    ('Dhuhr', '01:01', 'PM'),
    ('ASR', '04:38', 'PM'),
    ('Maghrib', '07:57', 'PM'),
    ('Isha', '09:25', 'PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Screen background
          Image.asset(Assets.images.appimg.timebg.path, fit: BoxFit.cover),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(Assets.images.appimg.quranheader.path),
                  ),

                  const SizedBox(height: 22),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.goldColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('16 Jul\n2024', textAlign: TextAlign.center),
                            Text(
                              'Pray Time\nTuesday',
                              textAlign: TextAlign.center,
                            ),
                            Text('09 Muh\n1446', textAlign: TextAlign.center),
                          ],
                        ),

                        const SizedBox(height: 15),

                        // Prayer cards
                        SizedBox(
                          height: 92,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: prayers.length,
                            separatorBuilder: (_, __) {
                              return const SizedBox(width: 8);
                            },
                            itemBuilder: (_, index) {
                              final prayer = prayers[index];

                              return Container(
                                width: 67,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.blackColor.withValues(
                                        alpha: 0.7,
                                      ),
                                      AppColors.blackColor,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      prayer.$1,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),

                                    Text(
                                      prayer.$2,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                      ),
                                    ),

                                    Text(
                                      prayer.$3,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Next Pray - 02:32'),
                            SizedBox(width: 18),
                            Icon(Icons.volume_off, size: 19),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Azkar section
                  const Text(
                    'Azkar',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: AzkarCard(
                          imagePath: Assets.images.appimg.time1.path,
                          title: 'Evening Azkar',
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: AzkarCard(
                          imagePath: Assets.images.appimg.time2.path,
                          title: 'Morning Azkar',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
