import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.url);
  // ignore: prefer_typing_uninitialized_variables
  late final String url;

  Future getData() async {
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      String data = res.body;
      return jsonDecode(data);
    } else {
      print('hello');
      print(res.statusCode);
    }
  }
}
