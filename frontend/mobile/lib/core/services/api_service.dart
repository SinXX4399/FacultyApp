import 'package:dio/dio.dart';
import '../config/app_config.dart';
import '../storage/token_storage.dart';

// Centralized API service with Dio and token management(JWT interceptor)
class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl,
      headers: {"Content-Type": "application/json"},
    ),
  )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenStorage.getToken();

          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }

          return handler.next(options);
        },
      ),
    );
}