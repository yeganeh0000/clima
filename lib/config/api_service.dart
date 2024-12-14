
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {

  String url;

  ApiService({required this.url});

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      return decode;
    } else {
      print(response.statusCode);
    }
  }
}