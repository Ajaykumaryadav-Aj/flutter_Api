import 'package:flutter/material.dart';
import 'package:flutter_api/apis/api_sevice.dart';
import 'package:flutter_api/models/album_model.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late List<AlbumModel>? _albumModel = [];
  @override
  void initState() {
    super.initState();
    _getAlbum();
  }

  void _getAlbum() async {
    _albumModel = (await AlbumService().getAlbum());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Screen Api'),
        centerTitle: true,
      ),
      body: _albumModel == null || _albumModel!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _albumModel!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(_albumModel![index].title),
                    Text(
                      _albumModel![index].id.toString(),
                    ),
                    Text(_albumModel![index].id.toString())
                  ],
                );
              },
            ),
    );
  }
}
