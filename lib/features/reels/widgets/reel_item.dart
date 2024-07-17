import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reels_app/features/reels/widgets/reels_actions_widget.dart';
import 'package:reels_app/features/reels/widgets/reels_user_data.dart';
import 'package:video_player/video_player.dart';
import '../../../core/utils/cache_config.dart';

class ReelItem extends StatefulWidget {
  final String reel;
  final String? nextVideo;
  const ReelItem({super.key, required this.reel, this.nextVideo});

  @override
  _ReelItemState createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
    _cacheNextVideo();
  }

  Future<void> _initializeVideo() async {
    var fileInfo = await cacheManager.getFileFromCache(widget.reel);
    fileInfo ??= await cacheManager.downloadFile(widget.reel);
    _controller = VideoPlayerController.file(fileInfo.file)
      ..initialize().then((_) {
        setState(() {});
        _controller?.play();
        _controller?.setLooping(true);
      });
  }

  Future<void> _cacheNextVideo() async {
    if (widget.nextVideo != null) {
      var fileInfo = await cacheManager.getFileFromCache(widget.nextVideo!);
      fileInfo ??= await cacheManager.downloadFile(widget.nextVideo!);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        _controller != null && _controller!.value.isInitialized
            ? Center(
                child: AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: GestureDetector(
                      onTap: () {
                        _controller!.value.isPlaying
                            ? _controller?.pause()
                            : _controller?.play();
                      },
                      child: VideoPlayer(_controller!)),
                ),
              )
            : const Center(child: CircularProgressIndicator()),
        const ReelsActionsWidget(),
        const ReelsUserData(),
      ],
    );
  }
}
