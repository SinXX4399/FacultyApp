part of 'generated.dart';

class CreateFacultyVariablesBuilder {
  String name;
  String code;

  final FirebaseDataConnect _dataConnect;
  CreateFacultyVariablesBuilder(this._dataConnect, {required  this.name,required  this.code,});
  Deserializer<CreateFacultyData> dataDeserializer = (dynamic json)  => CreateFacultyData.fromJson(jsonDecode(json));
  Serializer<CreateFacultyVariables> varsSerializer = (CreateFacultyVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateFacultyData, CreateFacultyVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateFacultyData, CreateFacultyVariables> ref() {
    CreateFacultyVariables vars= CreateFacultyVariables(name: name,code: code,);
    return _dataConnect.mutation("createFaculty", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateFacultyFacultyInsert {
  final String id;
  CreateFacultyFacultyInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateFacultyFacultyInsert otherTyped = other as CreateFacultyFacultyInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  const CreateFacultyFacultyInsert({
    required this.id,
  });
}

@immutable
class CreateFacultyData {
  final CreateFacultyFacultyInsert faculty_insert;
  CreateFacultyData.fromJson(dynamic json):
  
  faculty_insert = CreateFacultyFacultyInsert.fromJson(json['faculty_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateFacultyData otherTyped = other as CreateFacultyData;
    return faculty_insert == otherTyped.faculty_insert;
    
  }
  @override
  int get hashCode => faculty_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['faculty_insert'] = faculty_insert.toJson();
    return json;
  }

  const CreateFacultyData({
    required this.faculty_insert,
  });
}

@immutable
class CreateFacultyVariables {
  final String name;
  final String code;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateFacultyVariables.fromJson(Map<String, dynamic> json):
  
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

    final CreateFacultyVariables otherTyped = other as CreateFacultyVariables;
    return name == otherTyped.name && 
    code == otherTyped.code;
    
  }
  @override
  int get hashCode => Object.hashAll([name.hashCode, code.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = nativeToJson<String>(name);
    json['code'] = nativeToJson<String>(code);
    return json;
  }

  const CreateFacultyVariables({
    required this.name,
    required this.code,
  });
}

