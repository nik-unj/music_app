import 'package:flutter/material.dart';
import 'package:music/style/style.dart';
import 'package:music/widget/horizonatlTile.dart';
import 'package:music/widget/roundedTile.dart';
import '../widget/circleImage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List songs = [
    {
      'coverImage':
          'https://tse3.mm.bing.net/th?id=OIP.vtv-1u1Pw8B2Xenp-QQhEwHaEK&pid=Api&P=0',
      'artistImage':
          'https://tse2.mm.bing.net/th?id=OIP.hAi90pK69K-wDxKVqdEExwHaE8&pid=Api&P=0',
      'title': 'Main Tumhara',
      'time': 20
    },
    {
      'coverImage':
          'https://1.bp.blogspot.com/-BRVcMyfCsN0/XwsDWZ7RNHI/AAAAAAAAALY/XG3AkT-cmI0f4a2FzRozLpQDRN_1J0Q6gCLcBGAsYHQ/s1600/mm%2Bcp.jpg',
      'artistImage':
          'https://tse3.mm.bing.net/th?id=OIP.kshKbZCfxkDHBHxW_Qwh-AHaEK&pid=Api&P=0',
      'title': 'Mast Magan',
      'time': 7
    },
    {
      'coverImage':
          'https://tse2.mm.bing.net/th?id=OIP.7XClzgvC3ivz6N-oFnXMWwHaHa&pid=Api&P=0',
      'artistImage':
          'https://tse2.mm.bing.net/th?id=OIP.nyxgrHVBP7kqo9sSTa4cPwHaEK&pid=Api&P=0',
      'title': 'Imagine Dragons',
      'time': 15
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar(),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20),
                child: Text(
                  "Hi, Nikunj",
                  style: greyNormalText(20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20),
                child: Text(
                  "Week's podcasts",
                  style: whiteHeading(40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: searchBar(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: songs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RoundedTile(details: songs[index], index: index);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: recommendationList(songs),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget searchBar() {
  return Container(
    decoration: BoxDecoration(
      color: greyShade(),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        bottomLeft: Radius.circular(15),
      ),
    ),
    child: TextField(
      autofocus: false,
      style: greyNormalText(20),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Search",
        hintStyle: greyNormalText(20),
        fillColor: greyShade(),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.white,
          size: 30,
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
        const CircleImage(
          imagePath:
              'https://tse1.mm.bing.net/th?id=OIP.EYHt8f5tqkTU5l6szP5XbQHaE8&pid=Api&P=0',
          size: 60,
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: greyShade(),
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: const Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    ),
  );
}

Widget recommendationList(List songs) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: greyShade(),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Your recommendations",
              style: whiteHeading(25),
            ),
          ),
          HorizontalTile(details: songs[0], index: 0),
          HorizontalTile(details: songs[1], index: 1),
          HorizontalTile(details: songs[2], index: 2),
        ],
      ),
    ),
  );
}
