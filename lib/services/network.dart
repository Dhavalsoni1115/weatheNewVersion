import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  
  Future getLocation(String url) async {
    try {
      http.Response response;
      response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
       var data = response.body;
        print(data);
        return jsonDecode(data);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
