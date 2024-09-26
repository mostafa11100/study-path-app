import 'package:flutter/material.dart';
import 'package:smart_player/video_player_page.dart';
import 'package:pod_player/pod_player.dart';

// Widget videoplayer(url, context) {
//   return SizedBox(
//     //height: 320,
//     width: MediaQuery.of(context).size.width,
//     child: SmartPlayer(
//       url: url,
//     ),
//   );
// }

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.url});
  final String url;
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final PodPlayerController controller;
  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(
        widget.url,
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: PodVideoPlayer(
        controller: controller,
      ),
    );
  }
}
