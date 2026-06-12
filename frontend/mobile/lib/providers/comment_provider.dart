import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/comment_model.dart';
import '../services/api_service.dart';

/// =================================================
/// 🔹 STATE
/// =================================================

class CommentState {

  final List<Comment> comments;

  final bool isLoading;
  final bool isLoadingMore;

  final bool hasMore;
  final int page;

  CommentState({
    this.comments = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.page = 1,
  });

  CommentState copyWith({
    List<Comment>? comments,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    int? page,
  }) {

    return CommentState(
      comments: comments ?? this.comments,

      isLoading:
          isLoading ?? this.isLoading,

      isLoadingMore:
          isLoadingMore ??
              this.isLoadingMore,

      hasMore:
          hasMore ?? this.hasMore,

      page:
          page ?? this.page,
    );
  }
}

/// =================================================
/// 🔹 NOTIFIER
/// =================================================

class CommentNotifier
    extends Notifier<CommentState> {

  CommentNotifier(this.postId);

  final int postId;

  static const int limit = 10;

  @override
  CommentState build() {

    return CommentState();
  }

  /// =================================================
  /// 🔹 FETCH COMMENTS
  /// =================================================

  Future<void> fetchComments({
    bool loadMore = false,
  }) async {

    if (state.isLoading ||
        state.isLoadingMore) {
      return;
    }

    if (loadMore &&
        !state.hasMore) {
      return;
    }

    if (!loadMore) {

      state = state.copyWith(
        isLoading: true,
        page: 1,
      );

    } else {

      state = state.copyWith(
        isLoadingMore: true,
      );
    }

    try {

      final nextPage =
          loadMore
              ? state.page + 1
              : 1;

      final data =
          await ApiService.fetchComments(
        postId,
        page: nextPage,
        limit: limit,
      );

      state = state.copyWith(
        comments: loadMore
            ? [
                ...state.comments,
                ...data,
              ]
            : data,

        page: nextPage,

        hasMore:
            data.length >= limit,
      );

    } catch (e) {
      //
    }

    state = state.copyWith(
      isLoading: false,
      isLoadingMore: false,
    );
  }

  /// =================================================
  /// 🔹 ADD COMMENT
  /// =================================================

  Future<void> addComment(
    String content,
  ) async {

    if (content.trim().isEmpty) {
      return;
    }

    try {

      final newComment =
          await ApiService.addComment(
        postId,
        content,
      );

      state = state.copyWith(
        comments: [
          newComment,
          ...state.comments,
        ],
      );

    } catch (e) {
      //
    }
  }

  /// =================================================
  /// 🔹 ADD REPLY
  /// =================================================

  Future<void> addReply({
    required int parentId,
    required String content,
  }) async {

    if (content.trim().isEmpty) {
      return;
    }

    try {

      final reply =
          await ApiService.addReply(
        parentId: parentId,
        content: content,
      );

      final updatedComments =
          state.comments.map((comment) {

        if (comment.id == parentId) {

          return comment.copyWith(
            replies: [
              ...comment.replies,
              reply,
            ],
          );
        }

        return comment;

      }).toList();

      state = state.copyWith(
        comments: updatedComments,
      );

    } catch (e) {
      //
    }
  }

  /// =================================================
  /// 🔥 LAZY LOAD REPLIES
  /// =================================================

  Future<void> fetchReplies(
    int commentId,
  ) async {

    try {

      final replies =
          await ApiService.fetchReplies(
        commentId,
      );

      final updated =
          state.comments.map((comment) {

        if (comment.id == commentId) {

          return comment.copyWith(
            replies: replies,
            hasLoadedReplies: true,
          );
        }

        return comment;

      }).toList();

      state = state.copyWith(
        comments: updated,
      );

    } catch (e) {
      //
    }
  }

  /// =================================================
  /// 🔹 REFRESH
  /// =================================================

  Future<void> refresh() async {

    state = CommentState();

    await fetchComments();
  }
}

/// =================================================
/// 🔹 PROVIDER
/// =================================================

final commentProvider =
    NotifierProvider.family<
        CommentNotifier,
        CommentState,
        int>(
  (postId) => CommentNotifier(postId),
);