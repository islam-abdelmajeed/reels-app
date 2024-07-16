import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/cubit/reels_cubit.dart';
import 'widgets/reel_item.dart';

class ReelsScreen extends StatefulWidget {
  @override
  _ReelsScreenState createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<ReelsCubit>().fetchReels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reels', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<ReelsCubit, ReelsState>(
        builder: (context, state) {
          ReelsCubit cubit = context.read();
          return state is GetReelsLoadingState
              ? const Center(child: CircularProgressIndicator())
              : state is GetReelsErrorState
                  ? Center(child: Text("Something went wrong, ${state.error}"))
                  : PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.vertical,
                      itemCount: cubit.reels.length,
                      itemBuilder: (context, index) {
                        final nextVideoUrl = index + 1 < cubit.reels.length
                            ? cubit.reels[index + 1].video
                            : null;
                        return ReelItem(
                          reel: cubit.reels[index].video!,
                          nextVideo: nextVideoUrl,
                        );
                      },
                    );
        },
      ),
    );
  }
}
