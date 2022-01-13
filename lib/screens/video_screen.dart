import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/data.dart';
import 'package:flutter_youtube_clone/screens/home/home_controller.dart';
import 'package:flutter_youtube_clone/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    controller.scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedVideo = controller.selectedVideo.value;
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.miniplayerController
              .animateToHeight(state: PanelState.MAX);
        },
        child: Scaffold(
          // backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: CustomScrollView(
                controller: controller.scrollController,
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        ),
                        VideoInfo(
                            video: controller.selectedVideo.value as Video)
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final video = suggestedVideos[index];
                        return VideoCard(
                          video: video,
                          hasPadding: true,
                          onTap: () {
                            controller.scrollController?.animateTo(0,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          },
                        );
                      },
                      childCount: suggestedVideos.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
