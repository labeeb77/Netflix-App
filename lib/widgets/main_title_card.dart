import 'package:flutter/material.dart';
import 'package:netflix/core/size/constsaize.dart';
import 'package:netflix/domain/home/models/home_main_car_model.dart';
import 'package:netflix/widgets/main_card.dart';
import 'package:netflix/widgets/number_card_name_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({Key? key, required this.title, required this.result})
      : super(key: key);
  final String title;

  final List<ScrollImageHome> result;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: MainTitle(title: title),
        ),
        khight,
        LimitedBox(
          maxHeight: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              result.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: MainCards(imagUrl: result[index].bagroudimage),
              ),
            ),
          ),
        )
      ],
    );
  }
}
