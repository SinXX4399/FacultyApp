import '../models/post_model.dart';
import '../services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 🔹 State class
class PostState {
  final List<Post> posts;
  final bool isLoading;
  final bool hasMore;
  final int page;

  PostState({
    this.posts = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.page = 1,
  });

  PostState copyWith({
    List<Post>? posts,
    bool? isLoading,
    bool? hasMore,
    int? page,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
    );
  }
}

/// 🔹 Notifier
class PostNotifier extends Notifier<PostState> {
  @override
  PostState build() {
    return PostState();
  }

  Future<void> fetchPosts({bool refresh = false}) async {
    if (state.isLoading) return;

    if (refresh) {
      state = PostState();
    }

    state = state.copyWith(isLoading: true);

    try {
      final newPosts =
          await ApiService.fetchPosts(page: state.page);

      if (newPosts.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          hasMore: false,
        );
      } else {
        state = state.copyWith(
          posts: [...state.posts, ...newPosts],
          page: state.page + 1,
          isLoading: false,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

/// 🔹 Provider
final postProvider =
    NotifierProvider<PostNotifier, PostState>(
  PostNotifier.new,
);