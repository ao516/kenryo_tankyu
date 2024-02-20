// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
//
// ImageProvider? _image;
// bool _isImageLoaded = false;
//
// Future<void> _downloadImage(String url) async {
//   if (!_isImageLoaded) {
//   // Firebase Storage上の画像のURLを取得
//   String downloadURL = await FirebaseStorage.instance.ref(url).getDownloadURL();
//   // URLから画像を取得
//   final imgProvider = CachedNetworkImageProvider(downloadURL);
//   setState(() {
//   _image = imgProvider;
//   _isImageLoaded = true;
//   });
// }
// }