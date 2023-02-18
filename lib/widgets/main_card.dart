import 'package:flutter/material.dart';
import 'package:netflix/core/costurl/strings.dart';
import 'package:netflix/core/size/constsaize.dart';

class MainCards extends StatelessWidget {
  const MainCards({
    Key? key,
    required this.imagUrl,
  }) : super(key: key);
  final String imagUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            '$imageAppendUrl$imagUrl',
          ),
        ),
      ),
    );
  }
}
