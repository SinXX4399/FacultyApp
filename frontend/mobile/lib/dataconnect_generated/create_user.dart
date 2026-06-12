part of 'generated.dart';

class CreateUserVariablesBuilder {
  String name;
  String surname;
  String username;
  String userCode;
  String phone;
  String email;
  String firebaseUid;
  int year;
  String facultyId;
  String branchId;
  String departmentId;
  String roleId;

  final FirebaseDataConnect _dataConnect;
  CreateUserVariablesBuilder(this._dataConnect, {required  this.name,required  this.surname,required  this.username,required  this.userCode,required  this.phone,required  this.email,required  this.firebaseUid,required  this.year,required  this.facultyId,required  this.branchId,required  this.departmentId,required  this.roleId,});
  Deserializer<CreateUserData> dataDeserializer = (dynamic json)  => CreateUserData.fromJson(jsonDecode(json));
  Serializer<CreateUserVariables> varsSerializer = (CreateUserVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateUserData, CreateUserVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateUserData, CreateUserVariables> ref() {
    CreateUserVariables vars= CreateUserVariables(name: name,surname: surname,username: username,userCode: userCode,phone: phone,email: email,firebaseUid: firebaseUid,year: year,facultyId: facultyId,branchId: branchId,departmentId: departmentId,roleId: roleId,);
    return _dataConnect.mutation("CreateUser", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateUserUserInsert {
  final String id;
  CreateUserUserInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateUserUserInsert otherTyped = other as CreateUserUserInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  const CreateUserUserInsert({
    required this.id,
  });
}

@immutable
class CreateUserData {
  final CreateUserUserInsert user_insert;
  CreateUserData.fromJson(dynamic json):
  
  user_insert = CreateUserUserInsert.fromJson(json['user_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateUserData otherTyped = other as CreateUserData;
    return user_insert == otherTyped.user_insert;
    
  }
  @override
  int get hashCode => user_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['user_insert'] = user_insert.toJson();
    return json;
  }

  const CreateUserData({
    required this.user_insert,
  });
}

@immutable
class CreateUserVariables {
  final String name;
  final String surname;
  final String username;
  final String userCode;
  final String phone;
  final String email;
  final String firebaseUid;
  final int year;
  final String facultyId;
  final String branchId;
  final String departmentId;
  final String roleId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateUserVariables.fromJson(Map<String, dynamic> json):
  
  name = nativeFromJson<String>(json['name']),
  surname = nativeFromJson<String>(json['surname']),
  username = nativeFromJson<String>(json['username']),
  userCode = nativeFromJson<String>(json['userCode']),
  phone = nativeFromJson<String>(json['phone']),
  email = nativeFromJson<String>(json['email']),
  firebaseUid = nativeFromJson<String>(json['firebaseUid']),
  year = nativeFromJson<int>(json['year']),
  facultyId = nativeFromJson<String>(json['facultyId']),
  branchId = nativeFromJson<String>(json['branchId']),
  departmentId = nativeFromJson<String>(json['departmentId']),
  roleId = nativeFromJson<String>(json['roleId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateUserVariables otherTyped = other as CreateUserVariables;
    return name == otherTyped.name && 
    surname == otherTyped.surname && 
    username == otherTyped.username && 
    userCode == otherTyped.userCode && 
    phone == otherTyped.phone && 
    email == otherTyped.email && 
    firebaseUid == otherTyped.firebaseUid && 
    year == otherTyped.year && 
    facultyId == otherTyped.facultyId && 
    branchId == otherTyped.branchId && 
    departmentId == otherTyped.departmentId && 
    roleId == otherTyped.roleId;
    
  }
  @override
  int get hashCode => Object.hashAll([name.hashCode, surname.hashCode, username.hashCode, userCode.hashCode, phone.hashCode, email.hashCode, firebaseUid.hashCode, year.hashCode, facultyId.hashCode, branchId.hashCode, departmentId.hashCode, roleId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = nativeToJson<String>(name);
    json['surname'] = nativeToJson<String>(surname);
    json['username'] = nativeToJson<String>(username);
    json['userCode'] = nativeToJson<String>(userCode);
    json['phone'] = nativeToJson<String>(phone);
    json['email'] = nativeToJson<String>(email);
    json['firebaseUid'] = nativeToJson<String>(firebaseUid);
    json['year'] = nativeToJson<int>(year);
    json['facultyId'] = nativeToJson<String>(facultyId);
    json['branchId'] = nativeToJson<String>(branchId);
    json['departmentId'] = nativeToJson<String>(departmentId);
    json['roleId'] = nativeToJson<String>(roleId);
    return json;
  }

  const CreateUserVariables({
    required this.name,
    required this.surname,
    required this.username,
    required this.userCode,
    required this.phone,
    required this.email,
    required this.firebaseUid,
    required this.year,
    required this.facultyId,
    required this.branchId,
    required this.departmentId,
    required this.roleId,
  });
}

