import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/costurl/strings.dart';
import 'package:netflix/core/size/constsaize.dart';
import 'package:netflix/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final widgets = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: 'Downloads'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => widgets[index],
        separatorBuilder: (context, index) => const SizedBox(
          height: 25,
        ),
        itemCount: widgets.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<DownloadsBloc>(context)
            .add(const DownloadsEvent.getDownloadsImage());
      },
    );

    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kwhite,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        khight,
        const Text(
          'We will download a personalised\n selection of movies and shows\n for you, so there is always\n something to watch on\n your device',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.height / 2.2,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          radius: size.width * 0.4,
                        ),
                        DownloadsImageWidget(
                          imageList:
                              '$imageAppendUrl${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(left: 175, top: 50),
                          angle: 25,
                          size: Size(size.width * 0.35, size.width * 0.55),
                        ),
                        DownloadsImageWidget(
                          imageList:
                              '$imageAppendUrl${state.downloads[1].posterPath}',
                          margin: const EdgeInsets.only(right: 175, top: 50),
                          angle: -25,
                          size: Size(size.width * 0.35, size.width * 0.55),
                        ),
                        DownloadsImageWidget(
                          imageList:
                              '$imageAppendUrl${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(bottom: 15),
                          size: Size(size.width * 0.4, size.width * 0.64),
                          radius: 10,
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings_outlined,
          color: kwhite,
        ),
        kwidth,
        Text('Smart Downloads')
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: kBlue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(
                  color: kwhite,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: kwhite,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                color: backgroundColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    required this.margin,
    required this.size,
    this.radius = 10,
    this.angle = 0,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          // margin: margin,
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
