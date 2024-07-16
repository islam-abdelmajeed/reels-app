part of 'reels_cubit.dart';

sealed class ReelsState {}

final class ReelsInitial extends ReelsState {}

// Get Reels States
class GetReelsLoadingState extends ReelsState {}

class GetReelsSuccessState extends ReelsState {}

class GetReelsErrorState extends ReelsState {
  final String error;
  GetReelsErrorState(this.error);
}
