import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reels_app/features/reels/data/model/reels_model.dart';
import '../../../../core/networking/api_paths.dart';
import '../../../../core/networking/api_service.dart';

class ReelsRepository {
  static Future<List<Reel>> getReels() async {
    try {
      final Response<dynamic> response =
          await ApiService.getApi(ApiPaths.getReels);
      debugPrint("getReels response: ${response.data["data"]}");
      if (response.statusCode! < 300) {
        final reels = (response.data["data"] as List?)
                ?.map((e) => Reel.fromJson(e))
                .toList() ??
            [];
        return reels;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}
