import 'package:crice_hospital_app/ui/screens/youtube_player/youtube_video_player_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeView extends StatelessWidget {
  String url, title;
  YoutubeView({this.url, this.title});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller;
    print(url);

    return ViewModelBuilder<YoutubeViewModel>.reactive(
      builder: (context, model, child) {
        return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: controller = YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(url),
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  isLive: false,
                  enableCaption: false,
                ),
              ),
            ),
            builder: (context, player) {
              return SafeArea(
                top: true,
                child: Scaffold(
                  appBar: AppBar(
                    leading: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.keyboard_backspace_rounded,
                          color:Colors.white,
                        )
                    ),
                    title: Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    centerTitle: true,
                  ),
                  body: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: player,
                  ),
                ),
              );
            });
      },
      viewModelBuilder: () => YoutubeViewModel(),
    );
  }
}
