import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/bloc/song_bloc.dart';
import 'package:music/widget/circleButton.dart';

import '../style/style.dart';

class SongScreen extends StatefulWidget {
  final Map details;
  final int index;

  const SongScreen({
    Key? key,
    required this.details,
    required this.index,
  }) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  @override
  void initState() {
    BlocProvider.of<SongBloc>(context).add(onSongLoad(index: widget.index));
    super.initState();
  }

  static String stringMinutesSeconds(int ms) {
    String data = '';
    Duration duration = Duration(milliseconds: ms);

    int minutes = duration.inMinutes;
    int seconds = (duration.inSeconds) - (minutes * 60);
    if (minutes <= 9) data += "0";
    data += "$minutes:";
    if (seconds <= 9) data += "0";
    data += seconds.toString();
    return data;
  } 

  static String doubleMinutesSeconds(int ms) {
    String data = '';
    Duration duration = Duration(milliseconds: ms);

    int minutes = duration.inMinutes;
    int seconds = (duration.inSeconds) - (minutes * 60);
    if (minutes <= 9) data += "0";
    data += "$minutes.";
    if (seconds <= 9) data += "0";
    data += seconds.toString();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              appBar(),
              coverImage(),
              Text(
                "Moel / Strength",
                style: greyNormalText(20),
              ),
              Text(
                widget.details['title'],
                style: const TextStyle(
                    fontSize: 40,
                    letterSpacing: 1,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              progressBar(),
              bottomButtons(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const SizedBox(
              height: 60,
              width: 60,
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: const Icon(
              Icons.bookmark,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget coverImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Container(
        height: height(context) > width(context)
            ? height(context) / 2.5
            : height(context) / 2,
        width: height(context) > width(context)
            ? height(context) / 2.5
            : height(context) / 2,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          child: Image.network(
            widget.details['coverImage'],
            fit: BoxFit.fill,
            filterQuality: FilterQuality.low,
          ),
        ),
      ),
    );
  }

  Widget progressBar() {
    return StreamBuilder(
      stream: audioPlayer.currentPosition,
      builder: (context, asyncSnapshot) {
        final Duration duration = asyncSnapshot.data ?? Duration.zero;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Slider(
                min: 0.0,
                max: double.parse(doubleMinutesSeconds(
                    audioPlayer.current.value?.audio.duration.inMilliseconds ??
                        0)),
                value:
                    double.parse(doubleMinutesSeconds(duration.inMilliseconds)),
                activeColor: Colors.black,
                inactiveColor: const Color(0xff8C8C8C),
                onChanged: (double value) {
                  // List time = value.toStringAsPrecision(3).split('.');
                  // if (value < 1) {
                  //   List data =
                  //       (int.parse(time[1]) * 60 / 1000).toString().split('.');
                  //   time[1] = data[0];
                  // } else {
                  //   List data =
                  //       (int.parse(time[1]) * 0.6).toString().split('.');
                  //   time[1] = data[0];
                  // }
                  // print(time);
                  // BlocProvider.of<SongBloc>(context).add(
                  //   onSongTime(
                  //     index: widget.index,
                  //     time: Duration(
                  //       minutes: int.parse(time[0]),
                  //       seconds: int.parse(time[1]),
                  //     ),
                  //   ),
                  // );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(stringMinutesSeconds(duration.inMilliseconds)),
                  Text(
                    stringMinutesSeconds(audioPlayer
                            .current.value?.audio.duration.inMilliseconds ??
                        0),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget bottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleButton(
          size: 40,
          bgColor: Colors.transparent,
          onTap: () {},
          iconData: Icon(
            Icons.skip_previous,
            size: 40,
            color: greyShade(),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        BlocBuilder<SongBloc, SongState>(
          builder: (context, state) {
            return CircleButton(
              size: 80,
              bgColor: Colors.black,
              onTap: () async {
                if (state.index == widget.index) {
                  BlocProvider.of<SongBloc>(context).add(onSongStop());
                } else {
                  BlocProvider.of<SongBloc>(context)
                      .add(onSongPlay(index: widget.index));
                }
              },
              iconData: Icon(
                widget.index == state.index ? Icons.pause : Icons.play_arrow,
                size: 50,
                color: Colors.white,
              ),
            );
          },
        ),
        const SizedBox(
          width: 10,
        ),
        CircleButton(
          size: 40,
          bgColor: Colors.transparent,
          onTap: () {},
          iconData: Icon(
            Icons.skip_next,
            size: 40,
            color: greyShade(),
          ),
        )
      ],
    );
  }
}
