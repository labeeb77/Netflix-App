import 'package:flutter/material.dart';
import 'package:netflix/infrastructure/hotandnew/every_one_wathing.dart';
import 'package:netflix/infrastructure/hotandnew/coming_soon.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/costurl/netflix_prifile_pitchure.dart';
import 'package:netflix/core/size/constsaize.dart';
import 'package:netflix/presentation/new_and_hot/comming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/every_one_see_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast_outlined,
                size: 30,
                color: kwhite,
              ),
              kwidth,
              Image.network(
                neflixprofile,
                width: 30,
                height: 30,
              ),
              kwidth,
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: backgroundColor,
              unselectedLabelColor: kwhite,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                color: kwhite,
                borderRadius: kRadius30,
              ),
              tabs: const [
                Tab(
                  text: "🍿 Coming Soon",
                ),
                Tab(
                  text: "👀 Everyone's Watching",
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            khight20,
            Expanded(
              child: TabBarView(children: [
                buildCommingSoon(),
                buildEveryoneWatching(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildEveryoneWatching() {
  return ValueListenableBuilder(
      valueListenable: resultEveryWatching,
      builder: (context, everyWatching, _) {
        return ListView.builder(
            itemCount: everyWatching.length,
            itemBuilder: (context, index) => everyWatching.isNotEmpty
                ? EveryOneWatchingWidget(
                    bagroudimage: everyWatching[index].bagroudimage,
                    descrption: everyWatching[index].descrption,
                    title: everyWatching[index].title,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ));
      });
}

Widget buildCommingSoon() {
  return ValueListenableBuilder(
    valueListenable: resultComingSoon,
    builder: (context, commingsoonWidget, _) {
      return ListView.builder(
        itemCount: commingsoonWidget.length,
        itemBuilder: (context, index) => commingsoonWidget.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CommingSoonWidget(
                description: commingsoonWidget[index].descrption,
                month: commingsoonWidget[index].relesedate,
                date: commingsoonWidget[index].relesedate,
                movieName: commingsoonWidget[index].title,
                bgimage: commingsoonWidget[index].bagroudimage,
              ),
      );
    },
  );
}
