class Connection {
  static final String host = 'graphqlzero.almansi.me';
  static final bool ssl = true;
  static final String endpoint = '$http://$host/api';
  static final String subscription = '$ws://$host/api';
  static get http => ssl ? 'https' : 'http';
  static get ws => ssl ? 'ws' : 'wss';
}
