import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

part 'song_event.dart';
part 'song_state.dart';

AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

List songs = [
  'assets/songs/Main_Tumhara.mp3',
  'assets/songs/Mast_Magan.mp3',
  'assets/songs/Imagine_Dragons.mp3',
];

class SongBloc extends Bloc<SongEvent, SongState> {
  SongBloc() : super(SongState(index: -1)) {
    on<SongEvent>((event, emit) {});

    on<onSongLoad>((event, emit) {
      emit(SongState(index: event.index));
      audioPlayer.open(
        Audio(songs[event.index]),
      );
    });

    on<onSongPlay>((event, emit) {
      emit(SongState(index: event.index));
      audioPlayer.playOrPause();
    });

    // on<onSongTime>((event, emit) {
    //   emit(SongState(index: event.index));
    //   print(event.time);
    //   audioPlayer.seekBy(event.time);
    // });

    on<onSongStop>((event, emit) {
      emit(SongState(index: -1));
      audioPlayer.pause();
    });
  }
}
