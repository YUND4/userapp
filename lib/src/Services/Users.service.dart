import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:userapp/src/Services/Client.service.dart';

import 'Queries.service.dart';

class UserService {
  static Future<QueryResult> getContacts() async {
    final WatchQueryOptions _options = WatchQueryOptions(
      documentNode: gql(Queries.contactsQuery()),
    );

    return await ClientSingleton().client.query(_options);
  }
}
