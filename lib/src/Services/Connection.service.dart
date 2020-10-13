class Connection {
  static final String host = 'graphqlzero.almansi.me';
  static final bool ssl = true;
  static final String endpoint = '$http://$host/api';
  static final String subscription = '$ws://$host/api';
  static get http => ssl ? 'https' : 'http';
  static get ws => ssl ? 'ws' : 'wss';
  static get mapboxToken =>
      'pk.eyJ1Ijoic2luZ2VyY29sIiwiYSI6ImNrZzdrazFsYzA4OGsyenBnOXEwcjkyb3UifQ.9Z3TtJ1YFJ1rk9WJt4D0rg';
}
