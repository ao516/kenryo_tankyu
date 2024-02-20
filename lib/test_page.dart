// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
//
// ImageProvider? _image;
// bool _isImageLoaded = false;
//
// class FireStoreDataBase {
//   String? downloadURL;
//   Future getData() async {
//     try {
//       await downloadURLExample();
//       return downloadURL;
//     } catch (e) {
//       debugPrint("error - $e");
//       return null;
//     }
//   }
//
//   Future<void> downloadURLExample() async {
//     downloadURL = await FirebaseStorage.instance
//         .ref()
//         .child('example.png')
//         .getDownloadURL();
//     debugPrint(downloadURL.toString());
//   }
// }
//
// class TestPage extends StatefulWidget {
//   const TestPage({super.key});
//
//   @override
//   State<TestPage> createState() => _TestPageState();
// }
//
// class _TestPageState extends State<TestPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: FutureBuilder(
//         future: FireStoreDataBase().getData(),
//         builder: (context,snapshot){
//           if(snapshot.hasError){
//             return const Text(
//               "エラー発生"
//             );
//           }
//           if(snapshot.connectionState == ConnectionState.done){
//             return Image.network(snapshot.data.toString());
//           }
//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
