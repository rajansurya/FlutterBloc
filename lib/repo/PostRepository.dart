import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../models/Post.dart';
import 'package:http/http.dart' as http;

@injectable
class PostRepository {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    print("Che==== ${response.body}");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}