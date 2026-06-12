import 'user_model.dart';
import 'attachment_model.dart';

class Post {
  final int id;
  final String title;
  final String content;
  final User author; // ✅ object, not string
  final DateTime createdAt;
  final List<Attachment> attachments;
  final DateTime deadline;

  bool isAcknowledged;
  int acknowledgedCount;


  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.createdAt,
    required this.deadline,
    this.attachments = const [],
    this.isAcknowledged = false,
    this.acknowledgedCount = 0,
  });

   factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      author: User.fromJson(json['author']),
      createdAt: DateTime.parse(json['created_at']),
      attachments: (json['attachments'] as List?)
              ?.map((e) => Attachment.fromJson(e))
              .toList() ??
          [],
      deadline: DateTime.parse(json['deadline']),
      isAcknowledged: json['is_acknowledged'] ?? false,
      acknowledgedCount: json['acknowledged_count'] ?? 0,
    );
  }
}