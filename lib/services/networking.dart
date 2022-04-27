import 'package:http/http.dart' as http;
import 'dart:convert';

class ClimaNetwork {
  ClimaNetwork(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('failed to load Api <-----> ${response.statusCode}');
    }
  }
}
