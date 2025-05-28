import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:state_bloc/get_it/get_it.dart';
import 'package:state_bloc/repo/repointerface/PostRepository.dart';

import '../models/Post.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as:PostRepository)/* This is for singleton design pattern object provider*/
class PostRepositoryImpl implements PostRepository {
     /*Access the Module instance*/
   final http.Client httpClient=getItInstance<http.Client>();

  @override
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    print("Che11==== ${response.body}");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}