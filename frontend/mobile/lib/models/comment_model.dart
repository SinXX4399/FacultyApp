import 'user_model.dart';

class Comment {
  final int id;
  final String content;
  final User author;
  final DateTime createdAt;

  /// 🔥 NEW
  final List<Comment> replies;
  bool hasLoadedReplies;
  bool isLoadingReplies;

  Comment({
    required this.id,
    required this.content,
    required this.author,
    required this.createdAt,
    required this.hasLoadedReplies,
    required this.isLoadingReplies,
    this.replies = const [],
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      content: json['content'],
      author: User.fromJson(json['author']),
      createdAt: DateTime.parse(json['created_at']),
      hasLoadedReplies: false,
      isLoadingReplies: false,

      /// 🔥 parse replies
      replies: json['replies'] != null
          ? List<Comment>.from(
              json['replies']
                  .map((x) => Comment.fromJson(x)),
            )
          : [],
    );
  }

  Comment copyWith({

    int? id,

    String? content,

    User? author,

    DateTime? createdAt,

    List<Comment>? replies,

    bool? hasLoadedReplies,
    bool? isLoadingReplies,
  }) {

    return Comment(
      id: id ?? this.id,

      content:
          content ?? this.content,

      author:
          author ?? this.author,

      createdAt:
          createdAt ?? this.createdAt,

      replies:
          replies ?? this.replies,

      hasLoadedReplies:
          hasLoadedReplies ??
              this.hasLoadedReplies,
      isLoadingReplies: 
          isLoadingReplies ??
              this.isLoadingReplies,
    );
  }
}


