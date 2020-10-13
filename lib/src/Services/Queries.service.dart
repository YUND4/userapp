import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql/src/core/query_options.dart';

class Queries {
  static String contactsQuery() => r'''
           {
            users {
              data {
                id
                name
                username
                email
                phone
                website
                address {
                  street
                  suite
                  city
                  zipcode
                  geo {
                    lat
                    lng
                  }
                }
              }
            }
          }
        ''';
}
