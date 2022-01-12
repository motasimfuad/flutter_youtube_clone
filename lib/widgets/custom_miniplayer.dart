import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/screens/home/home_controller.dart';
import 'package:get/get.dart';

class CustomMiniplayer extends StatelessWidget {
  CustomMiniplayer({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // print(
                      //     'On mini player: ${controller.selectedVideo.value!.title}');
                    },
                    child: Image.network(
                      controller.selectedVideo.value!.thumbnailUrl,
                      fit: BoxFit.cover,
                      width: 120.0,
                      height: controller.miniplayerHeight - 4.0,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              controller.selectedVideo.value!.title,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              controller.selectedVideo.value!.author.username,
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.selectedVideo.value = null;
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              const LinearProgressIndicator(
                value: 0.4,
                // minHeight: 0.4,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              )
            ],
          ),
        ));
  }
}
