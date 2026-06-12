library;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

part 'create_branch.dart';

part 'create_faculty.dart';

part 'create_user.dart';

part 'update_user.dart';

part 'delete_user.dart';

part 'get_users.dart';







class ExampleConnector {
  
  
  CreateBranchVariablesBuilder createBranch ({required String name, required String code, required String facultyId, }) {
    return CreateBranchVariablesBuilder(dataConnect, name: name,code: code,facultyId: facultyId,);
  }
  
  
  CreateFacultyVariablesBuilder createFaculty ({required String name, required String code, }) {
    return CreateFacultyVariablesBuilder(dataConnect, name: name,code: code,);
  }
  
  
  CreateUserVariablesBuilder createUser ({required String name, required String surname, required String username, required String userCode, required String phone, required String email, required String firebaseUid, required int year, required String facultyId, required String branchId, required String departmentId, required String roleId, }) {
    return CreateUserVariablesBuilder(dataConnect, name: name,surname: surname,username: username,userCode: userCode,phone: phone,email: email,firebaseUid: firebaseUid,year: year,facultyId: facultyId,branchId: branchId,departmentId: departmentId,roleId: roleId,);
  }
  
  
  UpdateUserVariablesBuilder updateUser ({required String id, }) {
    return UpdateUserVariablesBuilder(dataConnect, id: id,);
  }
  
  
  DeleteUserVariablesBuilder deleteUser ({required String id, }) {
    return DeleteUserVariablesBuilder(dataConnect, id: id,);
  }
  
  
  GetUsersVariablesBuilder getUsers ({required String id, }) {
    return GetUsersVariablesBuilder(dataConnect, id: id,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'asia-southeast1',
    'example',
    'faculty-app-ee827-service',
  );

  ExampleConnector({required this.dataConnect});
  static ExampleConnector get instance {
    
    CacheSettings cacheSettings = CacheSettings(
      maxAge: Duration(milliseconds:0),
      storage: CacheStorage.persistent,
    );
    
    return ExampleConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            
            cacheSettings: cacheSettings,
            
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}
