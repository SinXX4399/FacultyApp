import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';
import '../services/api_service.dart';

/// 🔹 Query Notifier
class MentionQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String value) {
    state = value;
  }
}

/// 🔹 Query Provider
final mentionQueryProvider =
    NotifierProvider<MentionQueryNotifier, String>(
  MentionQueryNotifier.new,
);

/// 🔹 Async Search Provider
final mentionProvider =
    FutureProvider<List<User>>((ref) async {

  final query = ref.watch(
    mentionQueryProvider,
  );

  if (query.trim().isEmpty) {
    return [];
  }

  return ApiService.searchUsers(query);
});