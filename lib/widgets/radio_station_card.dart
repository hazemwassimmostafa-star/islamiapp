import 'package:flutter/material.dart';
import 'package:islamiapp/common/app_colors.dart';
import 'package:islamiapp/gen/assets.gen.dart';

class RadioStationCard extends StatelessWidget {
  final String stationName;
  final bool isPlaying;
  final VoidCallback onPressed;

  const RadioStationCard({
    super.key,
    required this.stationName,
    required this.isPlaying,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.35,
              child: Image.asset(
                isPlaying
                    ? Assets.images.appimg.soundwave.path
                    : Assets.images.appimg.mosqradio.path,
                width: double.infinity,
                height: 70,
                fit: BoxFit.fill,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                stationName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.black,
                      size: 38,
                    ),
                  ),
                  Icon(
                    isPlaying ? Icons.volume_off : Icons.volume_up,
                    color: Colors.black,
                    size: 28,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}