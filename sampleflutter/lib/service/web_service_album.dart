import 'package:http/http.dart' as http;
import 'package:sampleflutter/models/album.dart';
import 'dart:async';
import 'dart:convert';

class WebServiceAlbum {
  static const mainUrl = 'https://jsonplaceholder.typicode.com/';

  static const Map<String, String>? headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<Album> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('${mainUrl}albums'),
      headers: headers,
      body: jsonEncode(<String, String>{
        'title': 'quidem molestiae enim"',
      }),
    );

    if (response.statusCode == 201) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
