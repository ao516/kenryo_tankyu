import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class FireStoreDataBase {
  String? downloadURL;
  Future getData() async {
    try {
      await downloadURLExample();
      return downloadURL;
    } catch (e) {
      debugPrint("error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample() async {
    downloadURL = await FirebaseStorage.instance
        .ref()
        .child('example.png')
        .getDownloadURL();
    debugPrint(downloadURL.toString());
  }
}


class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: FireStoreDataBase().getData(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return const Text(
                "エラー発生"
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return Image.network(snapshot.data.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
