# dataconnect_generated SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
ExampleConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### GetUsers
#### Required Arguments
```dart
String id = ...;
ExampleConnector.instance.getUsers(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetUsersData, GetUsersVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getUsers(
  id: id,
);
GetUsersData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = ExampleConnector.instance.getUsers(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### CreateBranch
#### Required Arguments
```dart
String name = ...;
String code = ...;
String facultyId = ...;
ExampleConnector.instance.createBranch(
  name: name,
  code: code,
  facultyId: facultyId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateBranchData, CreateBranchVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createBranch(
  name: name,
  code: code,
  facultyId: facultyId,
);
CreateBranchData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String name = ...;
String code = ...;
String facultyId = ...;

final ref = ExampleConnector.instance.createBranch(
  name: name,
  code: code,
  facultyId: facultyId,
).ref();
ref.execute();
```


### createFaculty
#### Required Arguments
```dart
String name = ...;
String code = ...;
ExampleConnector.instance.createFaculty(
  name: name,
  code: code,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<createFacultyData, createFacultyVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createFaculty(
  name: name,
  code: code,
);
createFacultyData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String name = ...;
String code = ...;

final ref = ExampleConnector.instance.createFaculty(
  name: name,
  code: code,
).ref();
ref.execute();
```


### CreateUser
#### Required Arguments
```dart
String name = ...;
String surname = ...;
String username = ...;
String userCode = ...;
String phone = ...;
String email = ...;
String firebaseUid = ...;
int year = ...;
String facultyId = ...;
String branchId = ...;
String departmentId = ...;
String roleId = ...;
ExampleConnector.instance.createUser(
  name: name,
  surname: surname,
  username: username,
  userCode: userCode,
  phone: phone,
  email: email,
  firebaseUid: firebaseUid,
  year: year,
  facultyId: facultyId,
  branchId: branchId,
  departmentId: departmentId,
  roleId: roleId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateUserData, CreateUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createUser(
  name: name,
  surname: surname,
  username: username,
  userCode: userCode,
  phone: phone,
  email: email,
  firebaseUid: firebaseUid,
  year: year,
  facultyId: facultyId,
  branchId: branchId,
  departmentId: departmentId,
  roleId: roleId,
);
CreateUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String name = ...;
String surname = ...;
String username = ...;
String userCode = ...;
String phone = ...;
String email = ...;
String firebaseUid = ...;
int year = ...;
String facultyId = ...;
String branchId = ...;
String departmentId = ...;
String roleId = ...;

final ref = ExampleConnector.instance.createUser(
  name: name,
  surname: surname,
  username: username,
  userCode: userCode,
  phone: phone,
  email: email,
  firebaseUid: firebaseUid,
  year: year,
  facultyId: facultyId,
  branchId: branchId,
  departmentId: departmentId,
  roleId: roleId,
).ref();
ref.execute();
```


### UpdateUser
#### Required Arguments
```dart
String id = ...;
ExampleConnector.instance.updateUser(
  id: id,
).execute();
```

#### Optional Arguments
We return a builder for each query. For UpdateUser, we created `UpdateUserBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class UpdateUserVariablesBuilder {
  ...
   UpdateUserVariablesBuilder username(String? t) {
   _username.value = t;
   return this;
  }
  UpdateUserVariablesBuilder userCode(String? t) {
   _userCode.value = t;
   return this;
  }
  UpdateUserVariablesBuilder name(String? t) {
   _name.value = t;
   return this;
  }
  UpdateUserVariablesBuilder surname(String? t) {
   _surname.value = t;
   return this;
  }
  UpdateUserVariablesBuilder phone(String? t) {
   _phone.value = t;
   return this;
  }
  UpdateUserVariablesBuilder email(String? t) {
   _email.value = t;
   return this;
  }
  UpdateUserVariablesBuilder year(int? t) {
   _year.value = t;
   return this;
  }
  UpdateUserVariablesBuilder facultyId(String? t) {
   _facultyId.value = t;
   return this;
  }
  UpdateUserVariablesBuilder branchId(String? t) {
   _branchId.value = t;
   return this;
  }
  UpdateUserVariablesBuilder departmentId(String? t) {
   _departmentId.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.updateUser(
  id: id,
)
.username(username)
.userCode(userCode)
.name(name)
.surname(surname)
.phone(phone)
.email(email)
.year(year)
.facultyId(facultyId)
.branchId(branchId)
.departmentId(departmentId)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<UpdateUserData, UpdateUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.updateUser(
  id: id,
);
UpdateUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = ExampleConnector.instance.updateUser(
  id: id,
).ref();
ref.execute();
```


### DeleteUser
#### Required Arguments
```dart
String id = ...;
ExampleConnector.instance.deleteUser(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<DeleteUserData, DeleteUserVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.deleteUser(
  id: id,
);
DeleteUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = ExampleConnector.instance.deleteUser(
  id: id,
).ref();
ref.execute();
```

