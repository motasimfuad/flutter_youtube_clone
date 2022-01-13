import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/data.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';

class HomeController extends GetxController {
  // ignore: unnecessary_cast
  Rx<Video?> selectedVideo = (null as Video?).obs;
  final miniplayerHeight = 60.0;
  MiniplayerController miniplayerController = MiniplayerController();
  ScrollController? scrollController;
}
