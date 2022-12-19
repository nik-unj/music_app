part of 'song_bloc.dart';

@immutable
abstract class SongEvent {}

class onSongLoad extends SongEvent {
  int index;

  onSongLoad({
    required this.index,
  });
}

class onSongPlay extends SongEvent {
  int index;

  onSongPlay({
    required this.index,
  });
}

// class onSongTime extends SongEvent {
//   int index;
//   Duration time;

//   onSongTime({
//     required this.index,
//     required this.time,
//   });
// }

class onSongStop extends SongEvent {}
