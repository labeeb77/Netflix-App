import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

ValueNotifier<int> indexChangeNotifire = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifire,
      builder: (context, int newindex, _) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: newindex,
          onTap: (index) {
            indexChangeNotifire.value = index;
          },
          backgroundColor: backgroundColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.collections_outlined,
                ),
                label: 'New & Hot'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.emoji_emotions_outlined,
                ),
                label: 'FastLaughs'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.download_outlined,
                ),
                label: 'Downloads'),
          ],
        );
        ;
      },
    );
  }
}
