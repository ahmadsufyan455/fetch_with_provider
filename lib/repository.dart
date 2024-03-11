import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_foxes/fox.dart';

class Repository {
  Future<Fox> getFoxImage() async {
    try {
      final response = await http.get(Uri.parse('https://randomfox.ca/floof/'));
      if (response.statusCode == 200) {
        return Fox.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      rethrow;
    }
  }
}
