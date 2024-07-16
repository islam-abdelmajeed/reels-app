import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../../../core/utils/cache_config.dart';
import '../../data/model/reels_model.dart';
import '../../data/repo/reels_repo.dart';

part 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  ReelsCubit() : super(ReelsInitial());

  List<Reel> reels = [];
  void fetchReels() async {
    emit(GetReelsLoadingState());
    try {
      reels = await ReelsRepository.getReels();
      emit(GetReelsSuccessState());
    } catch (e) {
      emit(GetReelsErrorState(e.toString()));
    }
  }
}
