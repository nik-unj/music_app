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

class onSongStop extends SongEvent {}
