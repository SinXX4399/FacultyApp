import 'package:dio/dio.dart';
import '../models/post_model.dart';
import '../core/services/api_service.dart';
// Service for fetching posts, liking posts, and creating new posts
class FeedService {
  static Future<List<Post>> getPosts(int page) async {
    final response = await ApiService.dio.get(
      "/posts",
      queryParameters: {"page": page, "limit": 10},
    );

    return (response.data as List)
        .map((e) => Post.fromJson(e))
        .toList();
  }

  static Future likePost(int postId) async {
    await ApiService.dio.post("/posts/$postId/like");
  }

  static Future createPost(String content, String? imagePath) async {
    FormData formData = FormData.fromMap({
      "content": content,
      if (imagePath != null)
        "image": await MultipartFile.fromFile(imagePath),
    });

    final response =
        await ApiService.dio.post("/posts", data: formData);

    return response.data;
  }
}