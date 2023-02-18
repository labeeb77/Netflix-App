import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/size/constsaize.dart';
import 'package:netflix/widgets/netflix-profile.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.cast_outlined,
          color: kwhite,
          size: 30,
        ),
        kwidth,
        const NetflixProfile(),
        kwidth,
      ],
    );
  }
}
