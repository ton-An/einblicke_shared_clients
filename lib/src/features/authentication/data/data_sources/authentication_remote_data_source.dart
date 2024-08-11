import 'package:einblicke_shared/einblicke_shared.dart';
import 'package:einblicke_shared_clients/einblicke_shared_clients.dart';

/// {@template authentication_remote_data_source}
/// __Authentication Remote Data Source__ is the contract for the authentication related
/// remote data source operations.
/// {@endtemplate}
abstract class AuthenticationRemoteDataSource {
  ///{@macro authentication_remote_data_source}
  const AuthenticationRemoteDataSource();

  /// Signs in the user with the provided [username] and [password].
  ///
  /// Returns:
  /// - [TokenBundle]: containing authentication tokens
  ///
  /// Throws:
  /// - [UnauthorizedFailure]
  /// - [UserNotFoundFailure]
  /// - [DatabaseReadFailure]
  /// - [DioException]
  Future<TokenBundle> signIn({
    required String username,
    required String password,
    required Secrets secrets,
  });

  /// Refreshes the authentication tokens using the provided [refreshToken].
  ///
  /// Returns:
  /// - [TokenBundle]: containing authentication tokens
  ///
  /// Throws:
  /// - [UnauthorizedFailure]
  /// - [DioException]
  Future<TokenBundle> getNewTokenBundle({
    required AuthenticationToken refreshToken,
  });
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSourceImpl({
    required this.serverRemoteHandler,
  });

  final ServerRemoteHandler serverRemoteHandler;

  @override
  Future<TokenBundle> getNewTokenBundle(
      {required AuthenticationToken refreshToken}) async {
    final Map<String, String> requestMap = {
      "refresh_token": refreshToken.token,
    };

    final Map<String, dynamic> response = await serverRemoteHandler.post(
      path: "/refresh_tokens",
      body: requestMap,
    );

    return TokenBundle.fromJson(response);
  }

  @override
  Future<TokenBundle> signIn({
    required String username,
    required String password,
    required Secrets secrets,
  }) async {
    final Map<String, String> requestMap = {
      "username": username,
      "password": password,
    };

    final Map<String, dynamic> response = await serverRemoteHandler.post(
      path: "/sign_in",
      body: requestMap,
      clientId: secrets.clientId,
      clientSecret: secrets.clientSecret,
    );

    return TokenBundle.fromJson(response);
  }
}
