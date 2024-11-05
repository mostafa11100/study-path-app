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

class VideoPlayercustom extends StatefulWidget {
  const VideoPlayercustom(
      {super.key, required this.url, required this.controller});
  final String url;
  final PodPlayerController controller;
  @override
  State<VideoPlayercustom> createState() => _VideoPlayerState();
}

//    controller.changeVideo(playVideoFrom: PlayVideoFrom.network());
class _VideoPlayerState extends State<VideoPlayercustom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: PodVideoPlayer(
        controller: widget.controller,
      ),
    );
  }
}
