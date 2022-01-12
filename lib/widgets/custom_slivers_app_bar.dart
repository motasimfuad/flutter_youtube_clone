import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/data.dart';

class CustomSliversAppBar extends StatelessWidget {
  const CustomSliversAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.asset('assets/yt_logo_dark.png'),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.cast_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            radius: 15,
            foregroundImage: NetworkImage(currentUser.profileImageUrl),
          ),
        ),
      ],
    );
  }
}
