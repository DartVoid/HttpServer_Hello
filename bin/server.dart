import 'dart:io';


void main() {
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9090 : int.parse(portEnv);

  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, port).then((HttpServer server) {
    print('Listening on localhost, port ${server.port}');
    server.listen((HttpRequest request) {
      print("${new DateTime.now()}: Hello server output!");
      request.response.write('Hello world!');
      request.response.close();
    });
  }).catchError((e) => print(e.toString()));
}

