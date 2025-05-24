import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

Future<File> getCachedImageFile(String imageUrl) async {
  final cacheManager = DefaultCacheManager();

  final fileInfo = await cacheManager.getFileFromCache(imageUrl);

  if (fileInfo != null && fileInfo.file.existsSync()) {
    print("CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCfoundfileincache");
    return fileInfo.file;
  }
  print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRfiledownloaded");
  final downloadedFile = await cacheManager.getSingleFile(imageUrl);
  return downloadedFile;
}

Future<void> cacheLocalFileAsNetworkImage(File file, String url) async {
  final bytes = await file.readAsBytes();
  await DefaultCacheManager().putFile(url, bytes, fileExtension: 'jpg');
}
