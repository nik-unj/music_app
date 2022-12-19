import 'package:flutter/material.dart';
import 'package:music/style/style.dart';
import 'package:music/widget/circleImage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/song_bloc.dart';
import '../screen/songScreen.dart';
import 'circleButton.dart';

class HorizontalTile extends StatefulWidget {
  final Map details;
  final int index;
  const HorizontalTile({Key? key, required this.details, required this.index})
      : super(key: key);

  @override
  State<HorizontalTile> createState() => _HorizontalTileState();
}

class _HorizontalTileState extends State<HorizontalTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SongScreen(details: widget.details, index: widget.index),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleImage(
                  imagePath: widget.details['artistImage'],
                  size: 65,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.details['title'],
                      style: whiteHeading(18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Color(0xff8C8C8C),
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "${widget.details['time'].toString()} min . Listening",
                          style: greyNormalText(15),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: BlocBuilder<SongBloc, SongState>(
                builder: (context, state) {
                  return CircleButton(
                    size: 40,
                    bgColor: Colors.white,
                    onTap: () {
                      if (state.index == widget.index) {
                        BlocProvider.of<SongBloc>(context).add(onSongStop());
                      } else {
                        BlocProvider.of<SongBloc>(context)
                            .add(onSongLoad(index: widget.index));
                      }
                    },
                    iconData: Icon(
                      state.index == widget.index
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.black,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
