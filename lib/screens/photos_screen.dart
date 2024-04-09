import 'package:flutter/material.dart';
import 'package:flutter_api/apis/api_sevice.dart';
import 'package:flutter_api/models/photo_model.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  late List<PhotoModel>? _photosModel = [];

  @override
  void initState() {
    super.initState();
    _getPhoto();
  }

  void _getPhoto() async {
    _photosModel = (await PhotosService().getPhotos());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Photo Screen Api'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: _photosModel == null || _photosModel!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _photosModel!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.amber),
                        height: 250,
                        width: 200,
                        child: Column(
                          children: [
                            Image.network(_photosModel![index].thumbnailUrl),
                            Text(_photosModel![index].title),
                            Text(_photosModel![index].albumId.toString()),
                            Text(_photosModel![index].id.toString()),
                            Text(_photosModel![index].url)
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}
