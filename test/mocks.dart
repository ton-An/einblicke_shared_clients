import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:einblicke_shared/einblicke_shared.dart';
import 'package:einblicke_shared_clients/einblicke_shared_clients.dart';
import 'package:file/file.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mocktail/mocktail.dart';

// -- Shared
class MockFailureMapper extends Mock implements FailureMapper {}

// -- Core
class MockFailureHandler extends Mock implements RepositoryFailureHandler {}

class MockServerRemoteHandler extends Mock implements ServerRemoteHandler {}

class MockServerCall extends Mock {
  Future<Either<Failure, dynamic>> call(AuthenticationToken accessToken);
}

class MockServerAuthWrapper<T> extends Mock implements ServerAuthWrapper<T> {}

// -- Authentication
class MockRefreshTokenBundle extends Mock implements RefreshTokenBundle {}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockAuthenticationLocalDataSource extends Mock
    implements AuthenticationLocalDataSource {}

class MockAuthenticationRemoteDataSource extends Mock
    implements AuthenticationRemoteDataSource {}

// -- Third Party
class MockDio extends Mock implements Dio {}

class MockFileSystem extends Mock implements FileSystem {}

class MockFile extends Mock implements File {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}
