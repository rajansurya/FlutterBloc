import '../../models/Post.dart';

abstract class PostRepository{
  Future<List<Post>> fetchPosts();
}