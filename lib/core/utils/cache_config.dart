import 'package:flutter_cache_manager/flutter_cache_manager.dart';

const reelCacheKey = "reelsCacheKey";
final cacheManager = CacheManager(
  Config(
    reelCacheKey,
    stalePeriod: const Duration(hours: 20),
    maxNrOfCacheObjects: 100,
    repo: JsonCacheInfoRepository(databaseName: reelCacheKey),
    fileService: HttpFileService(),
  ),
);
