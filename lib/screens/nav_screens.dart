import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/data.dart';
import 'package:flutter_youtube_clone/screens/home/home_controller.dart';
import 'package:flutter_youtube_clone/screens/home/home_screen.dart';
import 'package:flutter_youtube_clone/screens/video_screen.dart';
import 'package:flutter_youtube_clone/widgets/custom_miniplayer.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';

class NavScreens extends StatefulWidget {
  const NavScreens({Key? key}) : super(key: key);

  @override
  State<NavScreens> createState() => _NavScreensState();
}

class _NavScreensState extends State<NavScreens> {
  var controller = Get.put(HomeController());
  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    const Scaffold(body: Center(child: Text('Stories'))),
    const Scaffold(body: Center(child: Text('Add'))),
    const Scaffold(body: Center(child: Text('Subs'))),
    const Scaffold(body: Center(child: Text('Library'))),
  ];

  @override
  Widget build(BuildContext context) {
    var selectedVideo = controller.selectedVideo.value;
    return Obx(() => Scaffold(
          body: Stack(
            children: _screens
                .asMap()
                .map(
                  (i, screen) => MapEntry(
                    i,
                    Offstage(
                      offstage: _selectedIndex != i,
                      child: screen,
                    ),
                  ),
                )
                .values
                .toList()
              ..add(
                Offstage(
                  // ignore: unnecessary_null_comparison,
                  offstage: controller.selectedVideo.value == null,
                  child: Miniplayer(
                    controller: controller.miniplayerController,
                    minHeight: controller.miniplayerHeight,
                    maxHeight: MediaQuery.of(context).size.height,
                    builder: (height, percentage) {
                      if (controller.selectedVideo.value == null) {
                        return const SizedBox.shrink();
                      } else {
                        return (height <= controller.miniplayerHeight + 50.0)
                            ? CustomMiniplayer()
                            : const VideoScreen();
                      }
                    },
                  ),
                ),
              ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            onTap: (i) {
              setState(() {
                _selectedIndex = i;
              });
              if (controller.selectedVideo.value != null) {
                controller.miniplayerController
                    .animateToHeight(state: PanelState.MIN);
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                activeIcon: Icon(Icons.add_circle),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions_outlined),
                activeIcon: Icon(Icons.subscriptions),
                label: 'Subscriptions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_library_outlined),
                activeIcon: Icon(Icons.video_library),
                label: 'Library',
              ),
            ],
          ),
        ));
  }
}
