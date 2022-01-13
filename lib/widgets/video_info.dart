import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/data.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoInfo extends StatelessWidget {
  final Video video;
  const VideoInfo({
    required this.video,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),
          ),
          const SizedBox(height: 8),
          Text(
            '${video.viewCount} views • ${timeago.format(video.timestamp)}',
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
          ),
          const Divider(),
          _ActionsRow(video: video),
          const Divider(),
          _AuthorInfo(user: video.author),
        ],
      ),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  Video video;
  _ActionsRow({required this.video, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildAction(
          context: context,
          icon: Icons.thumb_up_outlined,
          label: video.likes,
          onpressed: () {},
        ),
        _buildAction(
          context: context,
          icon: Icons.thumb_down_outlined,
          label: 'Dislike',
          onpressed: () {},
        ),
        _buildAction(
          context: context,
          icon: Icons.reply_outlined,
          label: 'Share',
          onpressed: () {},
        ),
        _buildAction(
          context: context,
          icon: Icons.download,
          label: 'Download',
          onpressed: () {},
        ),
        _buildAction(
          context: context,
          icon: Icons.add_to_photos_outlined,
          label: 'Save',
          onpressed: () {},
        ),
      ],
    );
  }

  Widget _buildAction({
    required context,
    required Function() onpressed,
    required IconData icon,
    required String label,
  }) {
    return GestureDetector(
      onTap: onpressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(height: 6),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  final User user;
  const _AuthorInfo({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          foregroundImage: NetworkImage(user.profileImageUrl),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  user.username,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15),
                ),
              ),
              Flexible(
                child: Text(
                  '${user.subscribers} subscriber',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'SUBSCRIBE',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
