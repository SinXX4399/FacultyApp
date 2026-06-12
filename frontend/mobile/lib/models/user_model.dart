enum UserRole { student, teacher, admin }

class User {
  final int id;
  final String name;
  final String surname;
  final String userCode;
  final String? email;
  final UserRole role; // ✅ use enum instead of String
  final String? avatarUrl;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.userCode,
    this.email,
    required this.role,
    this.avatarUrl,
  });

  /// 🔹 Convert JSON → User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      userCode: json['user_code'] ?? '',
      email: json['email'],
      role: _parseRole(json['role']),
      avatarUrl: json['avatar_url'],
    );
  }

  /// 🔹 Convert User → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'user_code': userCode,
      'email': email,
      'role': role.name, // enum → string
      'avatar_url': avatarUrl,
    };
  }

  /// 🔹 Helper: parse role string → enum
  static UserRole _parseRole(String? role) {
    switch (role) {
      case 'teacher':
        return UserRole.teacher;
      case 'admin':
        return UserRole.admin;
      default:
        return UserRole.student;
    }
  }

  /// 🔹 UI helper
  String get fullName => '$name $surname';
}