const getLaunches = r'''
  query GetRockets() {
    rockets() {
      id
      name
      description
    }
  }
''';