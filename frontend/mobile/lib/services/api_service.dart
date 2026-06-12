import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/post_model.dart';
import '../../models/comment_model.dart';
import '../../models/user_model.dart';
class ApiService {
  static const String baseUrl =
      "http://10.0.2.2:8000";

  /// 🔥 reusable headers
  static Map<String, String> get headers => {
        "Content-Type": "application/json",
      };

  // =================================================
  // 🔹 UPLOAD FILE
  // =================================================

  static Future<void> uploadFile({
    required String filePath,
    required String fileName,
  }) async {
    final request = http.MultipartRequest(
      "POST",
      Uri.parse("$baseUrl/upload"),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        "file",
        filePath,
        filename: fileName,
      ),
    );

    final response = await request.send();

    if (response.statusCode != 200 &&
        response.statusCode != 201) {
      throw Exception("Upload failed");
    }
  }

  // =================================================
  // 🔹 POSTS
  // =================================================

  /// 🔹 Fetch posts with pagination
  static Future<List<Post>> fetchPosts({
    int page = 1,
    int limit = 10,
  }) async {
    final response = await http.get(
      Uri.parse(
        "$baseUrl/posts?page=$page&limit=$limit",
      ),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data
          .map((e) => Post.fromJson(e))
          .toList();
    }

    throw Exception("Failed to load posts");
  }

  /// 🔹 Acknowledge post
  static Future<void> acknowledgePost(
    int postId,
  ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/posts/$postId/ack"),
    );

    if (response.statusCode != 200) {
      throw Exception(
        "Failed to acknowledge post",
      );
    }
  }

  // =================================================
  // 🔹 COMMENTS
  // =================================================

  /// 🔹 Fetch comments with pagination
  static Future<List<Comment>> fetchComments(
    int postId, {
    int page = 1,
    int limit = 10,
  }) async {
    final response = await http.get(
      Uri.parse(
        "$baseUrl/posts/$postId/comments?page=$page&limit=$limit",
      ),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data
          .map((e) => Comment.fromJson(e))
          .toList();
    }

    throw Exception("Failed to load comments");
  }

  /// 🔹 Add comment
  static Future<Comment> addComment(
    int postId,
    String content,
  ) async {
    final response = await http.post(
      Uri.parse(
        "$baseUrl/posts/$postId/comments",
      ),
      headers: headers,
      body: jsonEncode({
        "content": content,
      }),
    );

    if (response.statusCode == 200 ||
        response.statusCode == 201) {
      final data = jsonDecode(response.body);

      return Comment.fromJson(data);
    }

    throw Exception("Failed to add comment");
  }

  /// 🔥 Add reply
  static Future<Comment> addReply({
      required int parentId,
      required String content,
    }) async {
      final response = await http.post(
        Uri.parse(
          "$baseUrl/comments/$parentId/reply",
        ),
        headers: headers,
        body: jsonEncode({
          "content": content,
        }),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        final data = jsonDecode(response.body);

        return Comment.fromJson(data);
      }

      throw Exception("Failed to add reply");
    }
  //mentioned in the comment provider
  /// 🔹 Search users (mentions)
  
  /// 🔥 Fetch replies (lazy loading)
static Future<List<Comment>> fetchReplies(
  int commentId, {
  int page = 1,
  int limit = 10,
}) async {

  final response = await http.get(
    Uri.parse(
      "$baseUrl/comments/$commentId/replies?page=$page&limit=$limit",
    ),
  );

  if (response.statusCode == 200) {

    final List data =
        jsonDecode(response.body);

    return data
        .map((e) => Comment.fromJson(e))
        .toList();
  }

  throw Exception(
    "Failed to load replies",
  );
}
  
  
  
  static Future<List<User>> searchUsers(
    String query,
  ) async {

    /// prevent unnecessary API calls
    if (query.trim().isEmpty) {
      return [];
    }

    final uri = Uri.parse(
      "$baseUrl/users/search",
    ).replace(
      queryParameters: {
        "q": query,
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {

      final List data =
          jsonDecode(response.body);

      return data
          .map((e) => User.fromJson(e))
          .toList();
    }

    throw Exception(
      "Failed to search users",
    );
}
}