part of 'generated.dart';

class GetUsersVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  GetUsersVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<GetUsersData> dataDeserializer = (dynamic json)  => GetUsersData.fromJson(jsonDecode(json));
  Serializer<GetUsersVariables> varsSerializer = (GetUsersVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetUsersData, GetUsersVariables>> execute({QueryFetchPolicy fetchPolicy = QueryFetchPolicy.preferCache}) {
    return ref().execute(fetchPolicy: fetchPolicy);
  }

  QueryRef<GetUsersData, GetUsersVariables> ref() {
    GetUsersVariables vars= GetUsersVariables(id: id,);
    return _dataConnect.query("GetUsers", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetUsersUser {
  final String id;
  final String username;
  final String userCode;
  final String name;
  final String surname;
  final String phone;
  final String email;
  final int year;
  final bool isActive;
  final GetUsersUserFaculty faculty;
  final GetUsersUserBranch branch;
  final GetUsersUserDepartment department;
  final GetUsersUserRole role;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  GetUsersUser.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  username = nativeFromJson<String>(json['username']),
  userCode = nativeFromJson<String>(json['userCode']),
  name = nativeFromJson<String>(json['name']),
  surname = nativeFromJson<String>(json['surname']),
  phone = nativeFromJson<String>(json['phone']),
  email = nativeFromJson<String>(json['email']),
  year = nativeFromJson<int>(json['year']),
  isActive = nativeFromJson<bool>(json['isActive']),
  faculty = GetUsersUserFaculty.fromJson(json['faculty']),
  branch = GetUsersUserBranch.fromJson(json['branch']),
  department = GetUsersUserDepartment.fromJson(json['department']),
  role = GetUsersUserRole.fromJson(json['role']),
  createdAt = Timestamp.fromJson(json['createdAt']),
  updatedAt = Timestamp.fromJson(json['updatedAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUsersUser otherTyped = other as GetUsersUser;
    return id == otherTyped.id && 
    username == otherTyped.username && 
    userCode == otherTyped.userCode && 
    name == otherTyped.name && 
    surname == otherTyped.surname && 
    phone == otherTyped.phone && 
    email == otherTyped.email && 
    year == otherTyped.year && 
    isActive == otherTyped.isActive && 
    faculty == otherTyped.faculty && 
    branch == otherTyped.branch && 
    department == otherTyped.department && 
    role == otherTyped.role && 
    createdAt == otherTyped.createdAt && 
    updatedAt == otherTyped.updatedAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, username.hashCode, userCode.hashCode, name.hashCode, surname.hashCode, phone.hashCode, email.hashCode, year.hashCode, isActive.hashCode, faculty.hashCode, branch.hashCode, department.hashCode, role.hashCode, createdAt.hashCode, updatedAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['username'] = nativeToJson<String>(username);
    json['userCode'] = nativeToJson<String>(userCode);
    json['name'] = nativeToJson<String>(name);
    json['surname'] = nativeToJson<String>(surname);
    json['phone'] = nativeToJson<String>(phone);
    json['email'] = nativeToJson<String>(email);
    json['year'] = nativeToJson<int>(year);
    json['isActive'] = nativeToJson<bool>(isActive);
    json['faculty'] = faculty.toJson();
    json['branch'] = branch.toJson();
    json['department'] = department.toJson();
    json['role'] = role.toJson();
    json['createdAt'] = createdAt.toJson();
    json['updatedAt'] = updatedAt.toJson();
    return json;
  }

  const GetUsersUser({
    required this.id,
    required this.username,
    required this.userCode,
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
    required this.year,
    required this.isActive,
    required this.faculty,
    required this.branch,
    required this.department,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });
}

@immutable
class GetUsersUserFaculty {
  final String id;
  final String name;
  final String code;
  GetUsersUserFaculty.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  name = nativeFromJson<String>(json['name']),
  code = nativeFromJson<String>(json['code']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUsersUserFaculty otherTyped = other as GetUsersUserFaculty;
    return id == otherTyped.id && 
    name == otherTyped.name && 
    code == otherTyped.code;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, name.hashCode, code.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['code'] = nativeToJson<String>(code);
    return json;
  }

  const GetUsersUserFaculty({
    required this.id,
    required this.name,
    required this.code,
  });
}

@immutable
class GetUsersUserBranch {
  final String id;
  final String name;
  final String code;
  GetUsersUserBranch.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  name = nativeFromJson<String>(json['name']),
  code = nativeFromJson<String>(json['code']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUsersUserBranch otherTyped = other as GetUsersUserBranch;
    return id == otherTyped.id && 
    name == otherTyped.name && 
    code == otherTyped.code;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, name.hashCode, code.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['code'] = nativeToJson<String>(code);
    return json;
  }

  const GetUsersUserBranch({
    required this.id,
    required this.name,
    required this.code,
  });
}

@immutable
class GetUsersUserDepartment {
  final String id;
  final String name;
  GetUsersUserDepartment.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  name = nativeFromJson<String>(json['name']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUsersUserDepartment otherTyped = other as GetUsersUserDepartment;
    return id == otherTyped.id && 
    name == otherTyped.name;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, name.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  const GetUsersUserDepartment({
    required this.id,
    required this.name,
  });
}

@immutable
class GetUsersUserRole {
  final String id;
  final String name;
  GetUsersUserRole.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  name = nativeFromJson<String>(json['name']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUsersUserRole otherTyped = other as GetUsersUserRole;
    return id == otherTyped.id && 
    name == otherTyped.name;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, name.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  const GetUsersUserRole({
    required this.id,
    required this.name,
  });
}

@immutable
class GetUsersData {
  final GetUsersUser? user;
  GetUsersData.fromJson(dynamic json):
  
  user = json['user'] == null ? null : GetUsersUser.fromJson(json['user']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUsersData otherTyped = other as GetUsersData;
    return user == otherTyped.user;
    
  }
  @override
  int get hashCode => user.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (user != null) {
      json['user'] = user!.toJson();
    }
    return json;
  }

  const GetUsersData({
    this.user,
  });
}

@immutable
class GetUsersVariables {
  final String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetUsersVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetUsersVariables otherTyped = other as GetUsersVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  const GetUsersVariables({
    required this.id,
  });
}

