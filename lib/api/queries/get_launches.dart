const getLaunches = r'''
  query GetLaunches($mission_name: String!, $offset: Int! $limit: Int!) {
    launches(find: {mission_name: $mission_name}, limit: $limit, offset: $offset) {
      mission_name
      details
    }
  }
''';