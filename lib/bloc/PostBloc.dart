
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../repo/PostRepository.dart';
import 'PostState.dart';
part 'PostEvent.dart';


@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc(this.repository) : super(PostInitial()) {
    on<FetchPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await repository.fetchPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError('Failed to fetch posts'));
      }
    });
  }
}
