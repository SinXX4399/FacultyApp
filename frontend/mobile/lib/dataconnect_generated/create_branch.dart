part of 'generated.dart';

class CreateMajorVariablesBuilder {
  String name;
  String code;
  String facultyId;

  final FirebaseDataConnect _dataConnect;
  CreateMajorVariablesBuilder(this._dataConnect, {required  this.name,required  this.code,required  this.facultyId,});
  Deserializer<CreateMajorData> dataDeserializer = (dynamic json)  => CreateMajorData.fromJson(jsonDecode(json));
  Serializer<CreateMajorVariables> varsSerializer = (CreateBranchVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateBranchData, CreateMajorhVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateBranchData, CreateBranchVariables> ref() {
    CreateBranchVariables vars= CreateBranchVariables(name: name,code: code,facultyId: facultyId,);
    return _dataConnect.mutation("CreateBranch", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateBranchBranchInsert {
  final String id;
  CreateBranchBranchInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateBranchBranchInsert otherTyped = other as CreateBranchBranchInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  const CreateBranchBranchInsert({
    required this.id,
  });
}

@immutable
class CreateBranchData {
  final CreateBranchBranchInsert branch_insert;
  CreateBranchData.fromJson(dynamic json):
  
  branch_insert = CreateBranchBranchInsert.fromJson(json['branch_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateBranchData otherTyped = other as CreateBranchData;
    return branch_insert == otherTyped.branch_insert;
    
  }
  @override
  int get hashCode => branch_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['branch_insert'] = branch_insert.toJson();
    return json;
  }

  const CreateBranchData({
    required this.branch_insert,
  });
}

@immutable
class CreateBranchVariables {
  final String name;
  final String code;
  final String facultyId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateBranchVariables.fromJson(Map<String, dynamic> json):
  
  name = nativeFromJson<String>(json['name']),
  code = nativeFromJson<String>(json['code']),
  facultyId = nativeFromJson<String>(json['facultyId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateBranchVariables otherTyped = other as CreateBranchVariables;
    return name == otherTyped.name && 
    code == otherTyped.code && 
    facultyId == otherTyped.facultyId;
    
  }
  @override
  int get hashCode => Object.hashAll([name.hashCode, code.hashCode, facultyId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = nativeToJson<String>(name);
    json['code'] = nativeToJson<String>(code);
    json['facultyId'] = nativeToJson<String>(facultyId);
    return json;
  }

  const CreateBranchVariables({
    required this.name,
    required this.code,
    required this.facultyId,
  });
}

