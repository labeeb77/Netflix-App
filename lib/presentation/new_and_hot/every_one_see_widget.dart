import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/costurl/strings.dart';
import 'package:netflix/core/size/constsaize.dart';
import 'package:netflix/presentation/home/coutom_home_icon_widget.dart';

class EveryOneWatchingWidget extends StatelessWidget {
  const EveryOneWatchingWidget({
    Key? key,
    required this.bagroudimage,
    required this.descrption,
    required this.title,
  }) : super(key: key);
  final String bagroudimage;
  final String descrption;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        khight,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        khight,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            descrption,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        khight50,
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(
                '$imageAppendUrl$bagroudimage',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : const CircularProgressIndicator(),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.black26,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off_outlined,
                    color: kwhite,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            khight,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButtomWidget(
                icon: Icons.telegram_sharp,
                title: "Share",
                iconSize: 30,
                textSize: 15,
              ),
            ),
            kwidth20,
            CustomButtomWidget(
              icon: Icons.add,
              title: "My List",
              iconSize: 30,
              textSize: 15,
            ),
            kwidth20,
            CustomButtomWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 30,
              textSize: 15,
            ),
            kwidth20,
          ],
        )
      ],
    );
  }
}
