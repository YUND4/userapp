import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:userapp/src/Services/Connection.service.dart';

class ClientSingleton {
  final OptimisticCache cache = OptimisticCache(
    dataIdFromObject: typenameDataIdFromObject,
  );

  GraphQLClient _client;
  static final ClientSingleton _ClientSingleton = ClientSingleton._internal();

  factory ClientSingleton() {
    return _ClientSingleton;
  }

  GraphQLClient get client {
    if (_client == null) {
      final HttpLink _httpLink = HttpLink(
        uri: Connection.endpoint,
      );

      final AuthLink _authLink = AuthLink(getToken: () => '');

      final Link _link = _authLink.concat(_httpLink);

      _client = GraphQLClient(
        cache: cache,
        link: _link,
      );
    }
    return _client;
  }

  ClientSingleton._internal();
}
