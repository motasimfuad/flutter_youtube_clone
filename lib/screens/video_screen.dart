import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/screens/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    // final selectedVideo = controller.selectedVideo.value;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          controller.selectedVideo.value!.thumbnailUrl,
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        IconButton(
                          onPressed: () {
                            controller.miniplayerController
                                .animateToHeight(state: PanelState.MIN);
                          },
                          icon: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                    const LinearProgressIndicator(
                      value: 0.4,
                      // minHeight: 0.4,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
