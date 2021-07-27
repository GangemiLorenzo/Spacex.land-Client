import 'package:graphql/client.dart';
import 'package:spacex_land_client/api/api.dart';
import 'package:spacex_land_client/api/queries/queries.dart' as queries;

class GetLaunchesRequestFailure implements Exception {}

class LaunchesApiClient {
  LaunchesApiClient({GraphQLClient? graphQLClient})
      : assert(graphQLClient != null),
        _graphQLClient = graphQLClient!;

  factory LaunchesApiClient.create() {
    final HttpLink httpLink = HttpLink(
      'https://api.spacex.land/graphql/',
    );
    final link = Link.from([httpLink]);
    return LaunchesApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient _graphQLClient;

  Future<List<Launch>> getLaunches(String mission_name, int limit, int offset) async {
    final result = await _graphQLClient.query(
      QueryOptions(
          document: gql(queries.getLaunches),
          variables: {'mission_name': mission_name, 'limit':limit, 'offset': offset}),
    );
    if (result.hasException) {
      throw GetLaunchesRequestFailure();
    }
    if (result.data == null) {
      return List<Launch>.empty();
    }
    final data = result.data!['launches'] as List;
    return data.map((e) => Launch.fromJson(e)).toList();
  }
}
