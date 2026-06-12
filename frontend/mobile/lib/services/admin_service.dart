import 'package:dio/dio.dart';


// This service handles admin-related API calls, such as creating roles and fetching permissions.

class AdminService {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://localhost:8000")); //Backend URL

  Future<void> createRole(String name, List<String> permissions) async {
    await dio.post(
      "/roles",
      data: {
        "name": name,
        "permissions": permissions,
      },
    );
  }

  Future<List<String>> fetchPermissions() async {
    final res = await dio.get("/permissions");
    return List<String>.from(res.data);
  }
}