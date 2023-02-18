import 'package:flutter/material.dart';
import 'package:netflix/core/costurl/strings.dart';
import 'package:netflix/presentation/home/coutom_home_icon_widget.dart';
import 'package:netflix/presentation/home/screen_home.dart';

class HomeFirstContainer extends StatelessWidget {
  const HomeFirstContainer({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                '$imageAppendUrl$imageUrl',
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtomWidget(icon: Icons.add, title: "My List"),
                playButton(),
                const CustomButtomWidget(
                  icon: Icons.info_outline,
                  title: "Info",
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
