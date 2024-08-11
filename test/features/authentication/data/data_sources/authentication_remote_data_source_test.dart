import 'package:einblicke_shared_clients/einblicke_shared_clients.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures.dart';
import '../../../../mocks.dart';

void main() {
  late AuthenticationRemoteDataSourceImpl authenticationRemoteDataSourceImpl;
  late MockServerRemoteHandler mockServerRemoteHandler;

  setUp(() {
    mockServerRemoteHandler = MockServerRemoteHandler();
    authenticationRemoteDataSourceImpl = AuthenticationRemoteDataSourceImpl(
      serverRemoteHandler: mockServerRemoteHandler,
    );
  });

  setUpAll(() {
    registerFallbackValue(tFakeSecrets);
  });

  group("getNewTokenBundle()", () {
    test("should call the server to get a new [TokenBundle] and return it",
        () async {
// arrange
      when(() => mockServerRemoteHandler.post(
            path: any(named: "path"),
            body: any(named: "body"),
          )).thenAnswer((_) async => tTokenBundleMap);

      // act
      final result = await authenticationRemoteDataSourceImpl.getNewTokenBundle(
          refreshToken: tRefreshToken);

      // assert
      expect(result, tTokenBundle);
      verify(
        () => mockServerRemoteHandler.post(
          path: "/refresh_tokens",
          body: {"refresh_token": tRefreshTokenString},
        ),
      );
    });
  });

  group("signIn()", () {
    test(
        "should call the server to sign in the user and return a [TokenBundle]",
        () async {
      // arrange
      when(
        () => mockServerRemoteHandler.post(
          path: any(named: "path"),
          body: any(named: "body"),
          clientId: any(named: "clientId"),
          clientSecret: any(named: "clientSecret"),
        ),
      ).thenAnswer((_) async => tTokenBundleMap);

      // act
      final result = await authenticationRemoteDataSourceImpl.signIn(
        username: tUsername,
        password: tPassword,
        secrets: tFakeSecrets,
      );

      // assert
      expect(result, tTokenBundle);
      verify(
        () => mockServerRemoteHandler.post(
          path: "/sign_in",
          body: tSignInRequestMap,
          clientId: tFakeSecrets.clientId,
          clientSecret: tFakeSecrets.clientSecret,
        ),
      );
    });
  });
}
