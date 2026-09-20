import 'package:flutter/material.dart';
import 'package:islamiapp/gen/assets.gen.dart';
import 'package:islamiapp/widgets/radio_station_card.dart';
import 'package:islamiapp/widgets/radio_tab_button.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int? playingIndex;
  int selectedTab = 0;

  final List<String> radioStations = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
  ];

  final List<String> reciters = [
    'Mahmoud Khalil Al-Husary',
    'Mohamed Siddiq Al-Minshawi',
    'Abdul Basit Abdus Samad',
    'Mishary Rashid Alafasy',
  ];

  List<String> get currentList {
    if (selectedTab == 0) {
      return radioStations;
    }

    return reciters;
  }

  void changeTab(int index) {
    setState(() {
      selectedTab = index;
      playingIndex = null;
    });
  }

  void playOrPause(int index) {
    setState(() {
      if (playingIndex == index) {
        playingIndex = null;
      } else {
        playingIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.images.appimg.rbg.path,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              children: [
                Image.asset(
                  Assets.images.appimg.quranheader.path,
                  width: double.infinity,
                  height: 135,
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          height: 48,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: RadioTabButton(
                                  title: 'Radio',
                                  selected: selectedTab == 0,
                                  onTap: () => changeTab(0),
                                ),
                              ),
                              Expanded(
                                child: RadioTabButton(
                                  title: 'Reciters',
                                  selected: selectedTab == 1,
                                  onTap: () => changeTab(1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.only(
                              bottom: 15,
                            ),
                            itemCount: currentList.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 12);
                            },
                            itemBuilder: (context, index) {
                              final bool isPlaying =
                                  playingIndex == index;

                              return RadioStationCard(
                                stationName: currentList[index],
                                isPlaying: isPlaying,
                                onPressed: () {
                                  playOrPause(index);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}