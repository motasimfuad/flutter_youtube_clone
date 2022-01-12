import 'package:flutter_youtube_clone/data.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';

class HomeController extends GetxController {
  // ignore: unnecessary_cast
  Rx<Video?> selectedVideo = (null as Video?).obs;
  final miniplayerHeight = 60.0;
  MiniplayerController miniplayerController = MiniplayerController();

  setVideo(Video video) {
    selectedVideo.value = video;
    update();
  }

  removeVideo() {
    selectedVideo.value = null;
    update();
  }
}
