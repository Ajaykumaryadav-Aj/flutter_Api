import 'package:flutter/material.dart';
import 'package:flutter_api/apis/api_sevice.dart';
import 'package:flutter_api/models/post_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late List<PostModel>? _postModel = [];

  @override
  void initState() {
    super.initState();
    _getPost();
  }

  void _getPost() async {
    _postModel = (await PostService().getPost());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Api Screen'),
      ),
      body: ListView.builder(
        itemCount: _postModel!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(_postModel![index].title),
              const SizedBox(height: 15),
              Text(_postModel![index].body),
              const SizedBox(height: 15),
              Text(_postModel![index].body.toString())
            ],
          );
        },
      ),
    );
  }
}
