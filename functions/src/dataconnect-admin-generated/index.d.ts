import { ConnectorConfig, DataConnect, OperationOptions, ExecuteOperationResponse } from 'firebase-admin/data-connect';

export const connectorConfig: ConnectorConfig;

export type TimestampString = string;
export type UUIDString = string;
export type Int64String = string;
export type DateString = string;


export interface Branch_Key {
  id: UUIDString;
  __typename?: 'Branch_Key';
}

export interface CreateBranchData {
  branch_insert: Branch_Key;
}

export interface CreateBranchVariables {
  name: string;
  code: string;
  facultyId: UUIDString;
}

export interface CreateFacultyData {
  faculty_insert: Faculty_Key;
}

export interface CreateFacultyVariables {
  name: string;
  code: string;
}

export interface CreateUserData {
  user_insert: User_Key;
}

export interface CreateUserVariables {
  name: string;
  surname: string;
  username: string;
  userCode: string;
  phone: string;
  email: string;
  firebaseUid: string;
  year: number;
  facultyId: UUIDString;
  branchId: UUIDString;
  departmentId: UUIDString;
  roleId: UUIDString;
}

export interface DeleteUserData {
  user_delete?: User_Key | null;
}

export interface DeleteUserVariables {
  id: UUIDString;
}

export interface Department_Key {
  id: UUIDString;
  __typename?: 'Department_Key';
}

export interface Faculty_Key {
  id: UUIDString;
  __typename?: 'Faculty_Key';
}

export interface GetUsersData {
  user?: {
    id: UUIDString;
    username: string;
    userCode: string;
    name: string;
    surname: string;
    phone: string;
    email: string;
    year: number;
    isActive: boolean;
    faculty: {
      id: UUIDString;
      name: string;
      code: string;
    } & Faculty_Key;
      branch: {
        id: UUIDString;
        name: string;
        code: string;
      } & Branch_Key;
        department: {
          id: UUIDString;
          name: string;
        } & Department_Key;
          role: {
            id: UUIDString;
            name: string;
          } & Role_Key;
            createdAt: TimestampString;
            updatedAt: TimestampString;
  } & User_Key;
}

export interface GetUsersVariables {
  id: UUIDString;
}

export interface Permission_Key {
  id: UUIDString;
  __typename?: 'Permission_Key';
}

export interface RolePermission_Key {
  id: UUIDString;
  __typename?: 'RolePermission_Key';
}

export interface Role_Key {
  id: UUIDString;
  __typename?: 'Role_Key';
}

export interface UpdateUserData {
  user_update?: User_Key | null;
}

export interface UpdateUserVariables {
  id: UUIDString;
  username?: string | null;
  userCode?: string | null;
  name?: string | null;
  surname?: string | null;
  phone?: string | null;
  email?: string | null;
  year?: number | null;
  facultyId?: UUIDString | null;
  branchId?: UUIDString | null;
  departmentId?: UUIDString | null;
}

export interface User_Key {
  id: UUIDString;
  __typename?: 'User_Key';
}

/** Generated Node Admin SDK operation action function for the 'CreateBranch' Mutation. Allow users to execute without passing in DataConnect. */
export function createBranch(dc: DataConnect, vars: CreateBranchVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateBranchData>>;
/** Generated Node Admin SDK operation action function for the 'CreateBranch' Mutation. Allow users to pass in custom DataConnect instances. */
export function createBranch(vars: CreateBranchVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateBranchData>>;

/** Generated Node Admin SDK operation action function for the 'CreateFaculty' Mutation. Allow users to execute without passing in DataConnect. */
export function createFaculty(dc: DataConnect, vars: CreateFacultyVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateFacultyData>>;
/** Generated Node Admin SDK operation action function for the 'CreateFaculty' Mutation. Allow users to pass in custom DataConnect instances. */
export function createFaculty(vars: CreateFacultyVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateFacultyData>>;

/** Generated Node Admin SDK operation action function for the 'CreateUser' Mutation. Allow users to execute without passing in DataConnect. */
export function createUser(dc: DataConnect, vars: CreateUserVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateUserData>>;
/** Generated Node Admin SDK operation action function for the 'CreateUser' Mutation. Allow users to pass in custom DataConnect instances. */
export function createUser(vars: CreateUserVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateUserData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateUser' Mutation. Allow users to execute without passing in DataConnect. */
export function updateUser(dc: DataConnect, vars: UpdateUserVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateUserData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateUser' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateUser(vars: UpdateUserVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateUserData>>;

/** Generated Node Admin SDK operation action function for the 'DeleteUser' Mutation. Allow users to execute without passing in DataConnect. */
export function deleteUser(dc: DataConnect, vars: DeleteUserVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<DeleteUserData>>;
/** Generated Node Admin SDK operation action function for the 'DeleteUser' Mutation. Allow users to pass in custom DataConnect instances. */
export function deleteUser(vars: DeleteUserVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<DeleteUserData>>;

/** Generated Node Admin SDK operation action function for the 'GetUsers' Query. Allow users to execute without passing in DataConnect. */
export function getUsers(dc: DataConnect, vars: GetUsersVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetUsersData>>;
/** Generated Node Admin SDK operation action function for the 'GetUsers' Query. Allow users to pass in custom DataConnect instances. */
export function getUsers(vars: GetUsersVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<GetUsersData>>;

