class Endpoints {
  static const String host = '10.0.2.2';
  // static const String urlUAS = 'http://192.168.199.120:5000';

  static const String baseUAS = "http://$host:5000";

  //menu
  static const String menuRead = "$baseUAS/api/v1/menu/read";
  static const String menuCreate = "$baseUAS/api/v1/menu/create";
  static const String menuDelete = "$baseUAS/api/v1/menu/delete";

  //auth
  static const String login = "$baseUAS/api/v1/auth/login";
}
