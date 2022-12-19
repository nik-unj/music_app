import 'package:flutter/material.dart';
import 'package:music/bloc/song_bloc.dart';
import 'package:music/style/style.dart';
import 'package:music/widget/circleButton.dart';
import 'package:music/widget/circleImage.dart';
import '../screen/songScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoundedTile extends StatefulWidget {
  final Map details;
  final int index;
  const RoundedTile({Key? key, required this.details, required this.index})
      : super(key: key);

  @override
  State<RoundedTile> createState() => _RoundedTileState();
}

class _RoundedTileState extends State<RoundedTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
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
        child: Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              image: DecorationImage(
                  image: NetworkImage(widget.details['coverImage']),
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3),
                          child: Text(
                            "Meditation",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                    color: greyShade(),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleImage(
                              imagePath: widget.details['artistImage'],
                              size: 55,
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
                        BlocBuilder<SongBloc, SongState>(
                          builder: (context, state) {
                            return CircleButton(
                              size: 40,
                              bgColor: Colors.white,
                              onTap: () {
                                if (state.index == widget.index) {
                                  BlocProvider.of<SongBloc>(context)
                                      .add(onSongStop());
                                } else {
                                  BlocProvider.of<SongBloc>(context)
                                      .add(onSongPlay(index: widget.index));
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
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
