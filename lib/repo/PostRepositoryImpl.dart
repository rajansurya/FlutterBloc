import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:state_bloc/get_it/get_it.dart';
import 'package:state_bloc/repo/repointerface/PostRepository.dart';

import '../models/Post.dart';

@LazySingleton(as: PostRepository)
/* This is for singleton design pattern object provider*/ class PostRepositoryImpl
    implements PostRepository {
  /*Access the Module instance*/
  final httpClient = getItInstance<http.Client>();
  final dioClient = getItInstance<Dio>();

  @override
  Future<List<Post>> fetchPosts() async {
    final response = await httpClient.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {
        'Accept': 'application/json',
      },
    );
    final responseDio = await dioClient.get('https://jsonplaceholder.typicode.com/posts',options: Options(
      headers: {
        'Accept': 'application/json',
      }
    ));
   print("Che11==== ${responseDio.data}");
    if (responseDio.statusCode == 200) {
      // final data = jsonDecode(responseDio.data) as List;
      final data =responseDio.data as List;
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
