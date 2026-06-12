import '../core/services/api_service.dart';
import '../core/storage/token_storage.dart';
// Authentication service for handling login and token management
class AuthService {
  static Future login(String username, String password) async {
    final response = await ApiService.dio.post(
      "/auth/login",
      data: {
        "username": username,
        "password": password,
      },
    );

    final token = response.data["access_token"];

    await TokenStorage.saveToken(token);

    return response.data;
  }
}