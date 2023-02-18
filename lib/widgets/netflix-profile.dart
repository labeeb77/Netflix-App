import 'package:flutter/material.dart';
import 'package:netflix/core/costurl/netflix_prifile_pitchure.dart';

class NetflixProfile extends StatelessWidget {
  const NetflixProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
      ),
      child: Image.network(
        neflixprofile,
        width: 30,
      ),
    );
  }
}
