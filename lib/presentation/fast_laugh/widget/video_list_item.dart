import 'package:flutter/material.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/costurl/strings.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedwidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedwidget({
    super.key,
    required this.widget,
    required this.movieData,
  }) : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedwidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedwidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedwidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedwidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(
      children: [
        //left side
        FstLaughVideoPlayer(onStateChanged: (bool) {}, videoUrl: videoUrl),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black26,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off_outlined,
                      color: kwhite,
                      size: 30,
                    ),
                  ),
                ),

                ///right side
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendUrl$posterPath'),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosNotifier,
                      builder: (BuildContext context, Set<int> newLikedListIds,
                          Widget? _) {
                        final _index = index;
                        if (newLikedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(UnlikeVideo(id: _index));
                              likedVideosNotifier.value.remove(_index);
                              likedVideosNotifier.notifyListeners();
                            },
                            child: const VideoActionsWidget(
                              icon: Icons.favorite_outline,
                              title: 'Liked',
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            // BlocProvider.of<FastLaughBloc>(context)
                            //     .add(LikeVideo(id: _index));
                            likedVideosNotifier.value.add(_index);
                            likedVideosNotifier.notifyListeners();
                          },
                          child: const VideoActionsWidget(
                            icon: Icons.emoji_emotions_outlined,
                            title: 'LOL',
                          ),
                        );
                      },
                    ),
                    const VideoActionsWidget(
                      icon: Icons.add,
                      title: 'My List',
                    ),
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedwidget.of(context)
                                ?.movieData
                                .posterPath;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: const VideoActionsWidget(
                        icon: Icons.telegram_sharp,
                        title: 'Share',
                      ),
                    ),
                    const VideoActionsWidget(
                      icon: Icons.play_arrow,
                      title: 'Play',
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Column(
        children: [
          Icon(
            icon,
            color: kwhite,
            size: 40,
          ),
          Text(
            title,
            style: const TextStyle(
              color: kwhite,
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }
}

class FstLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FstLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FstLaughVideoPlayer> createState() => _FstLaughVideoPlayerState();
}

class _FstLaughVideoPlayerState extends State<FstLaughVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    videoPlayerController.initialize().then((value) {
      setState(() {});
      videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: VideoPlayer(videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
