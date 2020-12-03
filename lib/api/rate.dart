import 'package:http/http.dart' as http;
import 'dart:convert';

class RateApi {
  Future getData(String baseCurrency) async {
    String baseUrl = 'https://api.exchangeratesapi.io/latest';
    String url = baseUrl + '?' + 'base=$baseCurrency';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
